// Patch to Text converter
// Converts the Patch in DOOM GFX format to LUA-compatible code
// Code by LeoardoTheMutant

#include <stdio.h>

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

FILE *patchfile;
FILE *outputfile;
uint32_t columnPointer;
uint8_t currPixel;

//header data
uint16_t patchWidth;
uint16_t patchHeight;
uint16_t patchOffsetX;
uint16_t patchOffsetY;

//POST (column) data
uint8_t rowstart; //Column top offset
uint8_t length;   //Length of column data
uint8_t dummy;    //dummy bytes 

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("PATCH2TXT [patch_file] [-c]\n");
        printf("Convert the Patch in DOOM GFX Format to LUA-compatible code\n");
		printf("Output will be written to ./OUTPUT.LUA\n");
        printf("\n -c  Compress the output by converting some of the Escape Codes\n     to printable characters (\"\\x41\" - \"A\", \"\\x42\" - \"B\" etc.)\n");
        return 0;
    }

    patchfile = fopen(argv[1], "rb"); //Open file in read-only binary mode
	
    if (patchfile == NULL) //failed to open?
    {
        printf("ERROR: Failed to open the patch file\n");
        return 1;
    }

    //get the image width
	fread(&patchWidth, 2, 1, patchfile);

    //image height
    fread(&patchHeight, 2, 1, patchfile);

    //image X offset
    fread(&patchOffsetX, 2, 1, patchfile);

    //image Y offset
    fread(&patchOffsetY, 2, 1, patchfile);

	printf("Width: %hu\nHeight: %hu\nOffset X: %hu\nOffset Y: %hu\n\n", patchWidth, patchHeight, patchOffsetX, patchOffsetY);

	//prepare a table which contains the end picture
	uint8_t pixels[patchWidth][patchHeight];
	for (uint16_t y = 0; y < patchHeight; y++) for (uint16_t x = 0; x < patchWidth; x++) pixels[y][x] = 0xFF; //transparent pixel

	//table containing column data offsets
	uint32_t pointers[patchWidth];

	//read column offset addresses
	for (uint16_t column = 0; column < patchWidth; column++)
	{
		fread(&columnPointer, 4, 1, patchfile);
		pointers[column] = columnPointer;
	}

	//iterate through POSTs
	for (uint16_t i = 0; i < patchWidth; i++)
	{
		//go to the column's address
		fseek(patchfile, pointers[i], SEEK_SET);

		rowstart = 0;

		while (rowstart != 0xFF)
		{
			//rowstart offset
			fread(&rowstart, 1, 1, patchfile);
			if (rowstart == 0xFF) break; //end of the file

			fread(&length, 1, 1, patchfile); //length of this POST
			fread(&dummy, 1, 1, patchfile); //dummy byte
			//read pixel color data to the buffer
			for (uint8_t j = 0; j < length; j++)
			{
				fread(&currPixel, 1, 1, patchfile);
				pixels[j + rowstart][i] = currPixel;
			}

			fread(&dummy, 1, 1, patchfile); //dummy byte
		}
	}

	fclose(patchfile); //patch file close

	//generate the LUA-compatible table
	outputfile = fopen("OUTPUT.LUA", "w"); //create an output file
	if (outputfile == NULL) //failed to create?
	{
		printf("ERROR: Failed to open an output file\n");
        return 1;
	}

	printf("Pixel data:\n");
	fprintf(outputfile, "local OUTPUT_BITMAP = {\n"); //table declaration
	for (uint32_t row = 0; row < patchHeight; row++)
	{
		fprintf(outputfile, "\t\""); //start of the row line
		for (uint32_t column = 0; column < patchWidth; column++)
		{
			currPixel = pixels[row][column];
			printf("%X ", currPixel);
			if ((((currPixel >= 0x47) && (currPixel <= 0x5A)) || ((currPixel >= 0x67) && (currPixel <= 0x7A))) && ((argc > 2) && (argv[2][0] == '-'))) //check if the compressiion option enabled (dash would be enough)
			{
				//compression enabled, type the printable character
				fprintf(outputfile, "%c", currPixel);
			} else {
				//write in HEX format
				if (currPixel < 0x10) fprintf(outputfile, "\\x0%X", currPixel); //add missing zero
				else fprintf(outputfile, "\\x%X", currPixel);
			}
		}
		printf("\n");
		fprintf(outputfile, "\",\n"); //end of the row line
	}
	fprintf(outputfile, "}\n"); //end of the table

	printf("\nOutput written to ./OUTPUT.LUA\n");

    return 0;
}
