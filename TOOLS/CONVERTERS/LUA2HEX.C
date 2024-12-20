//LUA-string to Hex converter
//Converts the LUA/C-compatible string to "raw" HEX data
//Code by LeonardoTheMutant

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

char hexByte[3];
unsigned char spaceArg;

void printHex(char chr, int doSpace)
{
    if (doSpace) printf("%02X ", chr);
    else printf("%02X", chr);
}

void print(char chr[], int doSpace)
{
    if (doSpace) printf("%s ", chr);
    else printf("%s", chr);
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("LUA2HEX lua_string [-p]\n");
        printf("Convert the C or LUA-compatible string to raw hexadecimal data\n");
        printf("\n -p  Do not place spaces between each byte in the output\n");
        return 0;
    }

    if ((argc > 2) && (argv[2][0] == '-')) spaceArg = 0;
    else spaceArg = 1;

    for (int i = 0; i < strlen(argv[1]); i++) {
        if ((argv[1][i] == 0x5C) && ((i + 3) < strlen(argv[1])) && (argv[1][i + 1] == 0x78))
        {
            //hit an Escape Code sequence
            i += 2; //skip "\x"

            //Is it two byes Escape Code?
            if (((i + 3) < strlen(argv[1])) && isxdigit(argv[1][i]) && isxdigit(argv[1][i + 1]) && isxdigit(argv[1][i + 2]) && isxdigit(argv[1][i + 3]))
            {
                //First byte
                strncpy(hexByte, (argv[1] + i), 2);
                print(hexByte, spaceArg);
                i += 2;

                //Second byte
                strncpy(hexByte, (argv[1] + i), 2);
                print(hexByte, spaceArg);
                i += 1;
            }
            //Is it one byte Escape Code?
            else if (((i + 1) < strlen(argv[1])) && isxdigit(argv[1][i]) && isxdigit(argv[1][i + 1]))
            {
                strncpy(hexByte, (argv[1] + i), 2);
                print(hexByte, spaceArg);
                i += 1;
            }
        } else {
            //The symbol is not a part of an Escape Code - print the character in HEX
            printHex(argv[1][i], spaceArg);
        }
    }
    printf("\n");
}