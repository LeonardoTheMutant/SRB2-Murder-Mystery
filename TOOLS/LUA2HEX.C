//LUA-string to Hex converter
//Converts the LUA/C-compatible string to "raw" HEX data
//Code by LeonardoTheMutant

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

char hexByte[3];
char spaceArg = 1; //bolean
unsigned char argvIndex;

void printHex(char chr, int doSpace)
{
    if (doSpace) printf("%02X ", chr);
    else printf("%02X", chr);
}

void print(char chr[], int doSpace)
{
    doSpace ? printf("%s ", chr) : printf("%s", chr);
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("%s lua_string [-c]\n", argv[0]);
        printf("Convert the C or LUA-compatible string to raw hexadecimal data\n");
        printf("\n -c  Compress the output by not including spaces between each byte\n");
        return 0;
    } else {
        for (unsigned char x = 0; x < argc; x++)
        {
            if (!strcmp(argv[x], "-c")) spaceArg = 0;
            else argvIndex = x;
        }
    }

    for (int i = 0; i < strlen(argv[argvIndex]); i++) {
        if ((argv[argvIndex][i] == 0x5C) && ((i + 3) < strlen(argv[argvIndex])) && (argv[argvIndex][i + 1] == 0x78))
        {
            //hit an Escape Code sequence
            i += 2; //skip "\x"

            //Is it two byes Escape Code?
            if (((i + 3) < strlen(argv[argvIndex])) && isxdigit(argv[argvIndex][i]) && isxdigit(argv[argvIndex][i + 1]) && isxdigit(argv[argvIndex][i + 2]) && isxdigit(argv[argvIndex][i + 3]))
            {
                //First byte
                strncpy(hexByte, (argv[argvIndex] + i), 2);
                print(hexByte, spaceArg);
                i += 2;

                //Second byte
                strncpy(hexByte, (argv[argvIndex] + i), 2);
                print(hexByte, spaceArg);
                i += 1;
            }
            //Is it one byte Escape Code?
            else if (((i + 1) < strlen(argv[argvIndex])) && isxdigit(argv[argvIndex][i]) && isxdigit(argv[argvIndex][i + 1]))
            {
                strncpy(hexByte, (argv[argvIndex] + i), 2);
                print(hexByte, spaceArg);
                i += 1;
            }
        } else {
            //The symbol is not a part of an Escape Code - print the character in HEX
            printHex(argv[argvIndex][i], spaceArg);
        }
    }
    printf("\n");
}