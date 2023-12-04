%{

#include "translator.tab.h"   
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

%}

%%

[0-9]+[\.]?[0-9]* {yylval.dval = atof(yytext); return FNUM;}
"+"     {return ADD;}
"-"     {return SUB;}
"*"     {return MUL;}
"/"     {return DIV;}
"("     {return OBR;}
")"     {return EBR;}
\n      {return EOL;}
"stop"  {return END;}
[ \t]+ ;

%%