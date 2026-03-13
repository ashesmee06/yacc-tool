%{
#include <stdio.h>
#include <ctype.h>

int yylex();
void yyerror(char *s);
%}

%token NUMBER

%%

expr: expr '+' expr { printf("Result = %d\n", $1 + $3); }
    | NUMBER
    ;

%%

int yylex() {
    int c;
    c = getchar();

    if (isdigit(c)) {
        yylval = c - '0';
        return NUMBER;
    }

    return c;
}

void yyerror(char *s) {
    printf("Error\n");
}

int main() {
    printf("Enter expression (example: 3+4)\n");
    yyparse();
    return 0;
}
