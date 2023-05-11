#include <stdio.h>
#include <math.h>


int main(void)
{
    long x = 1;
    double pi = 0.0;
    while (1)
    {
        pi = pi + pow(-1, x-1) * 4/(2 * x-1);
        (x % 50000000 != 0 || printf("%0.15lf   %li\n", pi, x));
        x++;
    }
}
