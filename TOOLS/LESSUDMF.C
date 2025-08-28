//"Less UDMF" version 2
//A tool to optimize the UDMF data in WAD
//Code by LeonardoTheMutant

//To do for version 3:
// - Prevent merging sloped sectors which are made by verticies or linedef specials

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined(_WIN32)
    #include <direct.h>
    #define realpath(N,R) _fullpath((R),(N),_MAX_PATH)
    #define PATHCMP _stricmp
#else
    #include <limits.h>
    #include <unistd.h>
    #define PATHCMP strcmp
#endif

typedef struct {
    int lumpsAmount;
    int directory_adress;
} wadfile_t;

typedef struct {
    char name[8];
    int adress;
    int size;
} lump_t;

typedef struct {
    char *key;
    char *value;
} kvpair_t;

typedef struct {
    char header[8];
    kvpair_t *pairs;
    size_t pairsCount;
    size_t pairsCapacity;
} block_t;

typedef struct {
    block_t *block;
    char isMaster; // 1=kept, 0=removed as duplicate, -1=unvisited
    int sectorID; //index of the sector in ORIGINAL ordering
    int masterID; // new index of the sector
} sector_t;

block_t *blocks;
unsigned int blockCount = 0;
sector_t *sectors;
unsigned int sectorCount;
char *namespaceStr;

static FILE *inputWAD;
static FILE *outputWAD;
static char inputFilePath[PATH_MAX];
static char outputFilePath[PATH_MAX] = "./OUTPUT.WAD";

static unsigned int buffer_int = 0; // multipurpose
static char buffer_str[0x400];
static char *LUMP_BUFFER;

static wadfile_t WADfile;
static lump_t *lumps;

//Check if two filepaths refer to the same file
char areSameFiles(const char *path1, const char *path2) {
    char abs1[PATH_MAX], abs2[PATH_MAX];
    if (!realpath(path1, abs1) || !realpath(path2, abs2))
        return 0; // If either path can't be resolved, assume not the same
    return !PATHCMP(abs1, abs2);
}

//Close I/O
static void closeIO(void) {
    if (inputWAD) { fclose(inputWAD); inputWAD = 0; }
    if (outputWAD) { fclose(outputWAD); outputWAD = 0; }
}

//isspace() from ctype.h
static char isspace(char c) {
    return (c == 0x20 || c == 0x09 || (c >= 0x0a && c <= 0x0d));
}

//Safe realloc()
static void *xrealloc(void *ptr, size_t size) {
    void *p = realloc(ptr, size);
    if (!p) {
        fprintf(stderr, "ERROR: Out of memory in realloc()\n");
        exit(1);
    }
    return p;
}

//Safe strdup()
static char *xstrdup(const char *s) {
    if (!s) return NULL;
    size_t len = strlen(s);
    char *d = (char*)malloc(len + 1);
    if (!d) {
        fprintf(stderr, "ERROR: Out of memory in strdup()\n");
        exit(1);
    }
    memcpy(d, s, len + 1);
    return d;
}

//Add a key/value pair into block
static void add_pair(block_t *blk, const char *key, const char *value) {
    if (blk->pairsCount >= blk->pairsCapacity) {
        blk->pairsCapacity = blk->pairsCapacity ? blk->pairsCapacity * 2 : 4;
        blk->pairs = (kvpair_t*)xrealloc(blk->pairs, blk->pairsCapacity * sizeof(kvpair_t));
    }
    blk->pairs[blk->pairsCount].key = xstrdup(key);
    blk->pairs[blk->pairsCount].value = xstrdup(value);
    blk->pairsCount++;
}

//Allocate space for a new block in memory
static void add_block(const char *header) {
    blocks = (block_t*)realloc(blocks, (blockCount + 1) * sizeof(block_t));
    block_t *blk = &blocks[blockCount];
    memset(blk, 0, sizeof(block_t));
    strncpy(blk->header, header, sizeof(blk->header)-1);
    blockCount++;
}

