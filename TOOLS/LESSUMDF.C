//"Less UMDF"
//Utility to compress UMDF map's data by removing unnesesary characters from the TEXTMAP lump
//Code by LeonardoTheMutant

// LIMITAIONS OF THIS TOOL
//
// - Supports WADs with only one TEXTMAP lump inside;

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *inputWAD;
FILE *outputWAD;

int buffer; //multi purpose variable
char buffer_str[0x400];

int TEXTMAP_id;
char* TEXTMAP_newdata;
int TEXTMAP_oldsize;

struct WADfile_s {
    char type; //0 - PWAD; 1- IWAD
    int filesAmount;
    int directory_adress;
} WADfile;

struct file_s {
    char name[8];
    int adress;
    int size;
    char *data;
} files[0xffff]; //WADs supports up to 2^32 files (in theory) but we'll limit to 65536 files here

char isspace(char c)
{
    if (c == 0x20 || c == 0x09 || c >= 0x0a && c <=0x0d) return 1;
    return 0;
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("%s [file.wad]\n\n", argv[0]);
        puts("Compress the UMDF map data in WAD by removing unnesesary characters from the TEXTMAP lump");
        puts("Output will be written to ./OUTPUT.WAD");
        puts("\nMake sure to have a copy of the old file - new file can have corruptions!");
        return 0;
    }

    //
    // WAD READING AND EXTRACTING
    //
    
    inputWAD = fopen(argv[1], "rb");
    if (!inputWAD)
    {
    	fprintf(stderr, "ERROR: Failed to open the WAD file\n");
    	return 1;
    }

    //read the type of WAD
    fread(&buffer_str, 4, 1, inputWAD);
    if (buffer_str[0] == 'P')
    { 
        WADfile.type = 0; //PWAD
        printf("Reading PWAD...\n");
    } else {
        WADfile.type = 1; //IWAD
        puts("WARNING: IWADs are not supported by this program - output WAD may be unreadable by the game engine!");
    }

    fread(&WADfile.filesAmount, 4, 1, inputWAD);
    printf("%d files in WAD\n", WADfile.filesAmount);

    fread(&WADfile.directory_adress, 4, 1, inputWAD);

    printf("Jumping to the WAD's Directory Table at %d (0x%02X)...\n", WADfile.directory_adress, WADfile.directory_adress);
    fseek(inputWAD, WADfile.directory_adress, SEEK_SET);

    //read the WAD directory data
    for (int fileID = 0; fileID < WADfile.filesAmount; fileID++)
    {
        //read lump address
        fread(&buffer, 4, 1, inputWAD);
        files[fileID].adress = buffer;

        //lump size
        fread(&buffer, 4, 1, inputWAD);
        files[fileID].size = buffer;

        //lump name
        fread(&buffer_str, 8, 1, inputWAD);
        memcpy(&files[fileID].name, &buffer_str, 8);
    }

    //iterate throught files
    buffer = 0;
    for (unsigned int fileID = 0; fileID < WADfile.filesAmount; fileID++)
    {
        if (!strcmp(files[fileID].name, "TEXTMAP")) //Found TEXTMAP lump
        {
            puts("Found TEXTMAP lump");
            buffer = 1; //map has UMDF map
            TEXTMAP_id = fileID;
            fseek(inputWAD, files[fileID].adress, SEEK_SET);
            TEXTMAP_oldsize = files[fileID].size;
            files[TEXTMAP_id].data = (char*) calloc(files[fileID].size, sizeof(char));
            TEXTMAP_newdata = (char*) calloc(files[fileID].size, sizeof(char));
            fread(files[TEXTMAP_id].data, files[fileID].size, 1, inputWAD);
        }
    }

    if (!buffer)
    {
        fprintf(stderr, "TEXTMAP lump was not found. Are you sure the WAD contains a map in UMDF?\n");
        return 1;
    }

    //
    // TEXTMAP MODIFICATION
    //

    files[TEXTMAP_id].size = 0;
    puts("Modifying the TEXTMAP lump...");
    char *line = strtok(files[TEXTMAP_id].data, "\n");
    buffer = 0; //0x1 - currently in block; 0x2 - currently in string

    while (line)
    {
        //remove comments
        char *comment = strstr(line, "//");
        if (comment) *comment = '\0'; // Truncate the line before the comment

        // Trim leading and trailing whitespace
        char *start = line;
        while (isspace((unsigned char)*start)) *start++;
        char *end = line + strlen(line) - 1;
        while (end > start && isspace((unsigned char)*end)) end--;
        *(end + 1) = '\0';

        //remove spaces where they are not required
        char *writePtr = start;
        for (char *readPtr = start; *readPtr; readPtr++) {
            if (*readPtr == '\"') buffer ^= 2; //entered/left the string
            if (!isspace((unsigned char)*readPtr) || (buffer & 2)) { //remove the space ONLY when its outside the string
                *writePtr++ = *readPtr;
            }
        }
        *writePtr = '\0';

        // Check if the line is empty
        if (strlen(start) == 0) {
            line = strtok(NULL, "\n");
            continue;
        }

        // Determine if we are entering or exiting a block
        if (strstr(start, "thing") || strstr(start, "vertex") || strstr(start, "linedef") || strstr(start, "sidedef") || strstr(start, "sector")) buffer |= 1; //entered the block
        if (strchr(start, '}')) buffer &= ~1; //left the block

        // If not in a block - add newline, otherwise concatenate the other lines into one
        files[TEXTMAP_id].size += sprintf(buffer_str, "%s%s", start, (buffer & 1) ? "" : "\n");
        strcat(TEXTMAP_newdata, buffer_str);

        line = strtok(NULL, "\n");
    }

    printf("Old TEXTMAP size: %d\n", TEXTMAP_oldsize);
    printf("New TEXTMAP size: %d\n", files[TEXTMAP_id].size);

    //
    // MAKING THE NEW WAD FILE
    //

    outputWAD = fopen("./OUTPUT.WAD", "wb");
    if (!outputWAD)
    {
    	fprintf(stderr, "ERROR: Failed to open ./OUTPUT.WAD file\n");
    	return 1;
    }

    puts("Writing new header data...");
    //write WAD header
    fwrite(WADfile.type ? "IWAD" : "PWAD", 4, 1, outputWAD); //WAD type
    fwrite(&WADfile.filesAmount, 4, 1, outputWAD); //Amount of files
    //write a dummy directory table address, it will be corrected later
    putc(12, outputWAD);
    for (unsigned char x=0; x<3; x++) putc(0, outputWAD);

    //write the new TEXTMAP lump
    puts("Writing the new TEXTMAP data...");
    fwrite(TEXTMAP_newdata, files[TEXTMAP_id].size, 1, outputWAD);

    //copy everything else from the Input WAD to the Output WAD until the directory table
    puts("Copying other data into the new WAD...");
    fseek(inputWAD, files[TEXTMAP_id + 1].adress, SEEK_SET);
    while (ftell(inputWAD) < WADfile.directory_adress)
    {
        fread(&buffer_str, sizeof(buffer_str), 1, inputWAD);
        fwrite(&buffer_str, sizeof(buffer_str), 1, outputWAD);
    }

    buffer = ftell(outputWAD); //get the adress of the new Directory Table
    fseek(outputWAD, 0x08, SEEK_SET); //get back to the befinning of the WAD to correct the adress;
    fwrite(&buffer, 4, 1, outputWAD);
    fseek(outputWAD, buffer, SEEK_SET); //now we are back at the Directory Table

    //write the new directory table
    puts("Writing new Directory Table:");
    buffer = 12; //our adress offset counter
    puts("\nID   ADRESS     SIZE     NAME");
    for (unsigned int fileID = 0; fileID < WADfile.filesAmount; fileID++)
    {
        printf("%2d % 8d % 8d %8s\n", fileID, files[fileID].adress, files[fileID].size, files[fileID].name);
        fwrite(&buffer, 4, 1, outputWAD); //adress
        buffer += files[fileID].size; //calculate the new adress of the next file
        fwrite(&files[fileID].size, 4, 1, outputWAD); //size
        fwrite(&files[fileID].name, 8, 1, outputWAD); //name
    }

    fclose(inputWAD);
    fclose(outputWAD);
    
    puts("\n./OUTPUT.WAD is ready. Make sure to check the map for corruptions!");
    return 0;
}
