%{
#include "calc.tab.h"   
%}

%%
[ \t] ;
[0-9]+\.[0-9]+ {yylval.d=atof(yytext);return NUMBER;}
\n return '\n';
. return yytext[0];

%%