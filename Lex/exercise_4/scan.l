%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%s space
%%

<INITIAL>^[ ]   { BEGIN space;         }
<space>[ ]      ;
<space>[^ ]     { BEGIN INITIAL; ECHO; }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
