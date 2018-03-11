%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  int value;
%}
%s space
%%

^[ ]*[5]+[ ]*\n   {
                    yytext[yyleng-1] = 0;
                    printf("%s(+)\n", yytext);
                  }
^[ ]*[0-9]*[ ]*\n {
                    sscanf(yytext, "%d", &value);
                    yytext[yyleng-1] = 0;
                    if(value % 5 == 0)
                      printf("%s(+)\n", yytext);
                    else
                      printf("%s(-)\n", yytext);
                  }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
