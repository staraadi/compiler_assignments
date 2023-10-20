%{
%}

%%

^([A-Za-z0-9]+([*+][A-Za-z0-9]*|[.|][A-Za-z0-9]+)*)?$ {printf("%s Regular Expression identified\n", yytext);}
. {printf("%s It is not a valid Regular Expression\n", yytext);}

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

