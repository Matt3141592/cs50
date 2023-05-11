#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //Gets the starting population from the user, keeps asking until a number that is equal to or greater than 9 is entered
    int start;
    do
    {
        start = get_int("Starting population: ");
    }
    while(start<9);
    
    //Gets ending population, keeps asking until a number greater than the starting population is entered
    int end;
    do
    {
        end = get_int("Ending population: ");
    }
    while (end<start);
    
    //Calculate number of years until ending population is reached
    int years = 0;
    while (start < end)
    {
        start += (start / 3) - (start / 4);
        years++;
    }
    
    //prints the result
    printf("Years: %i\n", years);
}