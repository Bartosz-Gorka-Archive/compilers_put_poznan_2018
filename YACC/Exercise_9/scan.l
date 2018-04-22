%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  #include "y.tab.h"
%}
%%

[0-7]		{ return yytext[0]; }
"|"     { return '|';       }
\n      ;

%%
int yywrap(void) { return 1; }
