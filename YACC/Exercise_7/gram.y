%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
#include <stdio.h>
%}
%token or and false true
%%

S : E
  ;
E : E or T
  | E and T
  | T
  ;
T : true
  | false
  | '(' E ')'
  ;

%%
void yyerror(const char *fmt, ...)
{
  printf("%s in line: %d\n", fmt, yylineno);
}
int main() {
  int status = yyparse();
  if(status == 0) {
    printf("OK\n");
  }
  return status;
}
