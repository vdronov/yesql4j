grammar YeSQLGrammar2;
dao : version queries;

version: (COMMENT_MARKER WS VERSION_TAG WS NON_WS)  | (COMMENT_START   WS VERSION_TAG WS NON_WS COMMENT_END);

queries: query* EOF;
query: docstring? name param* result* paramAggregatorType? resultAggregatorType?  statement;


statement: line (line | comment)*;
docstring: comment+;

name: WS? COMMENT_MARKER WS? NAME_TAG WS? NON_WS WS? NEWLINE;
param: WS? COMMENT_MARKER WS* PARAM_TAG (NON_WS|WS)+ NEWLINE;
result: WS? COMMENT_MARKER WS*   RESULT_TAG (NON_WS|WS)+ NEWLINE;
comment: WS? COMMENT_MARKER WS? ~(NAME_TAG|PARAM_TAG) (NON_WS|WS)+ NEWLINE;
line: WS? ~COMMENT_MARKER (NON_WS|WS)* (COMMENT_MARKER (NON_WS|WS)*)? NEWLINE;
paramAggregatorType: WS? PARAM WS+ IMPLEMENTS WS+ NON_WS+ (WS* ',' WS* NON_WS)* NEWLINE ;
resultAggregatorType: WS? RESULT WS+ IMPLEMENTS WS+ NON_WS+ (WS* ',' WS* NON_WS)* NEWLINE ;

VERSION_TAG: V E R S I O N;
NAME_TAG: N A M E ':';
PARAM_TAG: '@' PARAM;
RESULT_TAG: '@' RESULT;

NEWLINE: ('\n' | '\r\n')+;
WS: (' ' | '\t')+;
NON_WS: ~(' ' | '\t' | '\n')+;

COMMENT_START: '/*';
COMMENT_END: '*/';
COMMENT_MARKER: '--';

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