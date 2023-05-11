#import <stdio.h>
#import <cs50.h>
#import <string.h>

int main(void)
{
    string s = get_string("Enter string: ");
    for(int i = 0; i <= strlen(s); i++)
    {
        printf("%i\n", s[i]);
    }
}