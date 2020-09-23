grammar YeSQLGrammar2;
dao : version queries;

version: COMMENT_MARKER WS? VERSION_TAG WS NUMBER NEWLINE;
NUMBER: DIGIT+;
queries: query* EOF;
query: docstring? name param* (paramAggregatorType|resultAggregatorType)? (paramAggregatorType|resultAggregatorType)?  statement;


//statement: line (line | comment| resultTypeHolderLine)*;
statement: line (line | comment)*;
docstring: comment+;

name: WS? COMMENT_MARKER WS? NAME_TAG WS? NON_WS WS? NEWLINE;
param: WS? COMMENT_MARKER WS* PARAM_TAG (NON_WS|WS)+ NEWLINE;
comment: WS? COMMENT_MARKER WS? ~(NAME_TAG|PARAM_TAG) (NON_WS|WS)+ NEWLINE;
line: WS? ~COMMENT_MARKER (NON_WS|WS)* (COMMENT_MARKER (NON_WS|WS)*)? NEWLINE;
paramAggregatorType: WS? PARAM WS IMPLEMENTS WS NON_WS (WS ',' WS NON_WS)* NEWLINE ;
resultAggregatorType: WS? RESULT WS IMPLEMENTS WS NON_WS (WS ',' WS NON_WS)* NEWLINE ;
//resultTypeHolderLine: WS? resultColumn (WS AS WS alias)? WS? (COMMENT_MARKER WS? TYPE_TAG WS type WS? COMMENT_END? NEWLINE;

alias: WORD;

type: WORD('.'WORD)*;
resultColumn: WORD ('.'WORD)?;

COMMENT_MARKER: '--';
VERSION_TAG: V E R S I O N;
NAME_TAG: N A M E ':';
PARAM_TAG: '@' PARAM;
TYPE_TAG: '@' T Y P E;


WS : [ \t\r]+ -> skip ; // skip spaces, tabs, newlines
//WS: (' ' | '\t')+;
NEWLINE: WS? ('\n' | '\r\n')+;
NON_WS: ~(' ' | '\t' | '\n')+;

WORD:  ( 'a'..'z' | 'A'..'Z' )+;
DIGIT: ('0'..'9');
AS: A S;

//SELECT: S E L E C T;

PARAM: P A R A M ;
IMPLEMENTS: I M P L E M E N T S;
RESULT: R E S U L T  ;

fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');


