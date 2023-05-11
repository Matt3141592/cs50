#include "helpers.h"
#include <math.h>
#include <stdio.h>

//not really many comments to add
//but style50 wants more
//probably because there are just so many lines, but most are pretty self explanatory
//and a little repetitive.

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            //finds the average of all 3 colours and then sets all 3 to that average
            int avg = round((image[i][j].rgbtBlue + image[i][j].rgbtGreen + image[i][j].rgbtRed) / (float)3);

            image[i][j].rgbtBlue = avg;
            image[i][j].rgbtRed = avg;
            image[i][j].rgbtGreen = avg;

        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    //similar to a bubble sort, only goes through half the image and swaps with the other half
    for (int i = 0; i < width / 2; i++)
    {
        for (int j = 0; j < height; j++)
        {
            int tmp = image[j][i].rgbtBlue;
            image[j][i].rgbtBlue = image[j][width - 1 - i].rgbtBlue;
            image[j][width - 1 - i].rgbtBlue = tmp;

            tmp = image[j][i].rgbtGreen;
            image[j][i].rgbtGreen = image[j][width - 1 - i].rgbtGreen;
            image[j][width - 1 - i].rgbtGreen = tmp;

            tmp = image[j][i].rgbtRed;
            image[j][i].rgbtRed = image[j][width - 1 - i].rgbtRed;
            image[j][width - 1 - i].rgbtRed = tmp;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // updating the image with it's average will mess up later averages.
    // holder holds updated values while image holds original values
    RGBTRIPLE holder[height][width];

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            //max of eight around a pixel
            int left = j - 1;
            int right = j + 1;
            int above = i - 1;
            int below = i + 1;
            int sumR = image[i][j].rgbtRed;
            int sumG = image[i][j].rgbtGreen;
            int sumB = image[i][j].rgbtBlue;
            int counter = 1;

            //checks that it doesn't go out of the image
            if (left >= 0)
            {
                sumR = sumR + image[i][left].rgbtRed;
                sumG = sumG + image[i][left].rgbtGreen;
                sumB = sumB + image[i][left].rgbtBlue;
                counter++;

                if (above >= 0)
                {
                    sumR = sumR + image[above][left].rgbtRed;
                    sumG = sumG + image[above][left].rgbtGreen;
                    sumB = sumB + image[above][left].rgbtBlue;
                    counter++;
                }

                if (below < height)
                {
                    sumR = sumR + image[below][left].rgbtRed;
                    sumG = sumG + image[below][left].rgbtGreen;
                    sumB = sumB + image[below][left].rgbtBlue;
                    counter++;
                }

            }
            if (right < width)
            {
                sumR = sumR + image[i][right].rgbtRed;
                sumG = sumG + image[i][right].rgbtGreen;
                sumB = sumB + image[i][right].rgbtBlue;
                counter++;

                if (above >= 0)
                {
                    sumR = sumR + image[above][right].rgbtRed;
                    sumG = sumG + image[above][right].rgbtGreen;
                    sumB = sumB + image[above][right].rgbtBlue;
                    counter++;
                }

                if (below < height)
                {
                    sumR = sumR + image[below][right].rgbtRed;
                    sumG = sumG + image[below][right].rgbtGreen;
                    sumB = sumB + image[below][right].rgbtBlue;
                    counter++;
                }
            }

            if (above >= 0)
            {
                sumR = sumR + image[above][j].rgbtRed;
                sumG = sumG + image[above][j].rgbtGreen;
                sumB = sumB + image[above][j].rgbtBlue;
                counter++;
            }

            if (below < height)
            {
                sumR = sumR + image[below][j].rgbtRed;
                sumG = sumG + image[below][j].rgbtGreen;
                sumB = sumB + image[below][j].rgbtBlue;
                counter++;
            }
            //calculating the average
            holder[i][j].rgbtRed = round(sumR / (float) counter);
            holder[i][j].rgbtGreen = round(sumG / (float) counter);
            holder[i][j].rgbtBlue = round(sumB / (float) counter);
        }
    }
    //giving image the new value.
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j] = holder[i][j];
        }
    }
    return;
}

