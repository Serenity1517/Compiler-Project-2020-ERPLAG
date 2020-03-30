#include<stdio.h>
int main()
{
    FILE *f = fopen("generate.txt", "w");
    for(int i=1; i<=103; i++)
        fprintf(f, "\n\t\tcase %d:",i);
    fclose(f);
    return 0;
}