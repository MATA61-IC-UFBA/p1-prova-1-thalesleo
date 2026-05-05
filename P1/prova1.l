%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>


%}


%option noyywrap

%%

"concat"      { return CONCAT; }
"length"      { return LENGTH; }
"print"       { return PRINT; }


[0-9]+(\.[0-9]+)?   { return NUM; }
\"[^\"]*\"          { return STRING; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

[ \t\r]+      ;               // ignora espaços, tabs 

\n            ;

\\[^\n]*       ;
"//".*         ;



"+"           { return ADD; }
"-"           { return SUB; }
"*"           { return MUL; }
"/"           { return DIV; }

"="           { return ASSIGN; }
"("           { return LPAREN; }
")"           { return RPAREN; }
","           { return COMMA; }

.             { return INVALID; }

%%