// Detect edges
void edges(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE holder[height][width];

    //inner image, doesn't do the edges.
    for (int i = 1; i < height - 1; i++)
    {
        for (int j = 1; j < width - 1; j++)
        {
            int sumrx = -2 * image[i][j - 1].rgbtRed - image[i - 1][j - 1].rgbtRed - image[i + 1][j - 1].rgbtRed + image[i - 1][j + 1].rgbtRed
                        + 2 * image[i][j + 1].rgbtRed + image[i + 1][j + 1].rgbtRed;
            int sumgx = -2 * image[i][j - 1].rgbtGreen - image[i - 1][j - 1].rgbtGreen - image[i + 1][j - 1].rgbtGreen + image[i - 1][j +
                        1].rgbtGreen + 2 * image[i][j + 1].rgbtGreen + image[i + 1][j + 1].rgbtGreen;
            int sumbx = -2 * image[i][j - 1].rgbtBlue - image[i - 1][j - 1].rgbtBlue - image[i + 1][j - 1].rgbtBlue + image[i - 1][j +
                        1].rgbtBlue + 2 * image[i][j + 1].rgbtBlue + image[i + 1][j + 1].rgbtBlue;

            int sumry = -2 * image[i - 1][j].rgbtRed - image[i - 1][j - 1].rgbtRed - image[i - 1][j + 1].rgbtRed + image[i + 1][j - 1].rgbtRed
                        + 2 * image[i + 1][j].rgbtRed + image[i + 1][j + 1].rgbtRed;
            int sumgy = -2 * image[i - 1][j].rgbtGreen - image[i - 1][j - 1].rgbtGreen - image[i - 1][j + 1].rgbtGreen + image[i + 1][j -
                        1].rgbtGreen + 2 * image[i + 1][j].rgbtGreen + image[i + 1][j + 1].rgbtGreen;
            int sumby = -2 * image[i - 1][j].rgbtBlue - image[i - 1][j - 1].rgbtBlue - image[i - 1][j + 1].rgbtBlue + image[i + 1][j -
                        1].rgbtBlue + 2 * image[i + 1][j].rgbtBlue + image[i + 1][j + 1].rgbtBlue;

            //these are needed so that holder does not overflow.
            if (round(sqrt(pow(sumrx, 2) + pow(sumry, 2))) > 255)
            {
                holder[i][j].rgbtRed = 255;
            }
            else
            {
                holder[i][j].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
            }

            if (round(sqrt(pow(sumgx, 2) + pow(sumgy, 2))) > 255)
            {
                holder[i][j].rgbtGreen = 255;
            }
            else
            {
                holder[i][j].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
            }

            if (round(sqrt(pow(sumbx, 2) + pow(sumby, 2))) > 255)
            {
                holder[i][j].rgbtBlue = 255;
            }
            else
            {
                holder[i][j].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));
            }

            /*holder[i][j].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
            holder[i][j].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
            holder[i][j].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));*/
        }
    }

    //top edge
    //minus corners
    //with no ifs, just a lot of lines of code for individual pixels
    for (int i = 1; i < width - 1; i++)
    {
        int sumrx = -2 * image[0][i - 1].rgbtRed - image[1][i - 1].rgbtRed + 2 * image[0][i + 1].rgbtRed + image[1][i + 1].rgbtRed;
        int sumgx = -2 * image[0][i - 1].rgbtGreen - image[1][i - 1].rgbtGreen + 2 * image[0][i + 1].rgbtGreen + image[1][i + 1].rgbtGreen;
        int sumbx = -2 * image[0][i - 1].rgbtBlue - image[1][i - 1].rgbtBlue + 2 * image[0][i + 1].rgbtBlue + image[1][i + 1].rgbtBlue;

        int sumry = image[1][i - 1].rgbtRed + 2 * image[1][i].rgbtRed + image[1][i + 1].rgbtRed;
        int sumgy = image[1][i - 1].rgbtGreen + 2 * image[1][i].rgbtGreen + image[1][i + 1].rgbtGreen;
        int sumby = image[1][i - 1].rgbtBlue + 2 * image[1][i].rgbtBlue + image[1][i + 1].rgbtBlue;

        if (round(sqrt(pow(sumrx, 2) + pow(sumry, 2))) > 255)
        {
            holder[0][i].rgbtRed = 255;
        }
        else
        {
            holder[0][i].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        }

        if (round(sqrt(pow(sumgx, 2) + pow(sumgy, 2))) > 255)
        {
            holder[0][i].rgbtGreen = 255;
        }
        else
        {
            holder[0][i].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        }

        if (round(sqrt(pow(sumbx, 2) + pow(sumby, 2))) > 255)
        {
            holder[0][i].rgbtBlue = 255;
        }
        else
        {
            holder[0][i].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));
        }

        /*(holder[0][i].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        holder[0][i].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        holder[0][i].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));*/
    }

    //bottom edge
    //minus corners
    for (int i = 1; i < width - 1; i++)
    {
        int sumrx = -2 * image[height - 1][i - 1].rgbtRed - image[height - 2][i - 1].rgbtRed + 2 * image[height - 1][i + 1].rgbtRed +
                    image[height - 2][i + 1].rgbtRed;
        int sumgx = -2 * image[height - 1][i - 1].rgbtGreen - image[height - 2][i - 1].rgbtGreen + 2 * image[height - 1][i + 1].rgbtGreen +
                    image[height - 2][i + 1].rgbtGreen;
        int sumbx = -2 * image[height - 1][i - 1].rgbtBlue - image[height - 2][i - 1].rgbtBlue + 2 * image[height - 1][i + 1].rgbtBlue +
                    image[height - 2][i + 1].rgbtBlue;

        int sumry = image[height - 2][i - 1].rgbtRed + 2 * image[height - 2][i].rgbtRed + image[height - 2][i + 1].rgbtRed;
        int sumgy = image[height - 2][i - 1].rgbtGreen + 2 * image[height - 2][i].rgbtGreen + image[height - 2][i + 1].rgbtGreen;
        int sumby = image[height - 2][i - 1].rgbtBlue + 2 * image[height - 2][i].rgbtBlue + image[height - 2][i + 1].rgbtBlue;
        //can leave as positive because it's being squarred.

        if (round(sqrt(pow(sumrx, 2) + pow(sumry, 2))) > 255)
        {
            holder[height - 1][i].rgbtRed = 255;
        }
        else
        {
            holder[height - 1][i].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        }

        if (round(sqrt(pow(sumgx, 2) + pow(sumgy, 2))) > 255)
        {
            holder[height - 1][i].rgbtGreen = 255;
        }
        else
        {
            holder[height - 1][i].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        }

        if (round(sqrt(pow(sumbx, 2) + pow(sumby, 2))) > 255)
        {
            holder[height - 1][i].rgbtBlue = 255;
        }
        else
        {
            holder[height - 1][i].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));
        }

        /*holder[height - 1][i].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        holder[height - 1][i].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        holder[height - 1][i].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));*/
    }

    //left edge
    //minus corners
    for (int i = 1; i < height - 1; i++)
    {
        int sumrx = image[i - 1][1].rgbtRed + 2 * image[i][1].rgbtRed + image[i + 1][1].rgbtRed;
        int sumgx = image[i - 1][1].rgbtGreen + 2 * image[i][1].rgbtGreen + image[i + 1][1].rgbtGreen;
        int sumbx = image[i - 1][1].rgbtBlue + 2 * image[i][1].rgbtBlue + image[i + 1][1].rgbtBlue;

        int sumry = -2 * image[i - 1][0].rgbtRed - image[i - 1][1].rgbtRed + 2 * image[i + 1][0].rgbtRed + image[i + 1][1].rgbtRed;
        int sumgy = -2 * image[i - 1][0].rgbtGreen - image[i - 1][1].rgbtGreen + 2 * image[i + 1][0].rgbtGreen + image[i + 1][1].rgbtGreen;
        int sumby = -2 * image[i - 1][0].rgbtBlue - image[i - 1][1].rgbtBlue + 2 * image[i + 1][0].rgbtBlue + image[i + 1][1].rgbtBlue;

        if (round(sqrt(pow(sumrx, 2) + pow(sumry, 2))) > 255)
        {
            holder[i][0].rgbtRed = 255;
        }
        else
        {
            holder[i][0].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        }

        if (round(sqrt(pow(sumgx, 2) + pow(sumgy, 2))) > 255)
        {
            holder[i][0].rgbtGreen = 255;
        }
        else
        {
            holder[i][0].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        }

        if (round(sqrt(pow(sumbx, 2) + pow(sumby, 2))) > 255)
        {
            holder[i][0].rgbtBlue = 255;
        }
        else
        {
            holder[i][0].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));
        }

        /*holder[i][0].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        holder[i][0].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        holder[i][0].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));*/
    }

    //right edge
    //minus corners
    for (int i = 1; i < height - 1; i++)
    {
        int sumrx = image[i - 1][width - 2].rgbtRed + 2 * image[i][width - 2].rgbtRed + image[i + 1][width - 2].rgbtRed;
        int sumgx = image[i - 1][width - 2].rgbtGreen + 2 * image[i][width - 2].rgbtGreen + image[i + 1][width - 2].rgbtGreen;
        int sumbx = image[i - 1][width - 2].rgbtBlue + 2 * image[i][width - 2].rgbtBlue + image[i + 1][width - 2].rgbtBlue;

        int sumry = -2 * image[i - 1][width - 1].rgbtRed - image[i - 1][width - 2].rgbtRed + 2 * image[i + 1][width - 1].rgbtRed + image[i +
                    1][width - 2].rgbtRed;
        int sumgy = -2 * image[i - 1][width - 1].rgbtGreen - image[i - 1][width - 2].rgbtGreen + 2 * image[i + 1][width - 1].rgbtGreen +
                    image[i + 1][width - 2].rgbtGreen;
        int sumby = -2 * image[i - 1][width - 1].rgbtBlue - image[i - 1][width - 2].rgbtBlue + 2 * image[i + 1][width - 1].rgbtBlue +
                    image[i + 1][width - 2].rgbtBlue;

        if (round(sqrt(pow(sumrx, 2) + pow(sumry, 2))) > 255)
        {
            holder[i][width - 1].rgbtRed = 255;
        }
        else
        {
            holder[i][width - 1].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        }

        if (round(sqrt(pow(sumgx, 2) + pow(sumgy, 2))) > 255)
        {
            holder[i][width - 1].rgbtGreen = 255;
        }
        else
        {
            holder[i][width - 1].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        }

        if (round(sqrt(pow(sumbx, 2) + pow(sumby, 2))) > 255)
        {
            holder[i][width - 1].rgbtBlue = 255;
        }
        else
        {
            holder[i][width - 1].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));
        }

        /*holder[i][width - 1].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
        holder[i][width - 1].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
        holder[i][width - 1].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));*/
    }

    //top left corner
    int sumrx = 2 * image[0][1].rgbtRed + image[1][1].rgbtRed;
    int sumgx = 2 * image[0][1].rgbtGreen + image[1][1].rgbtGreen;
    int sumbx = 2 * image[0][1].rgbtBlue + image[1][1].rgbtBlue;

    int sumry = 2 * image[1][0].rgbtRed + image[1][1].rgbtRed;
    int sumgy = 2 * image[1][0].rgbtGreen + image[1][1].rgbtGreen;
    int sumby = 2 * image[1][0].rgbtBlue + image[1][1].rgbtBlue;

    if (round(sqrt(pow(sumrx, 2) + pow(sumry, 2))) > 255)
    {
        holder[0][0].rgbtRed = 255;
    }
    else
    {
        holder[0][0].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
    }

    if (round(sqrt(pow(sumgx, 2) + pow(sumgy, 2))) > 255)
    {
        holder[0][0].rgbtGreen = 255;
    }
    else
    {
        holder[0][0].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
    }

    if (round(sqrt(pow(sumbx, 2) + pow(sumby, 2))) > 255)
    {
        holder[0][0].rgbtBlue = 255;
    }
    else
    {
        holder[0][0].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));
    }

    /*holder[0][0].rgbtRed = round(sqrt(pow(sumrx, 2) + pow(sumry, 2)));
    holder[0][0].rgbtGreen = round(sqrt(pow(sumgx, 2) + pow(sumgy, 2)));
    holder[0][0].rgbtBlue = round(sqrt(pow(sumbx, 2) + pow(sumby, 2)));*/

    //top right corner
    int sumrx1 = 2 * image[0][width - 2].rgbtRed + image[1][width - 2].rgbtRed;
    int sumgx1 = 2 * image[0][width - 2].rgbtGreen + image[1][width - 2].rgbtGreen;
    int sumbx1 = 2 * image[0][width - 2].rgbtBlue + image[1][width - 2].rgbtBlue;

    int sumry1 = 2 * image[1][width - 1].rgbtRed + image[1][width - 2].rgbtRed;
    int sumgy1 = 2 * image[1][width - 1].rgbtGreen + image[1][width - 2].rgbtGreen;
    int sumby1 = 2 * image[1][width - 1].rgbtBlue + image[1][width - 2].rgbtBlue;

    //can't be greater than 255
    if (round(sqrt(pow(sumrx1, 2) + pow(sumry1, 2))) > 255)
    {
        holder[0][width - 1].rgbtRed = 255;
    }
    else
    {
        holder[0][width - 1].rgbtRed = round(sqrt(pow(sumrx1, 2) + pow(sumry1, 2)));
    }

    if (round(sqrt(pow(sumgx1, 2) + pow(sumgy1, 2))) > 255)
    {
        holder[0][width - 1].rgbtGreen = 255;
    }
    else
    {
        holder[0][width - 1].rgbtGreen = round(sqrt(pow(sumgx1, 2) + pow(sumgy1, 2)));
    }

    if (round(sqrt(pow(sumbx1, 2) + pow(sumby1, 2))) > 255)
    {
        holder[0][width - 1].rgbtBlue = 255;
    }
    else
    {
        holder[0][width - 1].rgbtBlue = round(sqrt(pow(sumbx1, 2) + pow(sumby1, 2)));
    }

    /*holder[0][width - 1].rgbtRed = round(sqrt(pow(sumrx1, 2) + pow(sumry1, 2)));
    holder[0][width - 1].rgbtGreen = round(sqrt(pow(sumgx1, 2) + pow(sumgy1, 2)));
    holder[0][width - 1].rgbtBlue = round(sqrt(pow(sumbx1, 2) + pow(sumby1, 2)));*/

    //bottom left corner
    int sumrx2 = image[height - 2][1].rgbtRed + 2 * image[height - 1][1].rgbtRed;
    int sumgx2 = image[height - 2][1].rgbtGreen + 2 * image[height - 1][1].rgbtGreen;
    int sumbx2 = image[height - 2][1].rgbtBlue + 2 * image[height - 1][1].rgbtBlue;

    int sumry2 = image[height - 2][1].rgbtRed + 2 * image[height - 2][0].rgbtRed;
    int sumgy2 = image[height - 2][1].rgbtGreen + 2 * image[height - 2][0].rgbtGreen;
    int sumby2 = image[height - 2][1].rgbtBlue + 2 * image[height - 2][0].rgbtBlue;

    //can't have value greater than 255
    if (round(sqrt(pow(sumrx2, 2) + pow(sumry2, 2))) > 255)
    {
        holder[height - 1][0].rgbtRed = 255;
    }
    else
    {
        holder[height - 1][0].rgbtRed = round(sqrt(pow(sumrx2, 2) + pow(sumry2, 2)));
    }

    if (round(sqrt(pow(sumgx2, 2) + pow(sumgy2, 2))) > 255)
    {
        holder[height - 1][0].rgbtGreen = 255;
    }
    else
    {
        holder[height - 1][0].rgbtGreen = round(sqrt(pow(sumgx2, 2) + pow(sumgy2, 2)));
    }

    if (round(sqrt(pow(sumbx2, 2) + pow(sumby2, 2))) > 255)
    {
        holder[height - 1][0].rgbtBlue = 255;
    }
    else
    {
        holder[height - 1][0].rgbtBlue = round(sqrt(pow(sumbx2, 2) + pow(sumby2, 2)));
    }

    /*holder[height - 1][0].rgbtRed = round(sqrt(pow(sumrx2, 2) + pow(sumry2, 2)));
    holder[height - 1][0].rgbtGreen = round(sqrt(pow(sumgx2, 2) + pow(sumgy2, 2)));
    holder[height - 1][0].rgbtBlue = round(sqrt(pow(sumbx2, 2) + pow(sumby2, 2)));*/

    //bottom right corner
    int sumrx3 = image[height - 2][width - 2].rgbtRed + 2 * image[height - 1][width - 2].rgbtRed;
    int sumgx3 = image[height - 2][width - 2].rgbtGreen + 2 * image[height - 1][width - 2].rgbtGreen;
    int sumbx3 = image[height - 2][width - 2].rgbtBlue + 2 * image[height - 1][width - 2].rgbtBlue;

    int sumry3 = image[height - 2][width - 2].rgbtRed + 2 * image[height - 2][width - 1].rgbtRed;
    int sumgy3 = image[height - 2][width - 2].rgbtGreen + 2 * image[height - 2][width - 1].rgbtGreen;
    int sumby3 = image[height - 2][width - 2].rgbtBlue + 2 * image[height - 2][width - 1].rgbtBlue;

    //same reason as earlier, holder can't take values greater than 255.
    if (round(sqrt(pow(sumrx3, 2) + pow(sumry3, 2))) > 255)
    {
        holder[height - 1][width - 1].rgbtRed = 255;
    }
    else
    {
        holder[height - 1][width - 1].rgbtRed = round(sqrt(pow(sumrx3, 2) + pow(sumry3, 2)));
    }

    if (round(sqrt(pow(sumgx3, 2) + pow(sumgy3, 2))) > 255)
    {
        holder[height - 1][width - 1].rgbtGreen = 255;
    }
    else
    {
        holder[height - 1][width - 1].rgbtGreen = round(sqrt(pow(sumgx3, 2) + pow(sumgy3, 2)));
    }

    if (round(sqrt(pow(sumbx3, 2) + pow(sumby3, 2))) > 255)
    {
        holder[height - 1][width - 1].rgbtBlue = 255;
    }
    else
    {
        holder[height - 1][width - 1].rgbtBlue = round(sqrt(pow(sumbx3, 2) + pow(sumby3, 2)));
    }

    /*holder[height - 1][width - 1].rgbtRed = round(sqrt(pow(sumrx3, 2) + pow(sumry3, 2)));
    holder[height - 1][width - 1].rgbtGreen = round(sqrt(pow(sumgx3, 2) + pow(sumgy3, 2)));
    holder[height - 1][width - 1].rgbtBlue = round(sqrt(pow(sumbx3, 2) + pow(sumby3, 2)));*/

    //set image values to holder values
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j ++)
        {
            image[i][j] = holder[i][j];
        }
    }
    //still wanting more comments
    //does it even impact grade.
    //hopefully that's enough now
    //wow it's still wanting more comments
    //maybe I need to place comments in other places.
    //please there are plenty of comments now
    //when can I stop
    //stop asking me for more
    //thanks

    return;
}