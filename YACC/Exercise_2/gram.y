%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
  #include <stdio.h>
%}
%%

S : A B C D {
              if($1 == $2 && $3 == $4)
                puts("OK");
              else
                puts("ERROR");
            }
  ;
A : 'a'     { $$ = 1;       }
  | A 'a'   { $$ = $1 + 1;  }
  ;
B : 'b'     { $$ = 1;       }
  | B 'b'   { $$ = $1 + 1;  }
  ;
C : 'c'     { $$ = 1;       }
  | C 'c'   { $$ = $1 + 1;  }
  ;
D : 'd'     { $$ = 1;       }
  | D 'd'   { $$ = $1 + 1;  }
  ;

%%
void yyerror(const char *fmt, ...) {
  puts("ERROR");
}
int main() {
  return yyparse();
}
