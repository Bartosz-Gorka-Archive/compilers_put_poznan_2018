%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
%}
%%

S : A B C { if($1 == $2 && $2 == $3) {
                printf("OK\n");
              } else {
                printf("ERROR\n");
              }
            }
  ;
A :         { $$ = 0;       }
  | A 'a'   { $$ = $1 + 1;  }
  ;
B :         { $$ = 0;       }
  | B 'b'   { $$ = $1 + 1;  }
  ;
C :         { $$ = 0;       }
  | C 'c'   { $$ = $1 + 1;  }
  ;

%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line %d\n", fmt, yylineno);
}
int main() { return yyparse(); }
