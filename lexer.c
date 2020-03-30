
/*
 * Group no. 50
 * Aniruddha Mahajan -------- 2017A7PS0145P
 * Ravindra Singh Shekhawat - 2017A7PS0146P
 * Shreyas Srikrishna ------- 2017A7PS0162P
 * Chetan Sharma ------------ 2017A7PS0182P
 */
#include "lexer.h"
#include <ctype.h>
#include <string.h>
#include <math.h>

#define BUFF_SIZE 4096          //buffer size of 4KB
#define MAX_ID_LENGTH 20        //maximum length of identifiers

char keywords[33][15]={"integer","real","boolean","of","array","start","end","declare","module","driver","program","record","tagged","union","get_value","print","use","with","parameters","true","false","takes","input","returns","AND","OR","for","in","switch","case","break","default","while"};
char tokens[35][15]={"INTEGER","REAL","BOOLEAN","OF","ARRAY","START","END","DECLARE","MODULE","DRIVER","PROGRAM","RECORD","TAGGED","UNION","GET_VALUE","PRINT","USE","WITH","PARAMETERS","TRUE","FALSE","TAKES","INPUT","RETURNS","AND","OR","FOR","IN","SWITCH","CASE","BREAK","DEFAULT","WHILE", "DRIVERDEF", "DRIVERENDDEF"};

bool is_buff_empty=true;    //[GLOBAL bool] Flag bool that tells whether current input buffer (char* input_buffer) is empty or not
int state;              //[GLOBAL int] Current state in DFA
int lineNo=1;           //[GLOBAL int] Current line number of the source code file
int input_buffer_ptr=0;             //[GLOBAL int] Pointer to the current input buffer (char *input_buffer)
char input_buffer[BUFF_SIZE+1];     //[GLOBAL char*] Input Buffer (4097 Bytes long) that stores a chunk of the source code file 
HashTableEntry *hash_table[35];         //[GLOBAL HashTableEntry**] Hash-table for keywords (array of HashTableEntry pointers)

//variables for debugging:
int getNextTokenIteration=0;

void testLexer(char *filename){
    FILE *fileptr = fopen(filename,"r");
    if(fileptr == NULL){
        printf("\nError Opening File");
        return;
    }
    else{
        fillKeywordsHashTable();
        int token_count = 0;
        TokenDetails *tkn;
        while((tkn = getNextToken(fileptr)) != NULL){
            token_count++;
            if(tkn->is_err == false){
                     printf("\n %d Line Number = %d \tLexeme = %s \tToken_Name = %s ",token_count,tkn->line_no,tkn->lexeme,tkn->token);
            }
            else
            {
                    printf("\n LEXICAL ERROR - Line Number = %d Lexeme = %s,",tkn->line_no,tkn->lexeme);
            }
        }
    fclose(fileptr);
    }

}

/*------------------------------Utility Funtions------------------------------------*/

/*Converts a string NUM/RNUM to its equivlent float value*/
float findValue(char* arr){
    char* end;
    float real = strtof(arr, &end);
    float exponent = strtof(end, NULL);
    float ans = (real)*pow(10, exponent);
    return ans;
}

/*Returns hash value of a string, which is an integer in the range [0,34] */
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


/*This function creates and fills the keywords hashtable*/
void fillKeywordsHashTable(){
    int i;
    for(i=0;i<35;i++)       //initializing all slots in hash table to NULL pointers
        hash_table[i]=NULL;

    int key;
    for(i=0;i<35;i++)
    {
        HashTableEntry *hst=(HashTableEntry*)malloc(sizeof(HashTableEntry));
        key = hashFunction(keywords[i]);
        strcpy(hst->keyword_lex,keywords[i]);
        hst->keyword_id = i;
        hst->next = NULL;
        if(hash_table[key] != NULL)
        {
            HashTableEntry *temp = hash_table[key];
            while(temp->next!=NULL)
            {
                temp=temp->next;
            }
            temp->next = hst;
        }
        else
        {
            hash_table[key] = hst;
        }
    }
    printf("\nHash Table Populated");
}

/*This function looks up (char*)identifier in the (HashTableEntry**)hash_table. 
Returns : NULL if not keyword, 
          pointer to associated keyword's token if keyword*/
