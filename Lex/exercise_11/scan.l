%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);
%}
%%

(B|b)(E|e)(G|g)(I|i)(N|n)\  { printf("KWD ");  }
(E|e)(N|n)(D|d)\            { printf("KWD ");  }
(E|e)(N|n)(D|d)\n           { printf("KWD\n"); }
[a-zA-Z_][a-zA-Z0-9_]*      { printf("ID");    }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
