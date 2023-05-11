//
//  main.c
//  Assignment1
//
//  Created by Matthew Lee on 05/10/2022.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct _Node Node;

struct _Node
{
    int x;
    struct _Node *left;
    struct _Node *right;
};

Node *addNode(Node *root, int value);
Node *removeNode(Node *root, int value);
void displaySubtree(Node *N);
int numberLeaves(Node *N);
Node *removeSubtree(Node *root, int value);
int nodeDepth(Node *root, Node *N);

int main(void)
{
    Node *a = addNode(NULL, 1);
    for (int i = 2; i < 10; i++)
        addNode(a, i);
    Node *b = addNode(a, 10);
    
    displaySubtree(a);
    printf("%d\n", nodeDepth(a,b));
    
    a = removeNode(a, 3);
    
    for (int i = 0; i < 11; i++)
        a = removeNode(a, i);
}

Node *addNode(Node *root, int value)
{
    Node *n = malloc(sizeof(struct _Node));
    n -> x = value;
    n -> left = NULL;
    n -> right = NULL;
    
    while (root != NULL)
    {
        if (value < root -> x)
        {
            if (root -> right != NULL)
                root = root -> right;
            else
            {
                root -> right = n;
                break;
            }
        }
        else if (value > root -> x)
        {
            if (root -> left != NULL)
                root = root -> left;
            else
            {
                root -> left = n;
                break;
            }
        }
        else
        {
            free(n);
            return NULL; // for when the Node already exists
        }
    }
    root = n;
    
    return n;
}

/*Node *removeNode(Node *root, int value)
{
    if (root == NULL)
        return NULL;
    
    if (value == root -> x) // at the Node that needs to be deleted, so return left or right or NULL to replace
    {
        Node *left = root -> left;
        Node *right = root -> right;
        free(root);
        
        if (left != NULL) //replacing with the left and adding the right tree to it
        {
            Node *temp = left;
            while (temp -> right != NULL) //finds a space for the right subtree
                temp = temp -> right;
            temp -> right = right;
            return left;
        }
        return right;
    }
    
    if (value < root -> x)
        root -> right = removeNode(root -> right, value);
    else
        root -> left = removeNode(root -> left, value);
    return root;
}*/

Node *removeNode(Node *root, int value)
{
    if (root == NULL)
        return NULL;
    
    if (value == root -> x)
    {
        if (root -> right == NULL) // case where there is no right node. returns whatever is on the left
        {
            Node *left = root -> left;
            free(root);
            return left;
        }
        // when right is not NULL, find left most and replace.
        Node *temp = root -> right;
        if (temp -> left != NULL)
        {
            while (temp -> left -> left != NULL)
                temp = temp -> left;
            Node *left = temp -> left;
            left -> left = root -> left;
            left -> right = root -> right;
            temp -> left = temp -> left -> right;
            free(root);
            return left;
        }
        temp -> left = root -> left;
        free(root);
        return temp;
    }
    
    if (value < root -> x)
        root -> right = removeNode(root -> right, value);
    else
        root -> left = removeNode(root -> left, value);
    return root;
}

void displaySubtree(Node *N)
{
    if (N == NULL)
        return;
    
    displaySubtree(N -> right);
    printf("%d\n", N -> x);
    displaySubtree(N -> left);
}

int numberLeaves(Node *N)
{
    if (N == NULL)
        return 0;
    
    if (N -> left == NULL && N -> right == NULL)
        return 1;
    
    return numberLeaves(N -> left) + numberLeaves(N -> right);
}

Node *removeSubtree(Node *root, int value)
{
    if (root -> x == value)
    {
        if (root -> right != NULL)
            removeSubtree(root -> right, root -> right -> x);
        if (root -> left != NULL)
            removeSubtree(root -> left, root -> left -> x);
        free(root);
        return NULL;
    }
    
    if (value > root -> x && root -> left != NULL)
        root -> left = removeSubtree(root -> left, value);
    else if (value < root -> x && root -> right != NULL)
        root -> right = removeSubtree(root -> right, value);
    
    return root;
}

int nodeDepth(Node *root, Node *N)
{
    if (root == N)
        return 0;
    
    if (N -> x > root -> x && root -> left != NULL)
    {
        int x = nodeDepth(root -> left, N);
        return  x += (x != -1);
    }
    
    if (N -> x < root -> x && root -> right != NULL)
    {
        int x = nodeDepth(root -> right, N);
        return x += (x != -1);
    }

    return -1;
}
