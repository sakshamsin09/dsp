digit [0-9]
digits {digit}*
letter [A-Za-z]
word {letter}+
%%
{word}		{printf("\n%s is a word\n",yytext);}
{digits}	{printf("\n%s is a number\n",yytext);}
%%
int yywrap(void){}
int main()
{
	yylex();
	return 0;
}
