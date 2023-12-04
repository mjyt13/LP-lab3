%{
#include <stdio.h> 
#include <string.h>
#include "intcalc.tab.h"   
%}

%%

[0-9]+ {yylval = atoi(yytext); return NUMBER;}
"+" {return ADD;}
"-" {return SUB;}
\n {return EOL;}

[ \t] ;

%%
