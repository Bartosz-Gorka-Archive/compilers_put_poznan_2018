%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);

  int last_counter = 0;
%}
%s ERROR
%%

<INITIAL>^X*    {
                  if(yyleng == last_counter + 1)
                    last_counter = yyleng;
                  else
                    BEGIN ERROR;
                }
<INITIAL>[\n ]  ;
<INITIAL>.      {
                  BEGIN ERROR;
                }
<ERROR>.        {
                  printf("yylex:Error !\n");
                  return -1;
                }
<<EOF>>         {
                  printf("OK\n");
                  return 1;
                }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