int lookup(char *identifier, HashTableEntry **hash_table){
    int id_hash = hashFunction(identifier);
    HashTableEntry *temp = hash_table[id_hash];
    if(temp == NULL)        //slot is empty
        return -1;
    while(temp->next != NULL){
        if(strcmp(identifier, temp->keyword_lex) == 0)
            return temp->keyword_id;
        else
            temp = temp->next;
    }
    if(strcmp(identifier, temp->keyword_lex) == 0)
        return temp->keyword_id;
    else
        return -1;
}

/*This function refreshes buffer 'buff' of length 'buff_len' and initialises it with '\0'*/
void refreshBuffer(char *buff, int buff_len){  
    memset(buff, 0, sizeof(char)*buff_len);
}


/*This function reads data from file.

Parameters :- 
    fp : file pointer of file from which we have to read
    buffer : character buffer into which data is to be read
    buff_size : integer denoting length of the buffer

Returns :- the file pointer if successful,
           and NULL if file is over
*/
FILE* getStream(FILE* fp, char *buffer, int buff_size)
{
    refreshBuffer(buffer, buff_size);
//printf("\n****");    
	if(fp==NULL){
        //error
        exit(1);
    }
    if(feof(fp)){
        //file finished
        fclose(fp);
        return NULL;
    }
    int no_of_chars_read;       //number of characters read into the input buffer
    if((no_of_chars_read=(fread(buffer, sizeof(char), buff_size, fp)))>0){
        buffer[no_of_chars_read]='\0';
		//printf("char read = %d",no_of_chars_read);       
        return fp;
    }
    else {
        //file finished
        fclose(fp);
        return NULL;
    }
}

void printOnConsole()
{
	FILE *fileptr = fopen("removedComments.txt","r");
	fseek(fileptr,0,SEEK_CUR);	
	if(fileptr == NULL)	
		printf("File not found\n");
	char ch;	
	while((ch=fgetc(fileptr))!=EOF)
	{
		printf("%c",ch);
	}
	fclose(fileptr);
}



/*This function removes comments from a testcaseFile and prints the output onto a cleanFile*/
void removeComments(char *testcaseFile)
{
    FILE *inFile = fopen(testcaseFile, "r");

    remove("removedComments.txt");  //delete existing(if any) output file
    FILE *outFile = fopen("removedComments.txt", "w");
	//printf("\n****");
    if(inFile == NULL || outFile == NULL){
        //error opening file
        exit(1);
    }

    char *buff_in = (char*)malloc(sizeof(char)*BUFF_SIZE);
    char *buff_out = (char*)malloc(sizeof(char)*BUFF_SIZE);
    int buff_out_length=0;

    /*State of the DFA implementation of removeComments
        state 0: (start state) we're outside a comment
        state 1: we are outside a comment, and have read only one '*'
        state 2: we are inside a comment
        state 3: we are inside a comment, and have read only one '*'
        */
    int state=0;


    while(true) {
		//printf("\n***");
		//printf("\n***%s", testcaseFile);
        inFile = getStream(inFile, buff_in, BUFF_SIZE);      //read 4KB block from file
        if(inFile == NULL)  //file is over
            return;
        
        int no_of_chars_read = strlen(buff_in);
        int ptr = 0;

        char ch;
        //printf("\n\nSTATE=%d\n\n", state);
        while(ptr<no_of_chars_read){
            ch=buff_in[ptr++];
            switch(state){
                case 0: if(ch != '*'){
                            buff_out[buff_out_length++]=ch;
                            state = 0;
                        }
                        else {
                            buff_out[buff_out_length++]=ch;
                            state = 1;
                        }
                        break;

                case 1: if(ch != '*'){
                            buff_out[buff_out_length++]=ch;
                            state = 0;
                        }
                        else {
                            buff_out[--buff_out_length] = '\0';
                            //printf("\nWriting inside DFA, case 1");
                            fwrite(buff_out, sizeof(char), buff_out_length, outFile);
                            refreshBuffer(buff_out, buff_out_length);
                            buff_out_length=0;
                            state = 2;
                        }
                        break;
                
                case 2: if(ch != '*')
                            state = 2;
                        else
                            state = 3;
                        break;

                case 3: if(ch !='*')
                            state = 2;
                        else 
                            state = 0;
            }
        }
			
        switch(state){
            case 0: //printf("%s",buff_out);
					fwrite(buff_out, sizeof(char), buff_out_length, outFile);
                    refreshBuffer(buff_out, buff_out_length);
                    buff_out_length=0;
                    break;

            case 1: buff_out[--buff_out_length]='\0';
                    //printf("\nWriting outside DFA, case 1\n");          
					//printf("%s",buff_out);                    
					fwrite(buff_out, sizeof(char), buff_out_length, outFile);
                    refreshBuffer(buff_out, buff_out_length);
                    buff_out_length=0;
                    buff_out[buff_out_length++]='*';
                    break;

            case 2: break;
            case 3: break;
        }    
    }
    fclose(inFile);
    fclose(outFile);
	printOnConsole();
}



