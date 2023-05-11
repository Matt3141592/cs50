#include <stdio.h>
#include <stdlib.h>

char *word(void);

int main(void)
{
    char *out = word();
    int x = 5;
    printf("%d",x);
    
    printf("%s\n", out);
    free(out);
}

char *word(void)
{
    char *string = malloc(1);
    string[0] = 'H';
    string[1] = 'i';
    string[2] = '!';
    string[3] = '\0';
    
    return string;
}