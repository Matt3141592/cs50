#import <cs50.h>
#import <stdio.h>
#import <string.h>
#import <ctype.h>
#import <math.h>

double letters(string text, int x);
double sentences(string text, int x);

int main(void)
{
    //asks user to input their text.
    string text = get_string("Text: ");
    int words = 1; 
    
    //counts the number of words in the text
    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if (text[i] == ' ')
        {
            words++;
        }
    }
    
    double l = letters(text, words);
    double s = sentences(text, words);
    
    //printf ("%f\n", (0.0588 * l) - (0.296 * s) - 15.8);
    int grade = round((0.0588 * l) - (0.296 * s) - 15.8);
    //printf("%f %f %i\n", l, s, words);
    
    //decides what to output depending on the grade
    if (grade < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade >= 16)
    {
        printf("Grade 16+\n");
    }
    else 
    {
        printf("Grade %i\n", grade);
    }
}

// calculates the average number of letters for every 100 words of text.
double letters(string text, int x)
{
    float nletters = 0;
    for (int i = 0, n = strlen(text); i < n; i++)
    {
        text[i] = tolower(text[i]); //converts all to lower case so comparison is easier
        if (text[i] >= 'a' && text[i] <= 'z')
        {
            nletters++;
        }
    }
    return nletters / x * 100;
}

// calculates the average number of sentences for every 100 words of text.
double sentences(string text, int x)
{
    float nsentences = 0; 
    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if (text[i] == '.' || text[i] == '!' || text[i] == '?')
        {
            nsentences++; 
        }
    }
    if (nsentences == 0)
    {
        nsentences = 1;
    }
    return nsentences / x * 100; 
}