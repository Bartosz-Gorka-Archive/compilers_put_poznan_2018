%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%%

[^a-zA-Z\n] { printf("."); }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