//Compare two block_t structs
static int areBlocksEqual(const block_t *a, const block_t *b) {
    if (a->pairsCount != b->pairsCount) return 0;
    char matched[b->pairsCount];
    memset(matched, 0, sizeof(matched));
    for (unsigned short i = 0; i < a->pairsCount; ++i) {
        int found = 0;
        for (unsigned short j = 0; j < b->pairsCount; ++j) {
            if (!matched[j] && !strcmp(a->pairs[i].key, b->pairs[j].key) && !strcmp(a->pairs[i].value, b->pairs[j].value)) {
                matched[j] = 1;
                found = 1;
                break;
            }
        }
        if (!found) return 0;
    }
    return 1;
}

// TEXTMAP cleaner, removes all comments, whitespaces and unnecessary newlines
static char* cleanupTEXTMAP(char *textmapdata, int size, int *newSize) {
    //size_t mallocSize = size * 2 + 1;
    char *out = (char*)malloc(size);
    memset(out, 0, size);
    char *line = strtok(textmapdata, "\n");
    buffer_int &= ~1; //set the lowest bit to 0, 0x1 - currently in string
    unsigned int newsize = 0;
    while (line)
    {
        //remove comments
        char *comment = strstr(line, "//");
        if (comment) *comment = '\0'; // Truncate the line before the comment
        // Trim leading and trailing whitespace
        char *start = line;
        while (isspace(*start)) *start++;
        char *end = line + strlen(line) - 1;
        while (end > start && isspace(*end)) end--;
        *(end + 1) = '\0';
        //remove spaces where they are not required
        char *writePtr = start;
        for (char *readPtr = start; *readPtr; readPtr++) {
            if (*readPtr == '\"') buffer_int ^= 1; //entered/left the string
            if (!isspace((unsigned char)*readPtr) || (buffer_int & 1)) { //remove the space ONLY when its outside the string
                *writePtr++ = *readPtr;
            }
        }
        *writePtr = '\0';
        // Check if the line is empty
        if (!strlen(start)) { line = strtok(NULL, "\n"); continue; }
        newsize += strlen(start);
        strcat(out, start);
        line = strtok(NULL, "\n");
    }
    strcat(out, "\n");
    *newSize = newsize + 1;
    return out;
}

//Tokenize TEXTMAP into block structires (block_t)
static void parseTEXTMAP(char *textmapdata) {
    char *ptr = textmapdata;
    while (*ptr) {
        if (strncmp(ptr, "namespace", 9) == 0) {
            ptr += 9;
            if (*ptr == '=') ptr++;
            if (*ptr == '"') ptr++;
            char *start = ptr;
            while (*ptr && *ptr != '"') ptr++;
            size_t len = ptr - start;
            namespaceStr = (char*)malloc(len + 1);
            memcpy(namespaceStr, start, len);
            namespaceStr[len] = '\0';
            while (*ptr && *ptr != ';') ptr++;
            if (*ptr == ';') ptr++;
        } else {
            // Read block header
            char header[8];
            char *hptr = header;
            while (*ptr && *ptr != '{') { *hptr++ = *ptr++; }
            *hptr = 0;
            add_block(header);
            block_t *blk = &blocks[blockCount-1];

            if (*ptr == '{') ptr++;

            // Parse inside block
            while (*ptr && *ptr != '}') {
                char key[128], value[128];
                char *kptr = key;
                while (*ptr && *ptr != '=' && *ptr != '}') { *kptr++ = *ptr++; }
                *kptr = 0;
                if (*ptr == '=') ptr++;
                char *vptr = value;
                if (*ptr == '"') {
                    *vptr++ = '"'; // keep opening quote
                    ptr++;
                    while (*ptr && *ptr != '"') *vptr++ = *ptr++;
                    if (*ptr == '"') {
                        *vptr++ = '"'; // keep closing quote
                        ptr++;
                    }
                } else {
                    while (*ptr && *ptr != ';' && *ptr != '}') *vptr++ = *ptr++;
                }
                *vptr = 0;
                add_pair(blk, key, value);
                if (*ptr == ';') ptr++;
            }
            if (*ptr == '}') ptr++;
        }
    }

    // Remove trailing empty blocks
    while (blockCount > 0 && blocks[blockCount-1].pairsCount == 0) {
        free(blocks[blockCount-1].pairs);
        blockCount--;
    }
}

