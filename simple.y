%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int yylex();
void yyerror(char *s);
%}

%token INT ID NUM

%%

program:
        program stmt
        |
        ;

stmt:
      INT ID ';'        { printf("Valid declaration\n"); }
    | ID '=' NUM ';'    { printf("Valid assignment\n"); }
    ;

%%

void yyerror(char *s){
    printf("Syntax Error\n");
}

int main(){
    printf("Enter C-like statement:\n");
    yyparse();
    return 0;
}

int yylex(){
    char c = getchar();

    if(c=='i'){
        getchar(); getchar();   // nt
        return INT;
    }

    if(isalpha(c))
        return ID;

    if(isdigit(c))
        return NUM;

    return c;
}
