// Patch to Text converter
// Converts the Patch in DOOM GFX format to LUA-compatible code
// Code by LeoardoTheMutant

#include <stdio.h>
#include <string.h>

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

FILE *patchfile;
FILE *outputfile;
uint8_t compressionARG = 0; //Enable output compression
uint8_t argvIndex;
uint32_t columnPointer; //adress of the POST in a patch file
uint8_t currPixel;      //value of the current pixel
uint8_t hexWritten;     //Number of Hexadecimal numbers written to the output file in a row

//header data
uint16_t patchWidth;
uint16_t patchHeight;
int16_t patchOffsetX;
int16_t patchOffsetY;

//POST (column) data
uint8_t rowstart; //Column top offset
uint8_t length;   //Length of column data
uint8_t dummy;    //dummy bytes 

int main(int argc, char *argv[])
{
	//Read argv
	if (argc < 2)
	{
		printf("%s patch_file [-c]\n", argv[0]);
		printf("Convert the Patch in DOOM GFX Format to LUA-compatible code\n");
		printf("Output will be written to ./OUTPUT.LUA\n");
		printf("\n -c  Compress the output by converting some of the Escape Codes\n     to printable characters (\"\\x41\" - \"A\", \"\\x42\" - \"B\" etc.)\n");
		return 0;
	} else {
		for (uint8_t x = 0; x < argc; x++)
		{
			if (!strcmp(argv[x], "-c")) compressionARG = 1;
			else argvIndex = x;
		}
	}

	//
	// READ AND CONVERSION
	//

	patchfile = fopen(argv[argvIndex], "rb"); //Open file in read-only binary mode

	if (!patchfile) //failed to open?
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

	printf("Width: %hu\nHeight: %hu\nOffset X: %hd\nOffset Y: %hd\n\n", patchWidth, patchHeight, patchOffsetX, patchOffsetY);

	//prepare a table which will contain the pixels data
	uint8_t pixels[patchHeight][patchWidth];
	//clear the table
	for (uint16_t y = 0; y < patchHeight; y++)
		for (uint16_t x = 0; x < patchWidth; x++)
			pixels[y][x] = 0xFF; //transparent pixel

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
				fread(&currPixel, 1, 1, patchfile);
				pixels[j + rowstart][i] = currPixel;
			}

			fread(&dummy, 1, 1, patchfile); //dummy byte
		}
	}

	fclose(patchfile); //patch file close

	//debug
	/*
	printf("Pixel data:\n");
	for (uint32_t row = 0; row < patchHeight; row++)
	{
		for (uint32_t column = 0; column < patchWidth; column++) printf("%X ", currPixel);
		printf("\n");
	}
	*/

	//
	// OUTPUT
	//

	//generate the LUA-compatible table
	outputfile = fopen("OUTPUT.LUA", "w"); //create (or open existing) an output file
	if (outputfile == NULL) //failed to create/open?
	{
		printf("ERROR: Failed to open an output file\n");
		return 1;
	}

	//Bitmap info table
	fprintf(outputfile, "local OUTPUT_BITMAP_INFO = {\n"); //Table declaration
	fprintf(outputfile, "\txoff = %hd,\n", patchOffsetX);  //X offset
	fprintf(outputfile, "\tyoff = %hd\n", patchOffsetY);   //Y offset
	fprintf(outputfile, "}\n");                            //end of the table

	//Bitmap table
	fprintf(outputfile, "local OUTPUT_BITMAP = {\n"); //Table declaration
	for (uint32_t row = 0; row < patchHeight; row++)
	{
		fprintf(outputfile, "\t\""); //start of the row line
		hexWritten = 0;
		for (uint32_t column = 0; column < patchWidth; column++)
		{
			currPixel = pixels[row][column];
			if ((((currPixel >= 0x20) && (currPixel <= 0x2F)) || ((currPixel >= 0x47) && (currPixel <= 0x5A)) || ((currPixel >= 0x67) && (currPixel <= 0x7A))) && compressionARG) //check if the compressiion option enabled
			{
				//compression enabled, type the printable character
				if (hexWritten && (((currPixel >= 0x41) && (currPixel <= 0x46)) || ((currPixel >= 0x61) && (currPixel <= 0x66))))
				{ //Previos pixel value was written in Hex format, we don't want A-F and a-f symbols to create troubles after that
					fprintf(outputfile, "\"..\"");
				}
				fprintf(outputfile, "%c", currPixel);
				hexWritten = 0;
			} else {
				//compression is disabled or non-convertable symbol, write as number
				if ((currPixel < 100) && !(hexWritten & 1)) {
					//print as integer
					fprintf(outputfile, "\\%d", currPixel);
					hexWritten = 0;
				} else {
					//print as HEX
					if (hexWritten & 1) fprintf(outputfile, "%02X", currPixel); //We are allowed to write another value to make a 16-bit code
					else fprintf(outputfile, "\\x%02X", currPixel); //Writing an 8-bit Escape Code (or the beginning of 16-bit code)
					hexWritten++;
				}
			}
		}
		fprintf(outputfile, "\",\n"); //end of the row line
	}
	fprintf(outputfile, "}\n"); //end of the table

	fclose(outputfile); //output file close

	printf("Output written to ./OUTPUT.LUA\n");

	return 0;
}
