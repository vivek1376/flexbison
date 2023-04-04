

%{

#define IF 100
#define WHILE 101
#define EQ 102

void consume_comment();


%}


DIGIT    [0-9]
ID       [a-zA-Z][a-zA-Z0-9]*

%%


while   {printf("%s\tRW_WHILE\n", yytext);}
program {printf("%s\tRW_PROGRAM\n", yytext);}
is  {printf("%s\tRW_IS\n", yytext);}
begin   {printf("%s\tRW_BEGIN\n", yytext);}
end {printf("%s\tRW_END\n", yytext);}
global  {printf("%s\tRW_GLOBAL\n", yytext);}
procedure   {printf("%s\tRW_PROCEDURE\n", yytext);}
variable    {printf("%s\tRW_VARIABLE\n", yytext);}
integer {printf("%s\tRW_INTEGER\n", yytext);}
float   {printf("%s\tRW_FLOAT\n", yytext);}
string  {printf("%s\tRW_STRING\n", yytext);}
bool    {printf("%s\tRW_BOOL\n", yytext);}
if  {printf("%s\tRW_IF\n", yytext);}
then    {printf("%s\tRW_THEN\n", yytext);}
else    {printf("%s\tRW_ELSE\n", yytext);}
for {printf("%s\tRW_FOR\n", yytext);}
return  {printf("%s\tRW_RETURN\n", yytext);}
not {printf("%s\tRW_NOT\n", yytext);}
true    {printf("%s\tRW_TRUE\n", yytext);}
false   {printf("%s\tRW_FALSE\n", yytext);}

: {printf("%s\tCOLON\n", yytext);}
; {printf("%s\tSEMICOLON\n", yytext);}
"(" {printf("%s\tL_PAREN\n", yytext);}
")"  {printf("%s\tR_PAREN\n", yytext);}
"," {printf("%s\tCOMMA\n", yytext);}
"[" {printf("%s\tL_BKT\n", yytext);}
"]" {printf("%s\tR_BKT\n", yytext);}
"_" {printf("%s\tUNDERSCORE\n", yytext);}
":=" {printf("%s\tASSIGN\n", yytext);}
"&" {printf("%s\tAND\n", yytext);}
"+" {printf("%s\tPLUS\n", yytext);}
"-" {printf("%s\tMINUS\n", yytext);}
"<" {printf("%s\tLESS_THAN\n",yytext);}
"|" {printf("%s\tOR\n", yytext);}
">="    {printf("%s\tGREATER_EQ\n",yytext);}
"<="    {printf("%s\tLESS_EQ\n", yytext);}
">" {printf("%s\tGREATER_THAN\n", yytext);}
"=="    {printf("%s\tEQUALS\n", yytext);}
"!="    {printf("%s\tNOT_EQUAL\n",yytext);}
"*" {printf("%s\tMUL_OP\n", yytext);}
"/" {printf("%s\tDIVIDE_OP\n", yytext);}
"." {printf("%s\tDOT\n", yytext);}

\"[A-Za-z_]*\"	{printf("%s\tSTRING\n", yytext);}

[a-zA-Z][a-zA-Z0-9_]*   {printf("%s\tIDENTIFIER\n", yytext);}

"//".*	{}
"/*"  { consume_comment(); }

[0-9]+	{printf("%s\tINTEGER\n", yytext);}
[0-9]+"."[0-9]+	{printf("%s\tFLOAT\n", yytext);}

[ \t\n]	;

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
