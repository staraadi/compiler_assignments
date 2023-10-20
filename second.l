%{
%}

DIGIT [0-9]	
NUMBER {DIGIT}+
LETTER [A-Za-z_]
ID {LETTER}+({LETTER}|{DIGIT})*
ARITHMETIC_OPERATORS ([+]|[*]|[%]|[-])?([+][+])?([-][-])?
LOGICAL_OPERATORS ([&][&])?([|][|])?
BITWISE_OPERATORS [&|^|!]
RELATIONAL_OPERATORS ([=][=])?([!][=])?[>]?[<]?([>][=])?([<][=])?

%%
 
while|if|else|switch|auto|break|case|char|const|continue|default|do|double|float|enum|extern|for|goto|int|long|register|return|short|signed|sizeof|static|struct|typedef|union|unsigned|void|volatile|while  {printf("%s keyword in c\n", yytext);} 
 
{ID} {printf("%s identifier in c\n", yytext);}
{DIGIT} {printf("%s digit in c\n", yytext);}
{NUMBER} {printf("%s number in c\n", yytext);}

{ARITHMETIC_OPERATORS} {printf("%s arithmetic operator in c\n", yytext);}
{RELATIONAL_OPERATORS} {printf("%s relational operator c\n", yytext);} 
{BITWISE_OPERATORS} {printf("%s bitwise operator c\n", yytext);} 
{LOGICAL_OPERATORS} {printf("%s logical operator c\n", yytext);}

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

