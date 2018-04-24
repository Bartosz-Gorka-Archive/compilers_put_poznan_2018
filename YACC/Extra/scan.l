%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  #include "y.tab.h"
%}
%%

[01&]		{ return yytext[0]; }
\ |\n   ;

%%
int yywrap(void) { return 1; }
