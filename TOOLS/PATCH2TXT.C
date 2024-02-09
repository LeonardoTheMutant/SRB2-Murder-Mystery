//UNFINISHED PROGRAM!!!

// Patch to Text converter
// Converts the Patch in DOOM GFX format to LUA-compatible code
// Code by LeoardoTheMutant

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("PATCH2TXT [patch_file] -c\n");
        printf("Convert the Patch in DOOM GFX Format to LUA-compatible code\n");
        printf("\n -c  Compress the output by converting some of the Escape Codes\n     to printable characters (\"\\x41\" - \"A\", \"\\x42\" - \"B\" etc.)\n");
        return 0;
    }

    FILE *patchfile = fopen(argv[1], "r"); //Open file
    char *buffer; //the output buffer
    uint32_t filesize;
    size_t n = 0; //the buffer cursor
    uint8_t c; //patch file byte read

    if (patchfile == NULL) //failed to open?
    {
        printf("ERROR: Can not open file\n");
        return 1;
    }

    //calculate the file size
    fseek(patchfile, 0, SEEK_END); //set the cursor to the end
    filesize = ftell(patchfile); //get the last position in the file (its file size)
    fseek(patchfile, 0, SEEK_SET); //set the cursor back to the beginning
    buffer = (char*) malloc(filesize); //free-up the buffer memory

    uint32_t headerByte1;
    uint32_t headerByte2;

    uint32_t patchWidth;
    uint32_t patchHeight;
    uint32_t patchOffsetX;
    uint32_t patchOffsetY;

    //get the image width
    headerByte1 = fgetc(patchfile); //read byte 1
    headerByte2 = fgetc(patchfile); //read byte 2
    patchWidth = headerByte1 + (headerByte2 << 8); //calculate the final result

    //image height
    headerByte1 = fgetc(patchfile);
    headerByte2 = fgetc(patchfile);
    patchHeight = headerByte1 + (headerByte2 << 8);

    //image X offset
    headerByte1 = fgetc(patchfile);
    headerByte2 = fgetc(patchfile);
    patchOffsetX = headerByte1 + (headerByte2 << 8);

    //image Y offset
    headerByte1 = fgetc(patchfile);
    headerByte2 = fgetc(patchfile);
    patchOffsetY = headerByte1 + (headerByte2 << 8);
    
    while ((c = fgetc(patchfile)) != EOF) //read till the End Of File
    {
        printf("%d ", c);
        //if ((argc >= 3) && (strcmp(argv[2], "-c") == 0)) //is compression enabled?
        //{
        //    buffer[n++] = c;
        //}
    }
    //buffer[n] = '\0'; //End the output with the termitation symbol

    return 0;
}