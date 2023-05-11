#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //asks user for height until it's between 1 and 8 inclusive
    int height;
    do
    {
        height = get_int("Height: ");
    }
    while (height>8||height<1);
    
    //outputting the pyramid
    for (int i = 0; i<height; i++)
    {
        for (int j = height-1-i; j>0; j--) //prints blank space before the pyramid
        {
            printf(" ");
        }
        for (int j = 0; j<=i; j++) //prints left side of the pyramid
        {
            printf("#");
        }
        printf("  "); //prints gap in the middle of the pyramid
        for (int j = 0; j<=i; j++) //prints right side of the pyramid
        {
            printf("#"); 
        }
        printf("\n"); //new line to move down before repeating the loop
    }
}