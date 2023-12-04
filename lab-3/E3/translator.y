%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "translator.tab.h"

int yylex(void);

void yyerror(const char * str){
    fprintf(stderr,"ERROR: %s\n",str);
}

int yywrap(){
    return 1;
}

int main(){
    yyparse();
}
    
%}

%union{
    double dval;
}

%token FNUM
%token ADD SUB MUL DIV
%token OBR EBR
%token EOL
%token END

%type <dval> FNUM
%type <dval> exp
%type <dval> term
%type <dval> factor

%%

commands: /* void */
| commands command
;

command: exp
|EOL {printf("\n");}
|END {printf("thanks for working\n");exit(0);}
;

exp: factor
|exp ADD factor {printf("+");}
|exp SUB factor {printf("-");}
;
factor: term
|factor MUL term {printf("*");}
|factor DIV term {printf("/");}
;
term: FNUM {printf("%f",$1);}
|OBR exp EBR {$$=$2;}
;

%%