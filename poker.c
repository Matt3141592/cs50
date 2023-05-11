//
//  main.c
//  54poker_hands.c
//
//  Created by Matthew Lee on 28/07/2021.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int isstraight(int hand[]);
int isflush(int hand[]);
int pair(int hand[]);
int threeofkind(int hand[]);
int fourofkind(int hand[]);
int twopair(int hand[]);

int main(void)
{
    clock_t begin = clock();
    FILE *in = fopen("p054_poker.txt", "r");
    if (in == NULL)
    {
        printf("File could not be opened\n");
        return 1;
    }
    
    int wins = 0;
    int wins2 = 0;
    char *card = malloc(3);
    int number[10];
    int suit[10];
    
    //reads cards one by one
    while (fscanf(in, "%s", card) != EOF)
    {
        for (int i = 0; i <= 9; i++)
        {
            if (i != 0)
                fscanf(in, "%s", card);
            
            if (card[0] == 'T')
                number[i] = 10;
            else if(card[0] == 'J')
                number[i] = 11;
            else if(card[0] == 'Q')
                number[i] = 12;
            else if(card[0] == 'K')
                number[i] = 13;
            else if(card[0] == 'A')
                number[i] = 14;
            else
                number[i] = card[0] - 48;
            
            if (card[1] == 'D')
                suit[i] = 1;
            else if(card[1] == 'C')
                suit[i] = 2;
            else if(card[1] == 'H')
                suit[i] = 3;
            else
                suit[i] = 4;
        }
        int type = 0;
        int type2 = 0;
        int highest = -1;
        int highest2 = -1 ;
        
        //store hands separately
        int num1[5];
        int num2[5];
        int suit1[5];
        int suit2[5];
        
        for (int i = 0; i < 5; i++)
        {
            num1[i] = number[i];
            num2[i] = number[i + 5];
            suit1[i] = suit[i];
            suit2[i] = suit[i + 5];
        }
        
        //sort hands using bubble
        for (int i = 0; i < 5; i++)
        {
            for (int j = 0; j < 4 - i; j++)
            {
                if (num1[j] > num1[j + 1])
                {
                    int temp = num1[j + 1];
                    num1[j + 1] = num1[j];
                    num1[j] = temp;
                    
                    temp = suit1[j + 1];
                    suit1[j + 1] = suit1[j];
                    suit1[j] = temp;
                }
                
                if (num2[j] > num2[j + 1])
                {
                    int temp = num2[j + 1];
                    num2[j + 1] = num2[j];
                    num2[j] = temp;
                    
                    temp = suit2[j + 1];
                    suit2[j + 1] = suit2[j];
                    suit2[j] = temp;
                }
            }
        }
        //check 4 of kind, 3 of kind and pair, two pair, then pair.
        //high card: 0  4 of kind: 7
        //one pair: 1   straight flush: 8
        //two pair: 2   royal flush: 9
        //3 of kind: 3
        //straight: 4
        //flush: 5
        //full house: 6
        
        if(isstraight(num1) > 0 && isflush(suit1) > 0 && num1[4] == 14)
            type = 9;
        else if((isstraight(num1) > 0) && (isflush(suit1) > 0))
        {
            type = 8;
            highest = num1[4];
        }
        else if(fourofkind(num1) > 0)
        {
            type = 7;
            highest = fourofkind(num1);
        }
        else if(threeofkind(num1) > 0)
        {
            highest = threeofkind(num1);
            if (pair(num1) > 0)
            {
                type = 6;
            }
            else if(isflush(suit1) > 0)
            {
                highest = num1[4];
                type = 5;
            }
            else
            {
                type = 3;
            }
        }
        else if(isflush(suit1) > 0)
        {
            highest = num1[4];
            type = 5;
        }
        else if(isstraight(num1) > 0)
        {
            highest = num1[4];
            type = 4;
        }
        else if(twopair(num1) > 0)
        {
            highest = twopair(num1);
            type = 2;
        }
        else if(pair(num1) > 0)
        {
            highest = pair(num1);
            type = 1;
        }
//=====================================================================
//=====================================================================
        if(isstraight(num2) > 0 && isflush(suit2) > 0 && num2[4] == 14)
            type2 = 9;
        else if(isstraight(num2) > 0 && isflush(suit2) > 0)
        {
            highest2 = num2[4];
            type2 = 8;
        }
        else if(fourofkind(num2) > 0)
        {
            highest2 = fourofkind(num2);
            type2 = 7;
        }
        else if(threeofkind(num2) > 0)
        {
            highest2 = threeofkind(num2);
            if (pair(num2) > 0)
            {
                type2 = 6;
            }
            else if(isflush(suit2) > 0)
            {
                highest2 = num2[4];
                type2 = 5;
            }
            else
            {
                type2 = 3;
            }
        }
        else if(isflush(suit2) > 0)
        {
            highest2 = num2[4];
            type2 = 5;
        }
        else if(isstraight(num2) > 0)
        {
            highest2 = num2[4];
            type2 = 4;
        }
        else if(twopair(num2) > 0)
        {
            highest2 = twopair(num2);
            type2 = 2;
        }
        else if(pair(num2) > 0)
        {
            highest2 = pair(num2);
            type2 = 1;
        }
        
        if (type > type2)
            wins++;
        else if (type < type2)
            wins2++;
        else
        {
            if (highest > highest2)
                wins++;
            else if(highest < highest2)
                wins2++;
            else if (type == 2 || type == 6)
            {
                if (pair(num1) > pair(num2))
                    wins++;
                else if (pair(num1) < pair(num2))
                    wins2++;
            }
                
            else if (highest == highest2)
                for (int i = 4; i >= 0; i--)
                {
                    if (num1[i] > num2[i])
                    {
                        wins++;
                        break;
                    }
                    else if(num1[i] < num2[i])
                    {
                        wins2++;
                        break;
                    }
                }
            else
                wins2++;
        }
    }
    printf("%i %i\n", wins, wins2);
    printf("%f\n", (double)(clock() - begin) / CLOCKS_PER_SEC);
    free(card);
    fclose(in);
}
//====================================================================
int isstraight(int hand[])
{
    for (int i = 0; i < 4; i++)
        if ((hand[i] + 1) != hand[i + 1])
            return 0;
    return hand[4];
}

int isflush(int hand[])
{
    for (int i = 1; i <= 4; i++)
        if (hand[0] != hand[i])
            return 0;
    return 1;
}

int pair(int hand[])
{
    for (int i = 1; i < 3; i++)
        if (hand[i] == hand[i + 1] && hand[i] != hand[i + 2] && hand[i] != hand[i - 1])
            return hand[i];
    
    if (hand[3] == hand[4] && hand[4] != hand[2])
        return hand[3];
    if (hand[0] == hand[1] && hand[0] != hand[2])
        return hand[0];
    return 0;
}

int threeofkind(int hand[])
{
    for (int i = 0; i < 3; i++)
        if (hand[i] == hand[i + 1] && hand[i] == hand[i + 2])
            return hand[i];
    return 0;
}

int fourofkind(int hand[])
{
    for (int i = 0; i < 2; i++)
        if (hand[i] == hand[i + 1] && hand[i] == hand[i + 2] && hand[i] == hand[i + 3])
            return hand[i];
    return 0;
}

int twopair(int hand[])
{
    int count = 0;
    int card = 0;
    for (int i = 0; i < 4; i++)
        if (hand[i] == hand[i + 1])
        {
            count++;
            card = hand[i];
        }
    if (count == 2)
        return card;
    return 0;
}
