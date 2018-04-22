%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  #include "y.tab.h"
%}
%%

"or"    { return or;    }
"and"   { return and;   }
"true"  { return true;  }
"false" { return false; }
"("     { return '(';   }
")"     { return ')';   }
[\n\ ]	;
.       {
          printf("Invalid character (%c) in input file in line: %d", yytext[0], yylineno);
        }

%%
int yywrap(void) { return 1; }
