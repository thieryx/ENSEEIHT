{

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open Parser 
  exception LexicalError

}

(* Déclaration d'expressions régulières exploitées par la suite *)
let chiffre = ['0' - '9']
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaire =
  (* Commentaire fin de ligne *)
  "#" [^'\n']*

rule lexer = parse
  | ['\n' '\t' ' ']+					{ (lexer lexbuf) }
  | commentaire						{ (lexer lexbuf) }
  | "("							{ UL_PAROUV }
  | ")"							{ UL_PARFER }
  | eof							{ UL_FIN }
  | "fail"          { UL_FAIL}
  | "!"       {UL_COUP}
  | "-"      {UL_NEG}
  | "."         {UL_PT}
  | ","       {UL_VIRG}
  | ":-"     {UL_DED}
  | minuscule(minuscule|majuscule)*as texte {UL_SYMBOLE texte}
  | majuscule(minuscule|majuscule)*as texte {UL_VARIABLE texte}
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); raise LexicalError }

{
  (*
(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (print_endline (("accept : ") ^ (string_of_token token))); (Success (advanceInStream stream))
    | _ -> Failure
;;


(* Définition de la monade  qui est composée de : *)
(* - le type de donnée monadique : parseResult  *)
(* - la fonction : inject qui construit ce type à partir d'une liste de terminaux *)
(* - la fonction : bind (opérateur >>=) qui combine les fonctions d'analyse. *)

(* inject inputStream -> parseResult *)
(* Construit le type de la monade à partir d'une liste de terminaux *)
let inject s = Success s;;

(* bind : 'a m -> ('a -> 'b m) -> 'b m *)
(* bind (opérateur >>=) qui combine les fonctions d'analyse. *)
(* ici on utilise une version spécialisée de bind :
   'b  ->  inputStream
   'a  ->  inputStream
    m  ->  parseResult
*)
(* >>= : parseResult -> (inputStream -> parseResult) -> parseResult *)
let (>>=) result f =
  match result with
    | Success next -> f next
    | Failure -> Failure
;;

let rec parsePR stream =
  (print_string "PR -> ");
  (match (peekAtFirstToken stream) with
    | UL_SYMBOLE ->
      (print_endline "R SR");
      inject stream >>=
      parseR >>=
      parseSR

and parseSR stream = 
  (print_string "SR -> ");
  (match (peekAtFirstToken stream) with
    |UL_DOLLAR ->
      (print_endline "LAMBDA");
      inject stream >>=
      accept
    | UL_SYMBOLE ->
      (print_endline "R SR");
      inject stream >>=
      parseR >>=
      parseSR

and parseR stream =
  (print_string "R -> ");
  (match (peekAtFirstToken stream) with
    | UL_SYMBOLE ->
      (print_endline "P SP");
      inject stream >>=
      parseP >>=
      parseSP

and parseSP stream = 
  (print_string "SR -> ");
  (match (peekAtFirstToken stream) with
    |UL_PT ->
      (print_endline "LAMBDA");
      inject stream >>=
      accept
    | UL_DED ->
      (print_endline "R SR");
      inject stream >>=
      accept UL_DED >>=
      parseE >>=
      parseSE

and parseE stream =
  (print_string "E -> ");
  (match (peekAtFirstToken stream) with
    | UL_FAIL ->
      (print_endline "fail");
      inject stream >>=
      accept UL_FAIL
    | UL_COUP ->
      (print_endline "!");
      inject stream >>=
      accept UL_COUP
    | UL_NEG ->
      (print_endline "-");
      inject stream >>=
      accept UL_NEG >>=
      parseP
    | UL_SYMBOLE ->
      (print_endline "P");
      inject stream >>=
      parseP

and parseSE stream =
  (print_string "SE -> ");
  (match (peekAtFirstToken stream) with
    | UL_PT ->
      (print_endline "LAMBDA");
      inject stream >>=
      accept
    | UL_VIRG ->
      (print_endline ", E SE");
      inject stream >>=
      accept UL_VIRG >>=
      parseE >>=
      parseSE

and parseP stream =
  (print_string "P -> ");
  (match (peekAtFirstToken stream) with
    | UL_SYMBOLE ->
      (print_endline "symbole ( T ST )");
      inject stream >>=
      accept UL_SYMBOLE >>=
      accept UL_PAROUV >>=
      parseT >>=
      parseST >>=
      accept UL_PARFER

and parseT stream =
  (print_string "T -> ");
  (match (peekAtFirstToken stream) with
    | UL_VARIABLE ->
      (print_endline "variable");
      inject stream >>=
      accept UL_VARIABLE
    | UL_SYMBOLE ->
      (print_endline "symbole O");
      inject stream >>=
      accept UL_SYMBOLE >>=
      parseO

and parseST stream =
  (print_string "ST -> ");
  (match (peekAtFirstToken stream) with
    | UL_PARFER ->
      (print_endline "LAMBDA");
      inject stream >>=
      accept
    | UM_VIRG ->
      (print_endline ", T ST");
      inject stream >>=
      accept UL_VIRG >>=
      parseT >>=
      parseST

and parseO stream = 
  (print_string "T -> ");
  (match (peekAtFirstToken stream) with
    | UL_VIRG|UL_PT ->
      (print_endline "LAMBDA");
      inject stream >>=
      accept
    | UL_PAROUV ->
      (print_endline "( T ST )");
      inject stream >>=
      accept UL_PAROUV >>=
      parseT >>=
      parseST >>=
      acept UL_PARFER
  
  *)
}
