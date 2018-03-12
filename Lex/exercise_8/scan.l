%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);

  int zero_count;
  int one_count;
%}
%s ZERO
%s ONE
%s ERROR
%%

<INITIAL>^\n  { printf(" OK\n");                  }
<INITIAL>0    { ECHO; zero_count = 1; BEGIN ZERO; }

<ZERO>0       { ECHO; zero_count++;               }
<ZERO>1       { ECHO; one_count = 1; BEGIN ONE;   }

<ONE>1        { ECHO; one_count++;                }

<ERROR>\n     { printf(" Error\n"); BEGIN INITIAL;}
\n            {
                if(zero_count == one_count)
                  printf(" OK\n");
                else
                  printf(" Error\n");
              }
.             { ECHO; BEGIN ERROR;                }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
