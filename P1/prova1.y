%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
void yyerror(const char *msg);
%}

%expect 1

%token NUM
%token ID
%token STRING
%token ADD
%token SUB
%token MUL
%token DIV
%token LPAREN
%token RPAREN
%token ASSIGN
%token COMMA
%token INVALID
%token PRINT
%token CONCAT
%token LENGTH


%right ASSIGN
%left ADD SUB
%left MUL DIV
%nonassoc UMINUS

%%

program:
       | program stmt
       ;

stmt:
      ID ASSIGN exp
    | exp
    | PRINT LPAREN arg_list RPAREN
    ;

exp:
      NUM
    | STRING
    | ID
    | exp ADD exp
    | exp SUB exp
    | exp MUL exp
    | exp DIV exp
    | CONCAT LPAREN arg_list RPAREN
    | LENGTH LPAREN exp RPAREN
    | LPAREN exp RPAREN
    | SUB exp %prec UMINUS
    ;

arg_list:
      exp
    | arg_list COMMA exp
    ;

%%
