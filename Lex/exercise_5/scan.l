%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
  int value;
%}
%%

^\ *[0-9]*[05]+\ */\n { ECHO; printf("(+)"); }
^\ *[0-9]+\ */\n      { ECHO; printf("(-)"); }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
