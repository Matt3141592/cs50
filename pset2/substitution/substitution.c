#import <cs50.h>
#import <stdio.h>
#import <string.h>
#import <ctype.h>

int main(int argc, string argv[])
{
    //checking the argument entered
    if (argc != 2 || strlen(argv[1]) != 26)
    {
        printf("ERROR! No argument, too many arguments or argument incorrect length!\n");
        return 1;
    }
    else
    {
        for (int i = 0; i < 26; i++)
        {
            char c = argv[1][i];
            c = tolower(c);
            if (c < 'a' || c > 'z') //checks for inputs other than letters
            {
                printf("ERROR! Not a letter!\n");
                return 1;
            }
            else
            {
                int same = 0;
                for (int j = 0; j < 26; j++)
                {
                    char a = tolower(argv[1][j]);
                    if (c == a) //checks for repeats of letters.
                    {
                        same++;
                    }
                }
                if (same > 1)
                {
                    printf("ERROR! Two or more of the same character!\n");
                    return 1;
                }
            }
        }
    }
    //takes in text from the user to substitute.
    string text = get_string("Plaintext: ");

    //substitutes letter for corresponding letter in the key.
    for (int i = 0, n = strlen(text); i < n; i++)
    {
        if (islower(text[i]))
        {
            text[i] = tolower(argv[1][text[i] - 'a']);
        }
        else if (isupper(text[i]))
        {
            text[i] = toupper(argv[1][text[i] - 'A']);
        }
    }
    //prints the ciphered text.
    printf("Ciphertext: %s\n", text);
}