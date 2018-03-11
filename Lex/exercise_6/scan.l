%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);

  int values[20];
  char operations[3];
  int counter = 0;
  int op_counter = 0;
  int sum = 0;
%}
%%

[0-9]+  { sscanf(yytext, "%d", &(values[counter]));         counter++;    }
[+*]    { sscanf(yytext, "%c", &(operations[op_counter]));  op_counter++; }
\n      {
          counter--; op_counter--;
          sum = values[counter];
          for(int i = counter - 1; i >= 0; i--) {
            if(operations[op_counter - i] == '+')
              sum += values[i];
            else
              sum *= values[i];
          }
          counter = op_counter = 0;

          printf("%d\n", sum);
        }
.       ;

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
