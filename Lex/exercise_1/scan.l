%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  int selected_column = 0;
  int current_column = 0;
%}
%s column
%%
 /* ==   RULES   == */
<INITIAL>[0-9]+             {
                              sscanf(yytext, "%d", &selected_column);
                              BEGIN column;
                            }
<column>[a-zA-Z0-9 ]{5}\    {
                              current_column++;
                              if(current_column == selected_column) ECHO;
                            }
<column>\n                  {
                              current_column = 0;
                            }
.                           ;

 /* == END RULES == */
%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
