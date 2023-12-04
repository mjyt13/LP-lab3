%{
#include <stdio.h>
%}

%%

"-"[0-9]+ {printf("%s - INTEGER NUMBER LESS THAN 0\n",yytext);}

"0"+ {printf("%s - NUMBER EQUALS 0\n",yytext);}

[1-9][0-9]* {printf("%s - INTEGER NUMBER MORE THAN 0\n",yytext);}

"-"?[0-9]+"."[0-9]+ {printf("%s - FLOAT NUMBER\n", yytext);}

[-+*/%&] {printf("%s - OPERATOR\n",yytext);}

[a-zA-Z][a-zA-Z0-9]* {printf("%s - STRING\n",yytext);}

[ \t]+ ;

. ;

%%
