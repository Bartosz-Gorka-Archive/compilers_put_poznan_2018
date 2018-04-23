%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
  #include <stdio.h>
%}
%%

S : A B     {
              if($1 == $2)
                puts("OK");
            }
  ;
A : 'a'     { $$ = 1;       }
  | A 'a'   { $$ = $1 + 1;  }
  ;
B : 'b'     { $$ = 1;       }
  | B 'b'   { $$ = $1 + 1;  }
  ;

%%
void yyerror(const char *fmt, ...) {
  printf("%s in line: %d\n", fmt, yylineno);
}
int main() {
  return yyparse();
}
