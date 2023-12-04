%{

#include <stdio.h>
#include <string.h>
#include "intcalc.tab.h"
int yylex();

void yyerror(const char * s){
    fprintf(stderr,"ERROR: %s\n",s);
}

int yywrap(){
    return 1;
}

int main(int argc, char **argv){
    yyparse();
}

%}

%token NUMBER ADD SUB EOL

%%

calclist: 
|calclist exp EOL {printf("= %d\n",$2);}
;

exp: factor
|exp ADD factor{$$=$1+$3;}
|exp SUB factor{$$=$1-$3;}
;

factor: term
;

term: NUMBER
;
%%
