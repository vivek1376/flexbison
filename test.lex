

%{

#define IF 100
#define WHILE 101
#define EQ 102

void consume_comment();


%}


DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*

%%


while   {printf("RW: %s\n", yytext);}
program {printf("RW: %s\n", yytext);}
is  {printf("RW: %s\n", yytext);}
begin   {printf("RW: %s\n", yytext);}
end {printf("RW: %s\n", yytext);}
global  {printf("RW: %s\n", yytext);}
procedure   {printf("RW: %s\n", yytext);}
variable    {printf("RW: %s\n", yytext);}
integer {printf("RW: %s\n", yytext);}
float   {printf("RW: %s\n", yytext);}
string  {printf("RW: %s\n", yytext);}
bool    {printf("RW: %s\n", yytext);}
if  {printf("RW: %s\n", yytext);}
then    {printf("RW: %s\n", yytext);}
else    {printf("RW: %s\n", yytext);}
for {printf("RW: %s\n", yytext);}
return  {printf("RW: %s\n", yytext);}
not {printf("RW: %s\n", yytext);}
true    {printf("RW: %s\n", yytext);}
false   {printf("RW: %s\n", yytext);}

: {printf("COLON\n");}
; {printf("SEMICOLON\n");}
"(" {printf("L_PAREN\n");}
")"  {printf("R_PAREN\n");}
"," {printf("COMMA\n");}
"[" {printf("L_BKT\n");}
"]" {printf("R_BKT\n");}
"_" {printf("UNDERSCORE\n");}
"::=" {printf("ASSIGN\n");}
"&" {printf("AND\n");}
"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"<" {printf("LESS_THAN\n");}
"|" {printf("OR\n");}
">="    {printf("GREATER_EQ\n");}
"<="    {printf("LESS_EQ\n");}
">" {printf("GREATER_THAN\n");}
"=="    {printf("EQUALS\n");}
"!="    {printf("NOT_EQUAL\n");}
"*" {printf("MUL_OP\n");}
"/" {printf("DIVIDE_OP\n");}
"." {printf("DOT\n");}


"/*"  { consume_comment(); }

.   ;

%%








void consume_comment() {
    int c;

    /* EOF in lex is 0, which is different from
       the EOF macro in the C standard library */
    while ((c = input()) != 0) {
        /* printf("h1\n"); */
        /* putchar(c); */
        
        if (c == '*') {
            while ((c = input()) == '*') {
                /* putchar(c); */
                /* printf("h2\n"); */
            }

            if (c == 0) break;

            /* putchar(c); */

            if (c == '/') return;
        }
    }
}


int main() {

    yylex();
}
