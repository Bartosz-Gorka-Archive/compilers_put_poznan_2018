%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  #include "y.tab.h"
%}
%%
";"                       { return ';'; }
"+"                       { return '+'; }
"*"                       { return '*'; }
"-"                       { return '-'; }
"/"                       { return '/'; }
"("                       { return '('; }
")"                       { return ')'; }
","                       { return ','; }
[0-9]+                    {
                            yylval.ival = atoi(yytext);
                            return num;
                          }
[A-Za-z_][a-zA-Z0-9_]*    {
                            yylval.text = strdup(yytext);
                            return id;
                          }
[ \t\n]                   ;
%%
int yywrap(void) { return 1; }
