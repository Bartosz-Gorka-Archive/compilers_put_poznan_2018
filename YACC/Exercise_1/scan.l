%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  #include "y.tab.h"
%}
%%
\*  { return '*';   }
\n  { return '\n';  }
.   { printf("Invalid character (%c) in input file in line: %d", yytext[0], yylineno); }
%%
int yywrap(void) { return 1; }
