%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
  #include <stdio.h>
  #define ERR_NO -199
%}
%%

S : L         {
                if($1 > 0)
                  puts("OK");
                else
                  puts("ERROR");
              }
  ;
L : G '\n'    {
                $$ = $1;
              }
  | L G '\n'  {
                if($1 + 1 == $2)
                  $$ = $2;
                else
                  $$ = ERR_NO;
              }
  | L '\n'    {
                puts("ERROR");
                return ERR_NO;
              }
  ;
G : 'x'       { $$ = 1;       }
  | G 'x'     { $$ = $1 + 1;  }
  ;

%%
void yyerror(const char *fmt, ...) {
  printf("%s in line %d\n", fmt, yylineno);
}
int main() {
  return yyparse();
}
