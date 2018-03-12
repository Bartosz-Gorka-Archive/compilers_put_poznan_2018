%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%s space
%%

^\ * ;

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