static void deduplicateSectors() {
    sectorCount = 0;
    //Count the amount of sectors in map
    for (unsigned int i = 0; i < blockCount; i++) {
        if (!strncmp(blocks[i].header, "sector", 6)) sectorCount++;
    }
    sectors = (sector_t*)calloc(sectorCount, sizeof(sector_t)); //Allocate the space for sectors
    //Load sectors
    buffer_int = 0; //Sector counter
    for (unsigned int i = 0; i < blockCount; i++) {
        if (!strncmp(blocks[i].header, "sector", 6)) {
            sectors[buffer_int++].block = &blocks[i];
        }
    }
    // Mark all sectors as unvisited by the program
    for (unsigned int i = 0; i < sectorCount; i++) sectors[i].isMaster = -1;
    //Find identical sectors and mark them
    unsigned int uniqueSectorID = 0;
    for (unsigned int i = 0; i < sectorCount; i++) {
        if (sectors[i].isMaster != -1) continue; //Already processed

        sectors[i].isMaster = 1;
        sectors[i].masterID = uniqueSectorID;
        sectors[i].sectorID = i;

        //Compare with other sectors
        for (unsigned int j = i + 1; j < sectorCount; j++) {
            if ((sectors[j].isMaster == -1) && areBlocksEqual(sectors[i].block, sectors[j].block)) {
                //Found a duplicate
                sectors[j].masterID = uniqueSectorID;
                sectors[j].sectorID = j;
                sectors[j].isMaster = 0; //Mark as duplicate
            }
        }

        uniqueSectorID++;
    }

    //Count the amount of sidedefs in map
    block_t *sidedefs;
    unsigned int sidedefCount = 0;
    for (unsigned int i = 0; i < blockCount; i++) {
        if (!strncmp(blocks[i].header, "sidedef", 7)) sidedefCount++;
    }
    //Load Sidedefs
    sidedefs = (block_t*)malloc(sizeof(block_t) * sidedefCount); //Allocate space for sidedefs
    buffer_int = 0; //Sidedef counter
    for (unsigned int i = 0; i < blockCount; i++) {
        if (!strncmp(blocks[i].header, "sidedef", 7)) {
            sidedefs[buffer_int++] = blocks[i];
        }
    }

    // Build masterID -> new compacted index
    int *masterID_to_newIndex = (int*)malloc(uniqueSectorID * sizeof(int));
    int newIndex = 0;
    for (unsigned int i = 0; i < sectorCount; ++i) {
        if (sectors[i].isMaster == 1) {
            masterID_to_newIndex[sectors[i].masterID] = newIndex++;
        }
    }
    int *oldToNew = (int*)malloc(sectorCount * sizeof(int));
    for (unsigned int i = 0; i < sectorCount; ++i) {
        oldToNew[i] = masterID_to_newIndex[sectors[i].masterID];
    }
    free(masterID_to_newIndex);
    
    // Remap sidedef sector indices
    for (unsigned int i = 0; i < sidedefCount; i++) {
        for (unsigned short j = 0; j < sidedefs[i].pairsCount; j++) {
            if (!strcmp(sidedefs[i].pairs[j].key, "sector")) {
                char *endptr;
                long sectorIndex = strtol(sidedefs[i].pairs[j].value, &endptr, 10);
                if ((*endptr == '\0') && (sectorIndex >= 0) && (sectorIndex < (long)sectorCount)) {
                    snprintf(buffer_str, sizeof(buffer_str), "%d", oldToNew[sectorIndex]);
                    strcpy(sidedefs[i].pairs[j].value, buffer_str);
                } else {
                    fprintf(stderr, "WARNING: Invalid or out-of-bounds sector index '%s' for sidedef, setting to 0\n", sidedefs[i].pairs[j].value);
                    strcpy(sidedefs[i].pairs[j].value, "0");
                }
            }
        }
    }
    free(oldToNew);

    //Remove sector duplicates
    unsigned int writeIndex = 0;
    buffer_int = 0; //track which sector we're looking at in sector[]

    for (unsigned int i = 0; i < blockCount; i++) {
        if (strcmp(blocks[i].header, "sector")) {
            //Not a sector block, just keep the block
            if (writeIndex != i) blocks[writeIndex] = blocks[i];
            writeIndex++;
        } else {
            if (sectors[buffer_int].isMaster) {
                //Master sector, keep the block
                if (writeIndex != i) blocks[writeIndex] = blocks[i];
                writeIndex++;
            } else {
                //Duplicate sector, free its pairs and the block itself
                for (unsigned short j = 0; j < blocks[i].pairsCount; j++) {
                    free(blocks[i].pairs[j].key);
                    free(blocks[i].pairs[j].value);
                }
                free(blocks[i].pairs);
                // Free the block struct if it was dynamically allocated (not needed here, as blocks is a flat array)
                // memset(&blocks[i], 0, sizeof(block_t)); // Optional: clear memory
            }
            buffer_int++;
        }
    }

    blockCount = writeIndex;

    printf("Merged the identical sectors in map (before: %d, after: %d)\n", sectorCount, uniqueSectorID);

    free(sectors);
    free(sidedefs);
}

