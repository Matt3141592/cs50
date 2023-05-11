// Implements a dictionary's functionality
#include <stdbool.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

void freelist(node *list);
// Number of buckets in hash table
const unsigned int N = 262144;

// Hash table
node *table[N];

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    node *cursor = table[hash(word)];
    
    while (cursor != NULL)
    {
        if (!strcasecmp(cursor -> word, word))
            return true;
        cursor = cursor -> next;
    }
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    
    unsigned long hash = 5381;

     while(*word)
         hash = ((hash << 5) + hash) + tolower(*word++);

     return hash & 262143;
     /*
 * A case-insensitive implementation of the djb2 hash function.
 * Change NUM_BUCKETS to whatever your number of buckets is.
 *
 * Adapted by Neel Mehta from
 * http://stackoverflow.com/questions/2571683/djb2-hash-function.
 */
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO
    FILE *in = fopen(dictionary, "r");
    if (in == NULL)
        return false;

    char *word = malloc(LENGTH);
    while (fscanf(in, "%s", word) != EOF)
    {
        //finds the right bucket to put the word into.
        int bucket = hash(word);

        node *n = malloc(sizeof(node));
        n -> next = table[bucket];
        strcpy(n -> word, word);
        table[bucket] = n;
    }
    free(word);
    fclose(in);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO
    int counter = 0;

    for (int i = 0; i < N; i++)
    {
        node *n = table[i];
        while (n != NULL)
        {
            counter++;
            n = n -> next;
        }
    }
    return counter;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    for (int i = 0; i < N; i++)
        freelist(table[i]);
    return true;
}

int len(node *list)
{
    int count = 0;
    while (list != NULL)
    {
        count++;
        list = list -> next;
    }
    return count;
}

void freelist(node *list)
{
    int count = 0;
    for (int i = 0; i < N; i++)
        count += len(table[i]);
    printf("%i\n", count - N);
    node *prev = list;
    while (list != NULL)
    {
        list = list -> next;
        free(prev);
        prev = list;
    }
}