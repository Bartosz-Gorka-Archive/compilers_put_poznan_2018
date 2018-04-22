%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
%}
%union {
  char* text;
  int ival;
}
%token <text> id
%token <ival> num
%type <ival> E P
%type <text> N
%left '+' '-'
%left '*' '/'
%%

S : F
  | F S
  ;
F : N '(' P ')' ';'   {
                        printf("call %s\n", $1);
                        if($3) {
                          printf("add sp, %d\n\n", $3);
                        }
                      }
  ;
N : id        { $$ = $1; }
  ;
P :           { $$ = 0;                               }
  | E         { $$ = 1; printf("push %d\n", $1);      }
  | P ',' E   { printf("push %d\n", $3); $$ = $1 + 1; }
  ;
E : E '-' E   { $$ = $1 - $3; }
  | E '+' E   { $$ = $1 + $3; }
  | E '*' E   { $$ = $1 * $3; }
  | E '/' E   { $$ = $1 / $3; }
  | '(' E ')' { $$ = $2;      }
  | num       { $$ = $1;      }
  ;

%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
