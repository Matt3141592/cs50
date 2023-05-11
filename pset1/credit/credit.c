#import <cs50.h>
#import <stdio.h>

int main(void)
{
    long number = get_long("Number: ");
    
    //checksum
    long checksum = 0;
    long divider;
    for (int i=0; i<10; i++)
    {
        divider = 1;
        for (int j=0; j<i+1; j++)
        {
            divider = divider *100;
            //printf("%li\n", divider);
        }
        long n = number % divider; 
        long m = number % (divider/10);
        long x = (n-m)/(divider/10);
        x = x*2;
        if ((x)>=10) //adds the digits together if it's greater than or equal to 10.
        {
            x = (x%10)+(((x%100)-(x%10))/10);
        }
        
        checksum = checksum + (x); //adding every other number from one from end and multiplying by 2
        
        long a = number % (divider/10);
        long b = number % (divider/100);
        long y = (a-b)/(divider/100);
        checksum = checksum + y; //adding numbers missed.
        //printf ("%li\n", y);
    }
    printf ("%li\n", checksum);
    
    //check the starting numbers of the card and the length
    //amex 15 and 34/37
    //master 16 and 51,52,53,54,55
    //visa 13/16 and 4
    long start = number;
    for (int i = 0; i<13; i++)
    {
        start = start/10;
    }
    if ((start==34||start==37)&&((checksum%10)==0))
    {
        printf("AMEX\n");
    }
    else
    {
        start = number;
        for (int i = 0; i<14; i++)
        {
            start = start/10;
        }
        if ((start==51||start==52||start==53||start==54||start==55)&&((checksum%10)==0))
        {
            printf("MASTERCARD\n");
        }
        else
        {
            start = number; 
            for (int i = 0; i<12; i++)
            {
                start = start/10;
            }
           // printf("%li", start);
            if ((start==4)&&((checksum%10)==0))
            {
                printf("VISA\n");
            }
            else
            {
                start = number;
                for (int i = 0; i<15; i++)
                {
                    start = start/10;
                }
                if ((start==4)&&((checksum%10)==0))
                {
                    printf("VISA\n");
                }
                else
                {
                    printf("INVALID\n");
                }
            }
        }
    }
    
    
}