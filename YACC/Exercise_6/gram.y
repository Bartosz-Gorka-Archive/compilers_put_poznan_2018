%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
  #include <stdio.h>
%}
%%

S : A B C   {
              if($1 == $2 && $2 == $3)
                puts("OK");
              else
                puts("ERROR");
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
void yyerror(const char *fmt, ...) {
  printf("%s\n", fmt);
}
int main() {
  return yyparse();
}
