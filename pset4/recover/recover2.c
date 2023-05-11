#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t  byte;

typedef struct
{
   byte a;
   byte b;
   byte c;
   byte d;
} __attribute__((__packed__))
Header;

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("./recover [file name]\n");
        return 1;
    }
    char *infile = argv[1];
    FILE *in = fopen(infile, "r");

    if (in == NULL)
    {
        printf("File could not be opened\n");
        return 1;
    }

    Header head;
    int file_count = 0;

    //could do this by looking at each 512 until I find the correct start
    //create a list of where all the pictures start
    //the start of a picture is the end of another
    //should probably check in 512 bytes at a time.
    //if it starts with a header then it's another photo.
    FILE *out;
    byte dummy;
    while(fread (&head, sizeof(Header), 1, in))
    {

        //looking for a jpeg. Only looks at the start of the 512 block.
        //starts the data transfer when the right header has been found.

        if (head.a == 0xff && head.b == 0xd8 && head.c == 0xff && (head.d > 0xe0 && head.d <0xf0))
        {
            //creating an output file with a number name.
            char *outpt = "";
            sprintf(outpt, "%0.3i.jpg", file_count);
            //out = fopen(outpt, "w");

            if (file_count > 0)
            {
                fclose(out);
            }

            out = fopen(outpt, "w");
            file_count++;

            //closes the previous file.
        }

        if (file_count > 0)
        {
            fwrite(&in, sizeof(byte), 1, out);
        }
    }
    //fclose(out);
}