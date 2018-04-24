%{
  int yylex(void);
  void yyerror(const char *,...);
  int yyparse(void);
  extern int yylineno;
  #include <stdio.h>
%}
%%

S : K '&' '1' { printf("a"); }
  | K L '0'   { printf("b"); }
  ;
K : '0'       { printf("c"); }
  | '0' K     { printf("d"); }
  | '1'       { printf("e"); }
  | '1' K     { printf("f"); }
  ;
L : '&'       { printf("g"); }
  ;

%%
void yyerror(const char *fmt, ...) {
  printf("%s\n", fmt);
}
int main() {
  return yyparse();
}
