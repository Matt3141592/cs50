#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

void bubble(int list[], int n);
void merge(int list[], int start, int end);
int main(void)
{
    int sort[] = {27,3,2,1,6,5,30,4,9,5,5,5,7,8,9,8,7,10,15,21,28,25,23,22,24,29,19,11,13,14,12,16,18,20,17};
    int n = sizeof(sort) / sizeof(int);
    clock_t begin = clock();
    merge(sort, 0, n - 1);
    printf("%f\n", (double)(clock() - begin) / CLOCKS_PER_SEC);
    
    for (int i = 0; i < n; i ++)
        printf("%i\n", sort[i]);
}

void merge(int list[], int start, int end)
{
    if (end == start)
        return;
    
    int y = end - start;
    int x = y >> 1;
    
    if (start <= (x + start))
    {
        merge(list, start, x + start);
        merge(list, x + 1 + start, end);
    }
    
    int left = 0;
    int right = x + 1;
    //int *temp = malloc(sizeof(int) * (y + 1));
    int temp[y + 1];
    for (int i = 0; i <= y; i++)
        temp[i] = list[start + i];
    
    for (int i = 0; i <= y; i++)
    {
        if (right <= y && left <= x)
        {
            if (temp[left] >= temp[right])
            {
                list[start + i] = temp[right];
                right++;
            }
            else
            {
                list[start + i] = temp[left];
                left++;
            }
        }
        else
        {
            if(right <= y)
            {
                list[start + i] = temp[right];
                right++;
            }
            else
            {
                list[start + i] = temp[left];
                left++;
            }
        }
    }
    //free(temp);
    return;
}