# include <stdlib.h>
# include <unistd.h>
# include <string.h>
# include <stdio.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>


void main(int argc, char* argv[])
{
	int file = open(argv[0],O_RDONLY);
	char *buf;
	int countChar = 0;
	int countWord = 0;
	int countLines = 0;
	
	
	buf = argv[1];
	printf("---------String passed from producerConsumer--------------\n\n%s",buf);
	
	for(int i=0; buf[i] != '\0'; i++)
	{
		if(buf[i] != ' ' && buf[i] != '\n')
			countChar++;
			
		else if(buf[i] == ' ')
			countWord++;
		
		else if(buf[i] == '\n')
		{
			countLines++;
			countWord++;
		}		
	}
	countChar = countChar-1;	
	printf("\nNumber of Words : %d",countWord);
	printf("\nNumber of Characters : %d",countChar);
	printf("\nNumber of Lines : %d",countLines);
	
	printf("\n\n\n--------------Writing the content to Count.txt-------------------");
	
	char output[3] ={countWord,countChar,countLines};
	char *a = output;
	
	FILE *f;
	f = fopen("theCount.txt","w");
	if (f==NULL)
	{
		printf("\nFile not created");
		exit(-1);
	}
	
	else
	{
		fprintf(f,"\nNumber of Characters : %d",a[1]);
		fprintf(f,"\nNumber of Words : %d",a[0]);
		fprintf(f,"\nNumber of Lines : %d:",a[2]);		
	}
	
	
	
}
