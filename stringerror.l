%{
	#include<stdbool.h>
	bool string_started = false;
	int error = 0;
%}

%%

\" {
	if(string_started == false)
	{
		/*Start of a string */
		string_started = true;
	}
	else
	{
		/*End of the string */
		string_started = false;
	}
   }

\"[A-Za-z0-9]+\"[A-Za-z0-9]+ {
				error = 1;
			     }

. {}

\n {
	if ((string_started == true) || (error == 1))
	{
		fprintf(stderr , "Unterminated string at the end of line\n");
		string_started = 0;
	}
	else
	{
		printf("Correct string\n");
	}
}

%%
int main()
{
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}
