// Patch to Text Patch converter
// Converts Patch in DOOM GFX format to LUA-compatible Text Patch code
// Code by LeoardoTheMutant

#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define COLORLIMIT 16

FILE *patchfile;
FILE *outputfile;
uint32_t columnPointer; //adress of the POST in a patch file
uint8_t currColor;      //color value of the current pixel

//Palette
uint8_t palette[COLORLIMIT];
uint8_t colorCount;

//header data
uint16_t patchWidth;
uint16_t patchHeight;
int16_t patchOffsetX;
int16_t patchOffsetY;

//POST (column) data
uint8_t rowstart; //Column top offset
uint8_t length;   //Length of column data
uint8_t dummy;    //dummy bytes

//Helper functions
uint8_t IsColorInPalette(const uint8_t c) {
	if (c == 0xFF) return 1; //ignore transparent color
	for (uint8_t x = 0; x < COLORLIMIT; x++) if (palette[x] == c) return 1;
	return 0;
}
uint8_t FindPaletteColorIndex(const uint8_t c) {
	if (c == 0xFF) return COLORLIMIT; //transparent color
	for (uint8_t x = 0; x < COLORLIMIT; x++) if (palette[x] == c) return x;
	return 0;
}

int main(int argc, char *argv[])
{
	//Read argv
	if (argc < 2)
	{
		printf("%s <patch_file>\n", argv[0]);
		puts("Convert the Patch in DOOM GFX Format to LUA-compatible Text Patch code");
		puts("Output will be written to ./OUTPUT.LUA");
		return 0;
	}

	//Initialize the palette
	colorCount = 0;
	for (uint8_t x = 0; x < COLORLIMIT; x++) palette[x] = 0;

	//
	// READ AND CONVERSION
	//

	patchfile = fopen(argv[1], "rb"); //Open file in read-only binary mode

	//failed to open?
	if (!patchfile) { puts("ERROR: Failed to open the patch file"); return 1; } 

	//read Patch's "metadata"
	fread(&patchWidth, 2, 1, patchfile); //image width
	fread(&patchHeight, 2, 1, patchfile); //image height
	fread(&patchOffsetX, 2, 1, patchfile); //image X offset
	fread(&patchOffsetY, 2, 1, patchfile); //image Y offset

	printf("Width: %hu\nHeight: %hu\nOffset X: %hd\nOffset Y: %hd\n\n", patchWidth, patchHeight, patchOffsetX, patchOffsetY);

	//prepare a table which will contain the patch image data
	uint8_t patchImage[patchHeight][patchWidth];
	//clear the table
	for (uint16_t y = 0; y < patchHeight; y++)
		for (uint16_t x = 0; x < patchWidth; x++)
			patchImage[y][x] = 32; //transparent pixel

	//table containing column data offsets
	uint32_t pointers[patchWidth];

	//read POST addresses (POST = Column data)
	for (uint16_t column = 0; column < patchWidth; column++)
	{
		fread(&columnPointer, 4, 1, patchfile);
		pointers[column] = columnPointer;
	}

	//iterate through POSTs

	//note that Patches describe image from top to bottom
	//and not from left to right as it's usually done
	for (uint16_t i = 0; i < patchWidth; i++)
	{
		//go to the POST's address in the file
		fseek(patchfile, pointers[i], SEEK_SET);

		rowstart = 0;

		while (rowstart != 0xFF)
		{
			//rowstart offset
			fread(&rowstart, 1, 1, patchfile);
			if (rowstart == 0xFF) break; //end of the POST

			fread(&length, 1, 1, patchfile); //length of this POST
			fread(&dummy, 1, 1, patchfile); //dummy byte

			//read pixel color data to the buffer
			for (uint8_t j = 0; j < length; j++)
			{
				fread(&currColor, 1, 1, patchfile);
				if (!IsColorInPalette(currColor)) { //If the color is new to us...
					if (colorCount == COLORLIMIT) {
						printf("ERROR: Graphic contains more than %d colors! Unable to convert", COLORLIMIT);
						return 1;
					}
					palette[colorCount++] = currColor; //...add color to the palette
				}
				patchImage[j + rowstart][i] = FindPaletteColorIndex(currColor); //read the pixel
			}

			fread(&dummy, 1, 1, patchfile); //dummy byte
		}
	}

	fclose(patchfile); //patch file close

	//debug
	/*
	puts("Patch Palette:");
	for (uint8_t color = 0; color < COLORLIMIT; color++) printf("%d ", palette[color]);
	puts("\nPatch Data:");
	for (uint16_t row = 0; row < patchHeight; row++)
	{
		for (uint16_t column = 0; column < patchWidth; column++) printf("%X", patchImage[row][column]);
		puts("");
	}
	return 0;
	*/

	//
	// OUTPUT
	//

	//generate the LUA-compatible table
	outputfile = fopen("OUTPUT.LUA", "w"); //create (or open existing) an output file
	if (!outputfile) //failed to create/open?
	{
		puts("ERROR: Failed to open an output file");
		return 1;
	}

	fprintf(outputfile, "local OUTPUT_TEXTPATCH = {\n\txoff = %hd,\n\tyoff = %hd,\n\tpalette = {{", patchOffsetX, patchOffsetY); //Table declaration, X offset, Y offset and the beginning of the palette table
	//Patch palette table
	for (uint8_t color = 0; color < COLORLIMIT; color++) {
		if (palette[color] == 0xFF) break;
		fprintf(outputfile, "%d", palette[color]);
		if ((color+1 < COLORLIMIT) && (palette[color + 1] != 0XFF)) fprintf(outputfile, ", ");
	}

	fprintf(outputfile, "}},\n\timage = {\n"); //close palette table, begin the image data table

	//Patch data table
	for (uint16_t row = 0; row < patchHeight; row++)
	{
		fprintf(outputfile, "\t\t\""); //start of the row line
		for (uint16_t column = 0; column < patchWidth; column++)
		{
			switch (patchImage[row][column]) {
				case 32:
					fprintf(outputfile, " "); //transparent pixel
					break;
				default:
					fprintf(outputfile, "%X", patchImage[row][column]);
					break;
			}
		}
		if (row == (patchHeight - 1)) fprintf(outputfile, "\"\n"); //last row in the table
		else fprintf(outputfile, "\",\n"); //end of the row line
	}
	fprintf(outputfile, "\t}\n}\n"); //end of the data table and the entire Text Patch table

	fclose(outputfile); //output file close

	puts("Output written to ./OUTPUT.LUA");

	return 0;
}