/*This lexer function returns the next token from the source code file*/
TokenDetails* getNextToken(FILE *fileptr)
{
    if(is_buff_empty)        //if buffer is empty, we need to call getStream again to read a 4KB chunk from the file
    {
        fileptr = getStream(fileptr, input_buffer, BUFF_SIZE);
        if(fileptr == NULL){
            is_buff_empty=true;
            return NULL;
        }
        else 
            is_buff_empty = false;
    }
    
    state=0;
                                
    //input_buffer mai code store hua hai

    char *curr_lexeme = (char*)malloc(sizeof(char)*(MAX_ID_LENGTH+1)); //Character array that stores current lexeme (string of characters read till now, starting from start state in DFA). NOTE: Identifiers cannot exceed length of 20
    int curr_lexeme_pointer = 0;        //[LOCAL to getNextToken()] Pointer to the current lexeme character array (char *curr_lexeme)
    char currChar;              //[LOCAL to getNextToken()] The current input character (input to the CURRENT state)
    TokenDetails *tkn = (TokenDetails*)malloc(sizeof(TokenDetails));    //[LOCAL to getNextToken()] TokenDetails object that will be returned by this function
    while(1)
    {
        //getNextTokenIteration++;
        //printf("\ngetNextTokenIteration=%d", getNextTokenIteration);
        if(input_buffer_ptr>=BUFF_SIZE) {                                         //if we have reached end of the buffer
            fileptr = getStream(fileptr, input_buffer, BUFF_SIZE);                  //read from file into buffer
            if(fileptr == NULL)          //if file is over
                return NULL;                                                     
            input_buffer_ptr = 0;                                                   //reset input buffer pointer to 0
        }

        currChar = input_buffer[input_buffer_ptr];
        if(currChar == '\0') {           //if we have reached end of buffer 
            is_buff_empty = true;       //signal that buffer is empty
			break;
		}

        switch(state)
        {
            case 0:       
                    switch (currChar)
                    {
                        case '<':   state=1;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    input_buffer_ptr++;
                                    break;

                        case '>':   state=2;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    input_buffer_ptr++;
                                    break;
                        
                        case ':':   state=3;
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break;
                        
                        case '!':   state=4;
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break;

                        case '=':   state=5;
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break;    
                                    
                        case '+':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"PLUS");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;         

                        case '-':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"MINUS");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case '/':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"DIV");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case '.':   state=16;
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break;
                                    
                        case ';':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"SEMICOL");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case ',':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"COMMA");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case '[':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"SQBO");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case ']':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"SQBC");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case '(':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"BO");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case ')':   input_buffer_ptr++;
                                    tkn->is_num = false;
                                    tkn->is_err = false;
                                    strcpy(tkn->token,"BC");
                                    tkn->line_no = lineNo;
                                    curr_lexeme[curr_lexeme_pointer++] = currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->error=NULL;
                                    return tkn;
                                    break;

                        case 'a':   // ese saare likhne hai a-z | A-Z tak
                        case 'b':
                        case 'c':
                        case 'd':
                        case 'e':
                        case 'f':
                        case 'g':
                        case 'h':
                        case 'i':
                        case 'j':
                        case 'k':
                        case 'l':
                        case 'm':
                        case 'n':
                        case 'o':
                        case 'p':
                        case 'q':
                        case 'r':
                        case 's':
                        case 't':
                        case 'u':
                        case 'v':
                        case 'w':
                        case 'x':
                        case 'y':
                        case 'z':
                        case 'A':
                        case 'B':
                        case 'C':
                        case 'D':
                        case 'E':
                        case 'F':
                        case 'G':
                        case 'H':
                        case 'I':
                        case 'J':
                        case 'K':
                        case 'L':
                        case 'M':
                        case 'N':
                        case 'O':
                        case 'P':
                        case 'Q':
                        case 'R':
                        case 'S':
                        case 'T':
                        case 'U':
                        case 'V':
                        case 'W':
                        case 'X':
                        case 'Y':
                        case 'Z':   state=9;
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break;
                        case '0':   
                        case '1': 
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':   state=10; 
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break;
                        
                        case ' ':
                        case '\t':
                        case '\r':  input_buffer_ptr++;
                                    state=0;
                                    break;

                        case '\n':  input_buffer_ptr++;
                                    lineNo++;
									state=0;
                                    break;

                        case '*' :  state = 6;
                                    input_buffer_ptr++;
                                    curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    break; 
						
						case '\0': 	state=0;
									break;
									
                        default:   
                                    //input_buffer_ptr++;
                                    //curr_lexeme[curr_lexeme_pointer++]=currChar;
                                    curr_lexeme[curr_lexeme_pointer] = '\0';
                                    tkn->lexeme = (char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->lexeme, curr_lexeme);
                                    tkn->is_err = true;
                                    tkn->is_num = false;
                                    tkn->line_no = lineNo;
                                    tkn->error =(char*)malloc(sizeof(char)*21);
                                    strcpy(tkn->error,"Invalid Token");
                                    return tkn;
                    }
                    break;
            
            case 1: if(currChar == '<') {
                        state=17;                //need to add state 17 to DFA to recognize '<<<' operator
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        break;
                    }
                    else if(currChar == '=') {
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"LE");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else {
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"LT");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 2: if(currChar == '>') {
                        state=18;                
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        input_buffer_ptr++;
                    }
                    else if(currChar == '=') {
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"GE");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else {
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"GT");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 3: if(currChar == '='){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"ASSIGNOP");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else {      
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"COLON");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 4: if(currChar == '='){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"NE");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else {  
                        //input_buffer_ptr++;
                        //curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_err=true;
                        tkn->line_no=lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=(char*)malloc(sizeof(char)*21);
                        strcpy(tkn->error, "Invalid Token");
                        return tkn;
                    }
                    break;

            case 5: if(currChar == '='){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"EQ");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else {
                        //input_buffer_ptr++;
                        //curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_err=true;
                        tkn->line_no=lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=(char*)malloc(sizeof(char)*21);
                        strcpy(tkn->error, "Invalid Token");
                        return tkn;
                    }
                    break;

            case 6: if(currChar == '*'){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        tkn->line_no = lineNo;
                        state = 7;

                    }
                    else {
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"MUL");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;
            
            case 7: if(currChar == '*'){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        tkn->line_no = lineNo;
                        state = 8;
                    }
                    else {
                        if(currChar=='\n')
                            lineNo++;
                        input_buffer_ptr++;
                        tkn->line_no = lineNo;
                        state = 7;
                    }
                    break;
            
            case 8: if(currChar == '*'){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"COMMENTMARK");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else {  
                        if(currChar=='\n')
                            lineNo++;
                        input_buffer_ptr++;
                        tkn->line_no=lineNo;
                        state=7;
                    }
                    break;
            
            case 9: if(isalnum(currChar) || currChar == '_'){
                        if(curr_lexeme_pointer>=20)        //identifier length exceeded
                            curr_lexeme = (char*)realloc(curr_lexeme, sizeof(char)*(MAX_ID_LENGTH+1)*5); 
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        state = 9;
                    }

                    else {
                        if(curr_lexeme_pointer>=20){
                            input_buffer_ptr++;
                            tkn->is_err=true;
                            tkn->line_no=lineNo;
                            curr_lexeme[curr_lexeme_pointer] = '\0';
                            tkn->lexeme = (char*)malloc(sizeof(char)*(MAX_ID_LENGTH+1)*5);
                            strcpy(tkn->lexeme, curr_lexeme);
                            tkn->error=(char*)malloc(sizeof(char)*40);
                            strcpy(tkn->error, "Identifier cannot be longer than 20");
                            return tkn;
                        }
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        int lookup_value = lookup(curr_lexeme, hash_table);
                        if(lookup_value != -1) {       //if curr_lexeme is a keyword
                            tkn->is_num = false;
                            tkn->is_err = false;
                            strcpy(tkn->token, tokens[lookup_value]);
                            tkn->line_no = lineNo;
                            tkn->lexeme = (char*)malloc(sizeof(char)*21);
                            strcpy(tkn->lexeme,curr_lexeme);
                            tkn->error=NULL;
                            return tkn;
                        }
                        else {                                      //if curr_lexeme is an identifier
                            tkn->is_num = false;
                            tkn->is_err = false;
                            strcpy(tkn->token,"ID");
                            tkn->line_no = lineNo;
                            tkn->lexeme = (char*)malloc(sizeof(char)*21);
                            strcpy(tkn->lexeme,curr_lexeme);
                            tkn->error=NULL;
                            return tkn;
                        }
                    }
                    break;

            case 10: if(isdigit(currChar)) {
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        state = 10;
                    }
                    else if(currChar == '.') {
                        state = 11;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    }
                    else if(currChar == 'e' || currChar == 'E') {
                        state = 13;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    } 
                    else {
                        tkn->is_num = true;
                        tkn->is_err = false;
                        strcpy(tkn->token,"NUM");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->value = findValue(curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 11: if(isdigit(currChar)){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                        state=12;
                    }
                    else if(currChar == '.'){
                        input_buffer_ptr--;
                        curr_lexeme[curr_lexeme_pointer-1]='\0';
                        curr_lexeme[curr_lexeme_pointer]='\0';
                        tkn->is_num = true;
                        tkn->is_err = false;
                        strcpy(tkn->token,"NUM");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->value = findValue(curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                        
                    } 
                    else{
                        //input_buffer_ptr++;
                        //curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_err=true;
                        tkn->line_no=lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=(char*)malloc(sizeof(char)*21);
                        strcpy(tkn->error, "Invalid Token");
                        return tkn;
                    }
                    break;

            case 12: if(isdigit(currChar)){
                        state = 12;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    }
                    else if(currChar == 'E' || currChar == 'e'){
                        state=13;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    } 
                    else{
                        tkn->is_num = true;
                        tkn->is_err = false;
                        strcpy(tkn->token,"RNUM");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->value = findValue(curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 13: if(currChar == '+' || currChar == '-'){
                        state = 14;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    }
                    else if(isdigit(currChar)){
                        state = 15;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    } 
                    else{
                        //input_buffer_ptr++;
                        ///curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_err=true;
                        tkn->line_no=lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=(char*)malloc(sizeof(char)*21);
                        strcpy(tkn->error, "Invalid Token");
                        return tkn;
                    }
                    break;

            case 14: if(isdigit(currChar)){
                        state = 15;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    }
                    else{
                        //input_buffer_ptr++;
                        //curr_lexeme[curr_lexeme_pointer++]=currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_err=true;
                        tkn->line_no=lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=(char*)malloc(sizeof(char)*21);
                        strcpy(tkn->error, "Invalid Token");
                        return tkn;
                    }
                    break;

            case 15: if(isdigit(currChar)){
                        state = 15;
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++]=currChar;
                    }
                    else{
                        tkn->is_num = true;
                        tkn->is_err = false;
                        strcpy(tkn->token,"RNUM");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->value = findValue(curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 16: if(currChar == '.'){
						input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++] = currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"RANGEOP");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else{
                        //input_buffer_ptr++;
                        //curr_lexeme[curr_lexeme_pointer++] = currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_err=true;
                        tkn->line_no=lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=(char*)malloc(sizeof(char)*21);
                        strcpy(tkn->error, "Invalid Token");
                        return tkn;
                    }
                    break;

            case 17: if(currChar == '<'){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++] = currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"DRIVERDEF");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    else{
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"DEF");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;

            case 18: if(currChar == '>'){
                        input_buffer_ptr++;
                        curr_lexeme[curr_lexeme_pointer++] = currChar;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"DRIVERENDDEF");
                        tkn->line_no = lineNo;
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme,curr_lexeme);
                        tkn->error=NULL;
                        return tkn;

                    }
                    else{
                        tkn->is_num = false;
                        tkn->is_err = false;
                        strcpy(tkn->token,"ENDDEF");
                        tkn->line_no = lineNo;
                        curr_lexeme[curr_lexeme_pointer] = '\0';
                        tkn->lexeme = (char*)malloc(sizeof(char)*21);
                        strcpy(tkn->lexeme, curr_lexeme);
                        tkn->error=NULL;
                        return tkn;
                    }
                    break;
        }
    }
}

