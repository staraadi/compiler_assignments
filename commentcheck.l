%{
int count_start = 0, count_end = 0;
%}

%%
"/*" {count_start++; }
"*/" {
	if(count_start > count_end)
	{
		count_end++; 
	}
     }

\n {
	if((count_start != count_end) || (count_end == 0))
	{
		printf("Invalid comment\n");
	}
	else
	{
		printf("Valid comment\n");
	}
	count_start = 0;
	count_end = 0;
	
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

