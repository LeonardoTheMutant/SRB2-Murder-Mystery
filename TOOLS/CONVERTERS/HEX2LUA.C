//Hex to LUA-string converter
//Converts the "raw" HEX data to LUA/C-compatible string
//Code by LeonardoTheMutant

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char str_symbol[3];
int int_symbol;

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("HEX2LUA [raw_hex_data] [-c]\n");
        printf("Convert the raw hexadecimal data to C or LUA-compatible code\n");
        printf("\n -c  Compress the output by converting some of the Escape Codes\n     to printable characters (\"\\x41\" - \"A\", \"\\x42\" - \"B\" etc.)\n");
        return 0;
    }

    for (int i = 0; i < (strlen(argv[1]) >> 1); i++)
    {
        strncpy(str_symbol, (argv[1] + (i*2)), 2); //extract the 2-digit hexadecimal number from the user input
        int_symbol = (int)strtol(str_symbol, NULL, 16); //since we extracted the number as a Cstring we need it in INT form
        if ((int_symbol >= 0x20) && (int_symbol < 127) && ((argc > 2) && (argv[2][0] == '-')))
        {
            //compression enabled, we can print the character directly (if possible)
            printf("%c", int_symbol);
        } else {
            //print as an Escape Code (compression disabled or failed to convert)
            printf("\\x%X", int_symbol);
        }
    }
    printf("\n");
}