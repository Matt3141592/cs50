#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int calc(string s);

int main(void)
{
    //takes two words from the players
    //then calls the calc function to calculate the scores.
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");
    int score1 = calc(word1);
    int score2 = calc(word2);
    //printf ("%i %i\n", score1, score2);
    //compares the scores of the two players. Decides who wins or if it is a tie
    if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    else if (score2 < score1)
    {
        printf("Player 1 wins!\n");
    }
    else
    {
        printf("Tie!\n");
    }
    
}

int calc(string s)
{
    int score = 0; 
    int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};
    
    for (int i = 0,  n = strlen(s); i < n; i++)
    {
        s[i] = tolower(s[i]); //converts to lowercase before calculating the score
        if (s[i] >= 'a' && s[i] <= 'z')
        {
            score += POINTS[s[i] - 97 ];
        }
    }
    return score; 
}