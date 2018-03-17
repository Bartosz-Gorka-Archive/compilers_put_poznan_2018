%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%%

[0-9]+[ \n]   {
                ECHO;
                ECHO;
              }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
