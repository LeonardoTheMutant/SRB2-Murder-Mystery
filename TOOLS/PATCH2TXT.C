// UNFINISHED PROGRAM!

// Patch to Text converter
// Converts the Patch in DOOM GFX format to LUA-compatible code
// Code by LeoardoTheMutant

#include <stdio.h>

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("PATCH2TXT [patch_file] -c\n");
        printf("Convert the Patch in DOOM GFX Format to LUA-compatible code\n");
		printf("Output will be written to ./OUTPUT.LUA\n");
        printf("\n -c  Compress the output by converting some of the Escape Codes\n     to printable characters (\"\\x41\" - \"A\", \"\\x42\" - \"B\" etc.)\n");
		printf"\nPlease note that this program is unfinished and generates\nthe garbage grafics output!\n");
        return 0;
    }

    FILE *patchfile = fopen(argv[1], "rb"); //Open file in binary
	FILE *outputfile;
    uint32_t filesize;
	uint32_t colPointer;
	uint16_t rowPointer;
	uint8_t currPixel;

    if (patchfile == NULL) //failed to open?
    {
        printf("ERROR: File open failed\n");
        return 1;
    }

    //calculate the file size
    fseek(patchfile, 0, SEEK_END); //set the cursor to the end
    filesize = ftell(patchfile); //get the last position in the file (its file size)
    fseek(patchfile, 0, SEEK_SET); //set the cursor back to the beginning

	//header data
    uint16_t patchWidth;
    uint16_t patchHeight;
    uint16_t patchOffsetX;
    uint16_t patchOffsetY;

	//column data
	uint8_t topdelta;   //Column top offset
	uint8_t length;     //Length of column data
	uint8_t padding1;   //padding byte
	uint8_t padding2_1; //column end data byte 1
	uint8_t padding2_2; //column end data byte 2


    //get the image width
	fread(&patchWidth, 2, 1, patchfile);

    //image height
    fread(&patchHeight, 2, 1, patchfile);

    //image X offset
    fread(&patchOffsetX, 2, 1, patchfile);

    //image Y offset
    fread(&patchOffsetY, 2, 1, patchfile);

	printf("Width: %hu\nHeight: %hu\nOffset X: %hu\nOffset Y: %hu\n", patchWidth, patchHeight, patchOffsetX, patchOffsetY);

	//create a table which contains the column pixel data;
	uint8_t pixels[patchWidth][patchHeight];
	//table containing column data offsets
	uint32_t pointers[patchWidth];

	//read column offset addresses
	for (uint16_t column = 0; column < patchWidth; column++)
	{
		fread(&colPointer, 4, 1, patchfile);
		pointers[column] = colPointer;
	}

	//read the column data
	for (uint16_t column = 0; column < patchWidth; column++)
	{
		//go to the column's address
		fseek(patchfile, pointers[column], SEEK_SET);

		rowPointer = 0;

		//topdelta offset
		fread(&topdelta, 1, 1, patchfile);
		if (topdelta == 0xFF) break; //end of the file
		//write the beginning transparent pixels to the buffer
		for (uint8_t offset = 0; offset < topdelta; offset++)
		{
			pixels[rowPointer][column] = 0xFF;
			rowPointer++;
		}

		fread(&length, 1, 1, patchfile);
		fread(&padding1, 1, 1, patchfile); //dummy byte
		//read pixel color data to the buffer
		for (uint8_t colPixel = 0; colPixel < length; colPixel++)
		{
			fread(&currPixel, 1, 1, patchfile);
			pixels[rowPointer][column] = currPixel;
			rowPointer++;
		}

		fread(&padding2_1, 1, 1, patchfile); //dummy byte
		fread(&padding2_2, 1, 1, patchfile); //dummy byte
	}

	fclose(patchfile); //file close

	//generate the LUA-compatible table

	outputfile = fopen("OUTPUT.LUA", "w");
	fprintf(outputfile, "local OUTPUT_TBL = {\n\t[\"BMP_BITMAP\"] = {\n"); //table declaration
	for (uint32_t row = 0; row < patchHeight; row++)
	{
		fprintf(outputfile, "\t\t\""); //start of the row line
		for (uint32_t column = 0; column < patchWidth; column++)
		{
			currPixel = pixels[row][column];
			printf("%X ", currPixel);
			if (((currPixel >= 71) && (currPixel <= 90) && (currPixel >= 97) && (currPixel <= 122)) && ((argc == 3) && (argv[2][0] == '-'))) //check if the compressiion option enabled (dash would be enough)
			{
				//compression enabled, type the printable character
				fprintf(outputfile, "%c", currPixel);
			} else {
				//write in HEX format
				if (currPixel < 0x10) fprintf(outputfile, "\\x0%X", currPixel);
				else fprintf(outputfile, "\\x%X", currPixel);
			}
		}
		printf("\n");
		fprintf(outputfile, "\",\n"); //end of the row line
	}
	fprintf(outputfile, "\t}\n}\n"); //end of the table

    return 0;
}
