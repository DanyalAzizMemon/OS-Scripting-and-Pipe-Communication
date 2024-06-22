# include <stdlib.h>
# include <unistd.h>
# include <string.h>
# include <stdio.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>



int main(int argc, char* argv[])
{
	FILE *f;	//file pointer
	char buf[1024];
	char temp;
	int i =0;
	int fd[2];
	
	
	f = fopen("editSource.txt","r");
	
	if(f==NULL)	//if file is not found
	{
		printf("The file is not found ");
		exit(0);	
	}
	
	while (temp != EOF)
	{
		
		temp = getc(f);
		buf[i] = temp;
		i++;	
	}

	fclose(f);
	
	char* args[] = {"./cp",buf,NULL};
	
	pid_t pid = fork();
	if (pid < 0)
		printf("process not created");

	else if (pid == 0)
	{
		execv(args[0],args);
		perror("\nexec command failed");
		return 1;
	}	
		
	else if(pid >0)
	{
		wait(NULL);
		char buff[1024];
		i=0;
		printf("\n\n-------------Reading contents from Count.txt passed by consumer Producer------------------");
		
		f = fopen("theCount.txt","r");
		if(f==NULL)	//if file is not found
		{
			printf("The file is not found ");
			exit(0);	
		}	
		
		temp = 'd';
		while (temp != EOF)
		{	
			temp = getc(f);
			buff[i] = temp;
			i++;	
		}
		
		printf("%s",buff);
		fclose(f);	
		
	}
	
}

