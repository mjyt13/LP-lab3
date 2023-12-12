#include <stdio.h>
#include <stdlib.h>
#include "ast.h"

struct ast *newast(int nodetype, struct ast* l, struct ast *r){
    struct ast * a  = malloc(sizeof(struct ast));
    if(a==NULL){
        fprintf(stderr, "Error Out Of Memory\n");
        exit(1);
    }
    a->nodetype=nodetype;
    a->l=l;
    a->r=r;
    return a;
}

struct ast *newnum(double d)
{
    struct numval * a = malloc(sizeof(struct numval));
    if(a==NULL){
        fprintf(stderr, "Error Out Of Memory\n");
        exit(1);
    }
    a->nodetype='K';
    a->number=d;
    return (struct ast * ) a;
}

double eval(struct ast *a){
    if(a==NULL){
        fprintf(stderr, "Error Zero node\n");
        return 0;
    }
    if(a->nodetype=='K'){
        return ((struct numval *)a)->number;
    }
    double dl = eval(a->l);
    double dr = eval(a->r);
    switch (a->nodetype)
    {
    case '+':
        return dl+dr;
    case '-':
        return dl-dr;
    case '*':
        return dl*dr;
    case '/':
        return (dr!=0)?(dl/dr):0;
    default:
        fprintf(stderr,"Unspported operation - %c",a->nodetype);
        return 0;
    }
}

void treefree(struct ast *a){
    if(a==NULL) return ;
    if(a->nodetype=='K'){
        free(a);
    } else if(a->nodetype == '+' || a->nodetype=='-' || a->nodetype=='*' || a->nodetype=='/'){
        treefree(a->l);
        treefree(a->r);
        free(a);
    } 
}