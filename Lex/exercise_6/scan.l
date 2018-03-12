%{
  #include <stdio.h>
  int yywrap(void);
  int yylex(void);

  struct Item {
    int value;
    struct Item* pointer;
  };
  struct Item* root = NULL;
  int value;

  void push(int x);
  int pop();
%}
%%

[0-9]+  { sscanf(yytext, "%d", &value); push(value);  }
\+      { push(pop() + pop());                        }
\*      { push(pop() * pop());                        }
\n      { printf("%d \n", pop());                     }
.       ;

%%
int yywrap(void) { return 1; }
int main() { return yylex(); }
void push(int x) {
  struct Item *item = malloc(sizeof (struct Item));
  item->value = x;
  item->pointer = root;
  root = item;
}
int pop() {
  struct Item *temp = root;
  root = temp->pointer;
  return temp->value;
}
