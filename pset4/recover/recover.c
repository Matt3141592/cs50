#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t byte;

int main(int argc, char *argv[])
{
    //makes sure that a file has been provided.
    if (argc != 2)
    {
        printf("./recover [file name]\n");
        return 1;
    }
    char *infile = argv[1];
    FILE *in = fopen(infile, "r");

    //makes sure file can be opened
    if (in == NULL)
    {
        printf("File could not be opened\n");
        return 1;
    }

    //used to count the number of files produces
    //also for the naming system
    int file_count = 0;
    int offset = 0;
    byte block[512];
    byte test;
    FILE *out;
    out = fopen("trash", "w");
    
    while (fread(&test, sizeof(byte), 1, in))
    {
        //brings pointer back to the start of the block.
        //offset starts at 0
        fseek(in, offset * 512, SEEK_SET);

        //fills block with the a block
        for (int i = 0; i < 512; i++)
        {
            byte temp;
            fread(&temp, sizeof(byte), 1, in);
            block[i] = temp;
        }
        if (block[0] == 0xff && block[1] == 0xd8 && block[2] == 0xff && block[3] >= 0xe0 && block[3] <= 0xef)
        {
            fclose(out);
            char *outpt = malloc(20);
            sprintf(outpt, "%0.3i.jpg", file_count);
            out = fopen(outpt, "w");
            free(outpt);
            file_count++;
        }
        if (file_count > 0)
        {
            for (int i = 0; i < 512; i ++)
            {
                fwrite(&block[i], sizeof(byte), 1, out);
            }
        }

        offset++;
    }
    if (file_count > 0)
    {
        fclose(out);
    }
    return 0;

}