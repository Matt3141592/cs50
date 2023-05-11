//
//  main.c
//  prime_digit_replacement.c
//
//  Created by Matthew Lee on 20/07/2021.
//

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int prime(int x);
int fact(int x);
void patt(long holder[], int size, int x);
void save(long holder[], int x);
void merge(long list[], int start, int end);

int counter = 0;
long perms[45000];

int main(void)
{
    // numebr of digits in the number
    for (int i = 2; i < 8; i++)
    {
        int num[i + 1];
        long positions[i];
        for (int j = 0; j < 45000; j++)
            perms[j] = 99999999;
        
        //creates an array of all the permutations of the digit positions
        for (int k = 0; k < i; k++)
        {
            positions[k] = k;
        }
        counter = 0;
        patt(positions, i, i);
        merge(perms, 0, 44999);
        //replace 1, then 2, then 3...
        for (int j = 1; j < i; j++)
        {
            //===================================================
            //creates an array for all the permutations.
            int x = fact(i) / fact(j) / fact(j);
            
            //===================================================
        }
    }
}

int prime(int x)
{
    if (x == 1)
        return 0;
    if (x == 2)
        return 1;
    if ((x & 1) == 0)
        return 0;
    
    for (int i = 3, n = sqrt(x); i <= n; i += 2)
        if (x % i == 0)
            return 0;
    return 1;
}

int fact(int x)
{
    int ans = 1;
    for (int i = 1; i <= x; i++)
        ans *= i;
    return ans;
}

void patt(long holder[], int size, int x)
{
    if (size == 1)
    {
        save(holder, x);
        return;
    }
    
    for (int i = 0; i < size; i++)
    {
        patt(holder, size - 1, x);
        
        if ((size % 2) == 1)
        {
            long temp = holder[size - 1];
            holder[size - 1] = holder[0];
            holder[0] = temp;
        }
        else
        {
            long temp = holder[size - 1];
            holder[size - 1] = holder[i];
            holder[i] = temp;
        }
    }
    return;
}

void save(long holder[], int x)
{
    perms[counter] = 0;
    for (int i = 0; i < x; i++)
    {
        perms[counter] += holder[i];
        if (i != x - 1)
        {
            perms[counter] = perms[counter] * 10;
        }
    }
    counter++;
    return;
}

void merge(long list[], int start, int end)
{
    if (end - start == 0)
    {
        return;
    }
    if (start <= (((end - start) / 2) + start))
    {
        merge(list, start, ((end - start) / 2) + start);
        merge(list, ((end - start) / 2) + 1 + start, end);
    }
    
    int left = 0;
    int right = ((end - start) / 2) + 1;
    //long *temp = malloc(sizeof(long) * (end - start + 1));
    long temp[end - start + 1];
    
    for (int i = 0; i <= (end - start); i++)
    {
        temp[i] = list[start + i];
    }
    
    for (int i = 0; i <= (end - start); i++)
    {
        if (temp[left] > temp[right] && right <= (end - start) && left <= ((end - start) / 2))
        {
            list[start + i] = temp[right];
            right++;
        }
        else if(temp[right] > temp[left] && right <= (end - start) && left <= ((end - start) / 2))
        {
            list[start + i] = temp[left];
            left++;
        }
        else if(right <= (end - start))
        {
            list[start + i] = temp[right];
            right++;
        }
        else if(left <= ((end - start) / 2))
        {
            list[start + i] = temp[left];
            left++;
        }
    }
    //free(temp);
    return;
}
