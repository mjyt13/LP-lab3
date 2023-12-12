%{
#include <stdio.h>    
#include <stdlib.h>    
#include "ast.h"

int yylex();
int yywrap(){
    return 1;
}
void yyerror(const char * s){
    fprintf(stderr,"ERROR IS FOUND IN %s ",s);
};
%}

%union {
    struct ast * a;
    double d;
}

%token <d> NUMBER
%left '+' '-' '*' '/'
%type <a> expr

%%

input: /* void*/
|input line;

line:
expr '\n'{printf("result equals %lf\n",eval($1));}
;

expr: NUMBER {$$=newnum($1);}
|expr '+' expr {$$=newast('+',$1,$3);}
|expr '-' expr {$$=newast('-',$1,$3);}
|expr '*' expr {$$=newast('*',$1,$3);}
|expr '/' expr {$$=newast('/',$1,$3);}
|'('expr')'{$$=$2;}
;
%%

int main(){
    yyparse();
    return 0;
}