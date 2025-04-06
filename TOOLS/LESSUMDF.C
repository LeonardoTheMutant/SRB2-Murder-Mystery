//"Less UMDF"
//Utility to compress UMDF map's data by removing unnesesary characters from the TEXTMAP lump
//Code by LeonardoTheMutant

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

FILE *inputWAD;
FILE *outputWAD;
char outputFilePath[0xFF] = "./OUTPUT.WAD";

int buffer; //multi purpose variable
char buffer_str[0x400];
char* LUMP_BUFFER;
char* MODIFIED_BUFFER;

int TEXTMAP_oldsize; //serves no real purpose other than to give the file size information to user

struct {
    char type; //0 - PWAD; 1- IWAD
    int lumpsAmount;
    int directory_adress;
} WADfile;

typedef struct lump_s {
    char name[8];
    int adress;
    int size;
} lump_t;

lump_t* lumps;

void closeIO()
{
    fclose(inputWAD);
    fclose(outputWAD);
}

char isspace(char c)
{
    if (c == 0x20 || c == 0x09 || c >= 0x0a && c <=0x0d) return 1;
    return 0;
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("%s [file.wad] -o [output.wad]\n\n", argv[0]);
        puts("Compress the UMDF map data in WAD by removing unnesesary characters from the TEXTMAP lumps");
        puts("\t-o   Output to the file. If not given, the output will be written to ./OUTPUT.WAD");
        puts("\nMake sure to have a copy of the old file - new file can have corruptions!");
        return 0;
    } else {
        buffer = 0;
        for (unsigned char x = 0; x < argc; x++)
        {
            if (!strcmp(argv[x], "-o"))
            {
                buffer = 1; //next argument is the Output Filepath
                continue;
            }
            if (buffer)
            {
                strcpy(outputFilePath, argv[x]); //Output Filepath
                buffer = 0;
            } else {
                strcpy(buffer_str, argv[x]); //Input Filepath
            }
        }
    }

    //
    // WAD READING AND MAKING THE HEADER OF THE OUTPUT WAD
    //
    
    inputWAD = fopen(buffer_str, "rb");
    if (!inputWAD)
    {
    	fprintf(stderr, "ERROR: Failed to open the WAD file\n");
    	return 1;
    }

    outputWAD = fopen(outputFilePath, "wb");
    if (!outputWAD)
    {
    	fprintf(stderr, "ERROR: Failed to open %s file\n", outputFilePath);
        fclose(inputWAD);
    	return 1;
    }

    //read the type of WAD
    fread(&buffer_str, 4, 1, inputWAD); //read from Input WAD
    fwrite(buffer_str, 4, 1, outputWAD); //write to Output WAD

    //read the amount of lumps in WAD and allocate memory for the lump buffer
    fread(&WADfile.lumpsAmount, 4, 1, inputWAD);
    printf("%d lumps in WAD\n", WADfile.lumpsAmount);
    lumps = (lump_t*) malloc(sizeof(lump_t) * WADfile.lumpsAmount);
    if (!lumps)
    {
        fprintf(stderr, "Failed to allocate memory for the WAD lumps buffer");
        closeIO();
        return 1;
    }
    fwrite(&WADfile.lumpsAmount, 4, 1, outputWAD);

    //read the directory table adress
    fread(&WADfile.directory_adress, 4, 1, inputWAD);
    printf("Directory Table of the Input WAD located at %d (0x%02X)...\n", WADfile.directory_adress, WADfile.directory_adress);
    fseek(inputWAD, WADfile.directory_adress, SEEK_SET); //jump to the Directory Table in Input WAD
    //write a dummy directory table address to the Output WAD, it will be corrected later
    putc(0x0C, outputWAD);
    for (unsigned char x=0; x<3; x++) putc(0, outputWAD);

    //read the WAD lump metadata
    for (int lump = 0; lump < WADfile.lumpsAmount; lump++)
    {
        fread(&lumps[lump].adress, 4, 1, inputWAD); //lump address
        fread(&lumps[lump].size, 4, 1, inputWAD); //lump size
        fread(lumps[lump].name, 8, 1, inputWAD); //lump name
    }

    //
    // MODIFY & WRITE LUMPS TO THE OUTPUT WAD
    //
    
    //itterate through every lump in Input WAD
    fseek(inputWAD, 0x0C, SEEK_SET); //Jump back to the actuall lump data
    for (int lump = 0; lump < WADfile.lumpsAmount; lump++)
    {
        lumps[lump].adress = ftell(outputWAD);
        if (strncmp(lumps[lump].name, "TEXTMAP", 8)) //Lump is not TEXTMAP, copy the lump contents to the Output WAD unmodified
        {
            LUMP_BUFFER = (char*) malloc(lumps[lump].size);
            if (!LUMP_BUFFER)
            {
                fprintf(stderr, "Failed to allocate memory for the lump buffer (lump %d)\n", lump);
                closeIO();
                return 1;
            }
            fread(LUMP_BUFFER, lumps[lump].size, 1, inputWAD);
            fwrite(LUMP_BUFFER, lumps[lump].size, 1, outputWAD);
            free(LUMP_BUFFER);
        }
        else //Found the TEXTMAP lump, modify it and then write to the Output WAD
        {
            printf("\nModifying TEXTMAP of %s...\n", lumps[lump - 1].name);
            TEXTMAP_oldsize = lumps[lump].size; //size of the TEXTMAP lump before modification

            //copy the contents of the TEXTMAP from Input WAD to RAM
            LUMP_BUFFER = (char*) malloc(lumps[lump].size);
            if (!LUMP_BUFFER)
            {
                fprintf(stderr, "Failed to allocate memory for the TEXTMAP contents buffer (lump %d, map %s)\n", lump, lumps[lump - 1].name);
                closeIO();
                return 1;
            }
            fread(LUMP_BUFFER, lumps[lump].size, 1, inputWAD);

            //prepare the buffer for the modified TEXTMAP
            MODIFIED_BUFFER = (char*) calloc(1, lumps[lump].size);
            if (!MODIFIED_BUFFER)
            {
                fprintf(stderr, "Failed to allocate memory for the lump buffer\n");
                closeIO();
                return 1;
            }
            lumps[lump].size = 0;

            //Modify the lump
            char *line = strtok(LUMP_BUFFER, "\n");
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
                if (!strlen(start)) {
                    line = strtok(NULL, "\n");
                    continue;
                }

                // Determine if we are entering or exiting a block
                if (strstr(start, "thing") || strstr(start, "vertex") || strstr(start, "linedef") || strstr(start, "sidedef") || strstr(start, "sector")) buffer |= 1; //entered the block
                if (strchr(start, '}')) buffer &= ~1; //left the block

                // If not in a block - add newline, otherwise concatenate the other lines into one
                lumps[lump].size += sprintf(buffer_str, "%s%s", start, (buffer & 1) ? "" : "\n");
                strcat(MODIFIED_BUFFER, buffer_str);

                line = strtok(NULL, "\n");
            }

            printf("Old size: %d bytes\n", TEXTMAP_oldsize);
            printf("New size: %d bytes\n", lumps[lump].size);

            //write the modified TEXTMAP lump
            puts("Writing the modified TEXTMAP data...\n");
            fwrite(MODIFIED_BUFFER, lumps[lump].size, 1, outputWAD);
            free(LUMP_BUFFER);
            free(MODIFIED_BUFFER);
        }
    }

    buffer = ftell(outputWAD); //get the adress of the new Directory Table
    fseek(outputWAD, 0x08, SEEK_SET); //get back to the befinning of the Output WAD to correct the table adress;
    fwrite(&buffer, 4, 1, outputWAD);
    fseek(outputWAD, buffer, SEEK_SET); //now we are back at the Directory Table

    //write the new directory table
    puts("Directory Table of Output WAD:");
    puts("\nID   ADRESS     SIZE     NAME");
    for (unsigned int lump = 0; lump < WADfile.lumpsAmount; lump++)
    {
        printf("%2d % 8d % 8d %8s\n", lump, lumps[lump].adress, lumps[lump].size, lumps[lump].name);
        fwrite(&lumps[lump].adress, 4, 1, outputWAD); //adress
        fwrite(&lumps[lump].size, 4, 1, outputWAD); //size
        fwrite(lumps[lump].name, 8, 1, outputWAD); //name
    }

    closeIO();
    
    printf("\n%s is ready. Make sure to check the map for corruptions!\n", outputFilePath);
    return 0;
}
