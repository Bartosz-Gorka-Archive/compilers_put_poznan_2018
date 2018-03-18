%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);

  int counter_hash;
  int counter_dollar;
  int counter_percent;
  int last_length = 0;

  int check_counters();
%}
%s ERROR
%s HASH
%s DOLLAR
%s PERCENT
%s CORRECT
%%

<INITIAL>^\n      {
                    printf("OK\n");
                  }
<INITIAL>\#       {
                    counter_hash = 1;
                    BEGIN HASH;
                  }
<HASH>\#          {
                    counter_hash++;
                  }
<HASH>\$          {
                    counter_dollar = 1;
                    BEGIN DOLLAR;
                  }
<DOLLAR>\$        {
                    counter_dollar++;
                  }
<DOLLAR>\%        {
                    counter_percent = 1;
                    BEGIN PERCENT;
                  }
<PERCENT>\%       {
                    counter_percent++;
                  }
<PERCENT>\n       {
                    if(check_counters())
                      printf("OK\n");
                    else
                      printf("Error !!!\n");

                    last_length = 0;
                    BEGIN INITIAL;
                  }
<PERCENT>\#       {
                    if(check_counters()) {
                      last_length = counter_percent;
                      counter_hash = 1;
                      BEGIN HASH;
                    } else {
                      BEGIN ERROR;
                    }
                  }
<PERCENT>.        {
                    BEGIN ERROR;
                  }
.                 {
                    BEGIN ERROR;
                  }
<ERROR>\n         {
                    printf("Error !!!\n");
                    last_length = 0;
                    BEGIN INITIAL;
                  }
<CORRECT>\n       {
                    printf("OK\n");
                    last_length = 0;
                    BEGIN INITIAL;
                  }

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
int check_counters() {
  return (counter_dollar == counter_percent)
      && (counter_percent == counter_hash)
      && (counter_percent >= last_length);
}
