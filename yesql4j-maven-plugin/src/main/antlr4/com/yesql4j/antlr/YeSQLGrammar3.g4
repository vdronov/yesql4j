grammar YeSQLGrammar3;
dao : version query*;

version: WS? COMMENT_MARKER WS? VERSION_TAG WS NUMBER NEW_LINE;

query: query_meta query_text ';';

query_text: query_line+;

query_line: (WS|NON_WS)+ NEW_LINE;

query_meta: query_name (result_interface|params_interface)? (result_interface|params_interface)? query_param* ;

query_name: WS? COMMENT_MARKER WS? NAME_TAG WS? VAR_NAME NEW_LINE;

query_param: WS? COMMENT_MARKER WS? PARAM_TAG WS CLASS_NAME WS VAR_NAME NEW_LINE;

params_interface: WS? COMMENT_MARKER WS? PARAM WS IMPLEMENTS WS CLASS_NAME NEW_LINE;

result_interface: WS? COMMENT_MARKER WS? RESULT WS IMPLEMENTS WS CLASS_NAME NEW_LINE;


NUMBER: DIGIT+;
COMMENT_MARKER: '--';
VERSION_TAG: V E R S I O N;
NAME_TAG: N A M E ':';

NEW_LINE: ( '\r\n' | '\n')+;


VAR_NAME: ('a'..'z' | '-'| 'A'..'Z')+;
CLASS_NAME: ('a'..'z' | 'A'..'Z' | '.'|'<'|'>')+;
DIGIT: ('0'..'9');
AS: A S;


PARAM: P A R A M ;
PARAM_TAG: '@' P A R A M ;
IMPLEMENTS: I M P L E M E N T S;
RESULT: R E S U L T  ;

WS: ( ' ' | '\t')+;
NON_WS: ~('\n'|' '|'\t');

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



