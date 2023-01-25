{

  open TokenJava
(*  open String *)
(*  open Str *)
  exception LexicalError

}

(* Macro-definitions *)
let minuscule = ['a'-'z']
let majuscule = ['A'-'Z']
let chiffre = ['0'-'9']
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaireBloc = (* A COMPLETER *) "/*" _* "*/" 
let commentaireLigne = "//" [^'\n']* '\n'

let underscore = '_'
let NonZeroDigit = ['1'-'9']
let IntegerTypeSuffix = 'l'|'L'

let HexDigit = chiffre | [a-f] | [A-F]
let HexDigitOrUnderscore = HexDigit | underscore
let HexDigitsAndUnderscores = HexDigitOrUnderscore | HexDigitOrUnderscore*
let HexDigits = HexDigit | HexDigit HexDigitsAndUnderscores? HexDigit
let HexNumeral = '0' | NonZeroDigit chiffre? | NonZeroDigit underscore chiffre
let HexIntegerLiteral = HexNumeral | IntegerTypeSuffix?
let IntegerTypeSuffix = 'l'|'L'

let OctalDigit = ['1'-'7']
let OctalDigits = OctalDigit | OctalDigit OctalDigitsAndUnderscores? OctalDigit
let OctalNumeral = '0' OctalDigits | '0' underscore OctalDigits
let OctalIntegerLiteral = OctalNumeral IntegerTypeSuffix?


(* Analyseur lexical : expression reguliere { action CaML } *)
rule lexer = parse
(* Espace, tabulation, passage a ligne, etc : consommes par l'analyse lexicale *)
  | ['\n' '\t' ' ']+    { lexer lexbuf }
(* Commentaires consommes par l'analyse lexicale *)
  | commentaireBloc  	{ lexer lexbuf }
  | commentaireLigne	{ lexer lexbuf }
(* Structures de blocs *)
  | "("                 { PAROUV }
  | ")"                 { PARFER }
  | "["                 { CROOUV }
  | "]"                 { CROFER }
  | "{"                 { ACCOUV }
  | "}"                 { ACCFER }
(* Separateurs *)
  | ","                 { VIRG }
  | ";"                 { PTVIRG }
(* Operateurs booleens *)
  | "||"                { OPOU }
  | "&&"                { OPET }
  | "!"                 { OPNON }
(* Operateurs comparaisons *)
  | "=="                { OPEG }
  | "!="                { OPNONEG }
  | "<="                { OPSUPEG }
  | "<"                 { OPSUP }
  | ">="                { OPINFEG }
  | ">"                 { OPINF }
(* Operateurs arithmetiques *)
  | "+"                 { OPPLUS }
  | "-"                 { OPMOINS }
  | "*"                 { OPMULT }
  | "/"                 { OPDIV }
  | "%"                 { OPMOD }
  | "."                 { OPPT }
  | "="                 { ASSIGN }
  | "new"               { NOUVEAU }
(* Mots cles : types *)
  | "bool"              { BOOL }
  | "char"              { CHAR }
  | "float"             { FLOAT }
  | "int"               { INT }
  | "String"            { STRING }
  | "void"              { VOID }
(* Mots cles : instructions *)
  | "while"		{ TANTQUE }
  | "if"		{ SI }
  | "else"		{ SINON }
  | "return"		{ RETOUR }
(* Mots cles : constantes *)
  | "true"		{ (BOOLEEN true) }
  | "false"		{ (BOOLEEN false) }
  | "null"		{ VIDE }
(* Nombres entiers : A COMPLETER *)
  | ('0' | (['1' - '9'] chiffre*)) as texte   { (ENTIER (int_of_string texte)) }
(* Nombres flottants : A COMPLETER *)
  | (chiffre+ "." chiffre+) as texte     { (FLOTTANT (float_of_string texte)) }
(* Caracteres : A COMPLETER *)
  | "'" _[^"'""\"] "'" as texte                   { CARACTERE texte.[1] }
(* Chaines de caracteres : A COMPLETER *)
  | '"' _* '"' as texte                  { CHAINE texte }
(* Identificateurs *)
  | majuscule alphanum* as texte              { TYPEIDENT texte }
  | minuscule alphanum* as texte              { IDENT texte }
  | eof                                       { FIN }
  | _                                         { raise LexicalError }

{

}
