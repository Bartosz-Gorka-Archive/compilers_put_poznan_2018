%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%s CLEAR_SPACES
%%

<INITIAL>^[a-zA-Z]+ {
                      printf("%s:   ", yytext);
                      BEGIN CLEAR_SPACES;
                    }
<CLEAR_SPACES>\     ;
<CLEAR_SPACES>\n    {
                      ECHO;
                      BEGIN INITIAL;
                    }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
