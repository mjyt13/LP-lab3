%{
#include <stdio.h>
%}

%%

"-"[0-9]+ {printf("%s - NUMBER LESS THAN 0\n",yytext);}
[0-9]+ {printf("%s - NUMBER MORE THAN 0\n",yytext);}

[-+*/%&] {printf("%s - OPERATOR\n",yytext);}

[a-zA-Z] {printf("%s - STRING\n",yytext);}

[\t]+ ;

%%
