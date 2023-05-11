#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

// Max number of candidates
#define MAX 9

// preferences[i][j] is number of voters who prefer i over j
int preferences[MAX][MAX];

// locked[i][j] means i is locked in over j
bool locked[MAX][MAX];

int num_locked = 0; //number of pairs locked.

// Each pair has a winner, loser
typedef struct
{
    int winner;
    int loser;
}
pair;

// Array of candidates
string candidates[MAX];
pair pairs[MAX * (MAX - 1) / 2];

int pair_count;
int candidate_count;

// Function prototypes
bool vote(int rank, string name, int ranks[]);
void record_preferences(int ranks[]);
void add_pairs(void);
void sort_pairs(void);
void lock_pairs(void);
bool loop(int start, int end);
void print_winner(void);
int stack[10];

int main(int argc, string argv[])
{
    for (int i = 0; i < MAX; i++)
    {
        for (int j = 0; j < MAX; j++)
        {
            preferences[i][j] = 0;
        }
    }


    // Check for invalid usage
    if (argc < 2)
    {
        printf("Usage: tideman [candidate ...]\n");
        return 1;
    }

    // Populate array of candidates
    candidate_count = argc - 1;
    if (candidate_count > MAX)
    {
        printf("Maximum number of candidates is %i\n", MAX);
        return 2;
    }
    for (int i = 0; i < candidate_count; i++)
    {
        candidates[i] = argv[i + 1];
    }

    // Clear graph of locked in pairs
    for (int i = 0; i < candidate_count; i++)
    {
        for (int j = 0; j < candidate_count; j++)
        {
            locked[i][j] = false;
        }
    }

    //pair_count = candidate_count * (candidate_count - 1) / 2;
    int voter_count = get_int("Number of voters: ");

    // Query for votes
    for (int i = 0; i < voter_count; i++)
    {
        // ranks[i] is voter's ith preference
        int ranks[candidate_count];

        for (int j = 0; j < candidate_count; j++)
        {
            ranks[j] = 10;
        }

        // Query for each rank
        for (int j = 0; j < candidate_count; j++)
        {
            string name = get_string("Rank %i: ", j + 1);

            if (!vote(j, name, ranks))
            {
                printf("Invalid vote.\n");
                return 3;
            }
        }

        record_preferences(ranks);

        printf("\n");
    }

    /*for (int i = 0; i < candidate_count; i++) //testing preferences =========
    {
        for (int j = 0; j < candidate_count; j++)
        {
            printf("%i\n", preferences[i][j]); // pretty sure preferences is working now.
        }
    }*/

    add_pairs();
    sort_pairs();
    lock_pairs();
    print_winner();
    return 0;
}

// Update ranks given a new vote
bool vote(int rank, string name, int ranks[])
{
    for (int i = 0; i < candidate_count; i ++)
    {
        if (strcmp(name, candidates[i]) == 0)
        {
            for (int j = 0; j < candidate_count; j++)
            {
                if (i == ranks[j]) // checks for repeated votes.
                {
                    return false;
                }
            }

            ranks[rank] = i; // in terms of a candiate's position in the candidates array.
            return true;
        }
    }
    return false;
}

// Update preferences given one voter's ranks
void record_preferences(int ranks[])
{
    // preferences. Number of votes the prefer i over j.

    for (int i = 0; i < candidate_count; i++)
    {
        int rank_i;
        for (int j = 0; j < candidate_count; j++) // finds the rank of i
        {
            if (ranks[j] == i)
            {
                rank_i = j;
            }
        }

        for (int j = 0; j < candidate_count; j++)
        {
            int rank_j;
            for (int k = 0; k < candidate_count; k++) // find the rank of j
            {
                if (ranks[k] == j)
                {
                    rank_j = k;
                }
            }
            if (i == j)
            {
                preferences[i][j] = 0;
            }
            else if (rank_i < rank_j)
            {
                preferences[i][j] += 1;
            }
        }
    }
    for (int i = 0; i < candidate_count; i++)
    {
        ranks[i] = 10; //wipes ranks each time
    }
    return;
}

// Record pairs of candidates where one is preferred over the other
void add_pairs(void)
{
    // update pair, there's a int called winner and int called loser.
    // pairs are in the order, first candidate second, first third... first last then second third, second fourth...
    // check wins against total votes, if greater than half the total votes, then it's a win.
    for (int i = 0; i < candidate_count; i++)
    {
        for (int j = 0; j < candidate_count; j++)
        {
            if (preferences[i][j] > preferences[j][i])
            {
                pairs[pair_count].winner = i;
                pairs[pair_count].loser = j;
                pair_count++;
            }
        }
    }
    for (int i = 0; i < pair_count; i++)
    {
        if (pairs[i].winner != pairs[i].loser)
        {
            printf("winner and loser %i %i\n", pairs[i].winner, pairs[i].loser);
        }
    }

    return;
}

// Sort pairs in decreasing order by strength of victory
void sort_pairs(void)
{
    int strength[pair_count];
    int counter = 0;

    for (int i = 0; i < candidate_count; i++)
    {
        for (int j = 0; j < candidate_count; j++)
        {
            if (preferences[i][j] > preferences[j][i])
            {
                int hold = preferences[i][j] - preferences[j][i];
                printf("%i %i\n", hold, preferences[i][j]);
                strength[counter] = sqrt(hold * hold);
                counter++;
            }
        }
    }

    for (int i = 0; i < pair_count; i++)
    {
        //using bubble sort to sort wins in terms of decreasing strength. Could add a number of swaps checker incase it's already sorted by it's quite a small list so it's fine.
        for (int j = 0; j < pair_count - i - 1; j++) 
        {
            if (strength[j] < strength[j + 1])
            {
                int hold = strength[j + 1];
                strength[j + 1] = strength[j];
                strength[j] = hold;

                hold = pairs[j + 1].winner;
                int hold2 = pairs[j + 1].loser;
                pairs[j + 1].winner = pairs[j].winner;
                pairs[j + 1]. loser = pairs[j].loser;
                pairs[j].winner = hold;
                pairs[j].loser = hold2;
            }
        }
    }
    for (int i = 0; i < pair_count; i++)
    {
        printf("%i\n", strength[i]); //appears to be working. assume that everything has been sorted right.
    }
    return;
}

// Lock pairs into the candidate graph in order, without creating cycles
void lock_pairs(void)
{
    for (int i = 0; i < pair_count; i++)
    {
        int start = pairs[i].winner;
        int end = pairs[i].loser;

        if (loop(start, end) == false)
        {
            locked[start][end] = true;
        }
    }
}

bool loop(int start, int end)
{
    if (start == end)
    {
        return true;
    }
    for (int i = 0; i < candidate_count; i++)
    {
        if (locked[end][i] == true)
        {
            if (i == start)
            {
                return true;
            }
            else if (loop(start, i) == true)
            {
                return true;
            }
        }
    }
    return false;

}

// Print the winner of the election
void print_winner(void)
{
    int count = 0;
    for (int i = 0; i < candidate_count; i++)
    {
        for (int j = 0; j < candidate_count; j++)
        {
            if (locked[j][i] == true)
            {
                count++;
            }
        }
        if (count == 0)
        {
            printf("%s\n", candidates[i]);
            return;
        }
        count = 0;
    }

    return;
}

