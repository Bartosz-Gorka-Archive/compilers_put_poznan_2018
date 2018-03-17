%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%%

^\[.*\]   {
            printf("%s\n", yytext);
          }
.         ;
\n        ;

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
