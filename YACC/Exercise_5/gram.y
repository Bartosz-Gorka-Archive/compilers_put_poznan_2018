%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
  #include <stdio.h>
%}
%token num
%%

S : num ':' L   {
                  if($2 != 1)
                    puts("[]");
                }
  ;
L : num         {
                  $$ = 1;
                  if($-1 == 0) {
                    printf("[%d]\n", $1);
                    $0 = 1;
                  }
                }
  | L ',' num   {
                  $$ = $1 + 1;
                  if($-1 == $1) {
                    printf("[%d]\n", $3);
                    $0 = 1;
                  }
                }
  ;

%%
void yyerror(const char *fmt, ...) {
  printf("%s in line %d\n", fmt, yylineno);
}
int main() {
  return yyparse();
}