// Generate a new TEXTMAP using the given blocks data
static char* rewriteTEXTMAP(const block_t *blocks) {
    size_t allocated = 1024;
    size_t used = 0;
    char *out = (char*)malloc(allocated);
    used += snprintf(out, allocated, "namespace=\"%s\";", namespaceStr);
    char blockLine[0x200];
    for (unsigned int block = 0; block < blockCount; block++) {
        memset(blockLine, 0, sizeof(blockLine));
        for (unsigned int pair = 0; pair < blocks[block].pairsCount; pair++) {
            snprintf(buffer_str, sizeof(buffer_str), "%s=%s;", blocks[block].pairs[pair].key, blocks[block].pairs[pair].value);
            strcat(blockLine, buffer_str);
        }
        used += snprintf(buffer_str, sizeof(blockLine), "%s{%s}", blocks[block].header, blockLine);
        if (used >= allocated) {
            allocated *= 2;
            out = (char*)xrealloc(out, allocated);
        }
        strncat(out, buffer_str, allocated);
    }
    strcat(out, "\n");
    return out;
}


//
// MAIN
//
int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("%s [input.wad] -o [output.wad] -m\n", argv[0]);
        puts("Optimize the UDMF maps in WAD.\n");
        printf("    -o\tOutput to the file. If not given, the output will be written to %s\n", outputFilePath);
        puts("    -m\tMerge identical sectors in maps");
        puts("\nMake sure to have a copy of the old file - new file can have corruptions!");
        return 0;
    }

    // parse args
    for (int i = 1; i < argc; ++i) {
        if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) {
            strncpy(outputFilePath, argv[++i], sizeof(outputFilePath) - 1);
        } else if (strcmp(argv[i], "-nm") == 0) {
            buffer_int |= 2;
        } else {
            strncpy(inputFilePath, argv[i], sizeof(inputFilePath) - 1);
        }
    }

    if (areSameFiles(inputFilePath, outputFilePath)) { fprintf(stderr, "ERROR: Input and Output files are the same, please choose other Output file\n"); return 1; }

    inputWAD = fopen(inputFilePath, "rb");
    if (!inputWAD) { fprintf(stderr, "ERROR: Failed to open Input WAD (%s)\n", inputFilePath); return 1; }
    outputWAD = fopen(outputFilePath, "wb");
    if (!outputWAD) { fprintf(stderr, "ERROR: Failed to open Output WAD (%s)\n", outputFilePath); closeIO(); return 1; }

    //Read the WAD type
    if (fread(buffer_str, 1, 4, inputWAD) != 4) { fprintf(stderr, "ERROR: Bad Input WAD header\n"); closeIO(); return 1; }
    fwrite(buffer_str, 1, 4, outputWAD);

    //Get the amount of lumps in WAD and allocate the space for them
    fread(&WADfile.lumpsAmount, 4, 1, inputWAD);
    printf("%d lumps in WAD\n", WADfile.lumpsAmount);
    fwrite(&WADfile.lumpsAmount, 4, 1, outputWAD);
    lumps = (lump_t*)malloc(sizeof(lump_t) * WADfile.lumpsAmount);
    if (!lumps) { fprintf(stderr, "ERROR: Failed to allocate memory for the WAD lumps buffer"); closeIO(); return 1; }

    //Get Directory Table address
    fread(&WADfile.directory_adress, 4, 1, inputWAD);

    // Prepare to write new WAD: write placeholder for directory address (we'll fill later)
    putc(0x0C, outputWAD);
    for (unsigned char x=0; x<3; x++) putc(0, outputWAD);

    // Seek to dir table, read it
    fseek(inputWAD, WADfile.directory_adress, SEEK_SET);
    puts("\nDirectory Table of Input WAD:");
    puts("\nID   ADRESS     SIZE     NAME");
    for (unsigned short i = 0; i < WADfile.lumpsAmount; ++i) {
        fread(&lumps[i].adress, 4, 1, inputWAD);
        fread(&lumps[i].size, 4, 1, inputWAD);
        fread(lumps[i].name, 8, 1, inputWAD);
        printf("%2d %8d %8d %8s\n", i, lumps[i].adress, lumps[i].size, lumps[i].name);
    }

    // Copy/modify lumps
    fseek(inputWAD, 0x0C, SEEK_SET); //Jump back to the actuall lump data
    for (int i = 0; i < WADfile.lumpsAmount; ++i) {
        // Set new lump address
        lumps[i].adress = ftell(outputWAD);
        if (strncmp(lumps[i].name, "TEXTMAP", 7)) {
            //Lump is not TEXTMAP, copy the lump contents to the Output WAD unmodified
            if (lumps[i].size > 0) {
                LUMP_BUFFER = (char*)malloc(lumps[i].size);
                fread(LUMP_BUFFER, lumps[i].size, 1, inputWAD);
                fwrite(LUMP_BUFFER, lumps[i].size, 1, outputWAD);
                free(LUMP_BUFFER);
            }
        } else {
            // ---------- Modify TEXTMAP ----------
            printf("\nModifying TEXTMAP of %s...\n", lumps[i-1].name);

            // Load TEXTMAP
            LUMP_BUFFER = (char*)malloc(lumps[i].size + 1);
            fread(LUMP_BUFFER, lumps[i].size, 1, inputWAD);
            LUMP_BUFFER[lumps[i].size] = '\0';

            // 1) Clean whitespace/comments
            char *CLEANED_LUMP_BUFFER = cleanupTEXTMAP(LUMP_BUFFER, lumps[i].size, &lumps[i].size);
            strncpy(LUMP_BUFFER, CLEANED_LUMP_BUFFER, lumps[i].size + 1);
            puts("Cleaned the text");

            // 2) Deduplicate (merge) identical sectors
            if (buffer_int & 2) { //Was '-m' command line paramater activated?
                // Free old blocks if any
                for (unsigned int b = 0; b < blockCount; ++b) {
                    for (size_t p = 0; p < blocks[b].pairsCount; ++p) {
                        free(blocks[b].pairs[p].key);
                        free(blocks[b].pairs[p].value);
                    }
                    free(blocks[b].pairs);
                }
                free(blocks);
                blocks = 0;
                blockCount = 0;

                parseTEXTMAP(CLEANED_LUMP_BUFFER); //Tokenize the entire TEXTMAP
                deduplicateSectors(); //Deduplicate sectors
                free(LUMP_BUFFER);
                LUMP_BUFFER = rewriteTEXTMAP(blocks); //Write changes to the buffer
                lumps[i].size = strlen(LUMP_BUFFER);
            }

            // 3) Write modified TEXTMAP
            fwrite(LUMP_BUFFER, lumps[i].size, 1, outputWAD);
            printf("Wrote the modified TEXTMAP data of %s to output\n", lumps[i-1].name);

            free(LUMP_BUFFER);
            free(CLEANED_LUMP_BUFFER);
        }
    }

    // Directory address
    buffer_int = ftell(outputWAD);
    fseek(outputWAD, 8, SEEK_SET);
    fwrite(&buffer_int, 4, 1, outputWAD);
    fseek(outputWAD, buffer_int, SEEK_SET);

    //Write the new directory table
    puts("\nDirectory Table of Output WAD:");
    puts("\nID   ADRESS     SIZE     NAME");
    for (unsigned short i = 0; i < WADfile.lumpsAmount; ++i) {
        printf("%2d %8d %8d %8s\n", i, lumps[i].adress, lumps[i].size, lumps[i].name);
        fwrite(&lumps[i].adress, 4, 1, outputWAD);
        fwrite(&lumps[i].size, 4, 1, outputWAD);
        fwrite(lumps[i].name, 8, 1, outputWAD);
    }

    closeIO();
    free(lumps);

    printf("\n%s is ready. Make sure to check the contents of the WAD for corruptions!\n", outputFilePath);
    return 0;
}
