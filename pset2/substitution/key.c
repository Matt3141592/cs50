#import <cs50.h>
#import <stdio.h>
#import <ctype.h>
#import <string.h>

int main(void)
{
    string key = get_string("Key: ");
    char newk[26];
    for (int i = 0; i < 26; i++)
    {
        newk[key[i] - 97] = i + 'a';
    }
    printf("%s\n", newk);
}