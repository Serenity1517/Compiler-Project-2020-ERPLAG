#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>
#include<stdbool.h>

char keywords[33][15]={"integer","real","boolean","of","array","start","end","declare","module","driver","program","record","tagged","union","get_value","print","use","with","parameters","true","false","takes","input","returns","AND","OR","for","in","switch","case","break","default","while"};

typedef struct HashTableEntry{      //Structure of a Hash Table Entry (in the keywords hashtable, NOT symboltable)
    bool isKeyword;
    char keyword_lex[30];       // name of the keyword
    char keyword_tok[30];
    struct HashTableEntry *next;
}HashTableEntry;

int hashFunction(char *arr)
{
    int hashValue=0;
    int len=strlen(arr);
    int i;
    for(i=0;i<len;i++)
    {
        hashValue += arr[i];
        hashValue %= 35;
    }
    return hashValue;
}

HashTableEntry* fillKeywordsHashTable(){
    HashTableEntry *hash_table = (HashTableEntry*)malloc(sizeof(HashTableEntry)*35);
    int i=0;
    int key=0;
    for(i=0;i<35;i++)
    {
        HashTableEntry *hst=(HashTableEntry *)malloc(sizeof(HashTableEntry));
        key = hashFunction(keywords[i]);
        strcpy(hst->keyword_lex,keywords[i]);
        printf("%s******\n",keywords[i]);
        //yahan pe token bhejna hai
        hst->next = NULL;
        if(hash_table[key].next != NULL)
        {
            HashTableEntry *temp = hash_table[key].next;
            while(temp->next!=NULL)
            {
                temp=temp->next;
            }
            temp->next = hst;
        }
        else
        {
            hash_table[key] = *hst;
        }
    }
    return hash_table;

}

int main(){
    int arr[33]={0};

    int i=0;
   /* for(i=0;i<33;i++)
    {
        arr[hashFunction(keywords[i])]++;
    }*/
    HashTableEntry *hst = fillKeywordsHashTable();
    for(i=0;i<35;i++)
    {
        printf("%s\n",hst[i].keyword_lex);
    }

    return 0;
}
