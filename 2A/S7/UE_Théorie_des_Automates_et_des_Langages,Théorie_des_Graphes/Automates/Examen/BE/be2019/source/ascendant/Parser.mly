%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_PAROUV UL_PARFER
%token UL_PT UL_VIRG
%token UL_FAIL
%token UL_COUP
%token UL_NEG
%token UL_DED
/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_SYMBOLE
%token <string> UL_VARIABLE

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> programme

/* Le non terminal document est l'axiome */
%start programme

%% /* Regles de productions */

programme : regle suite_regle UL_FIN { (print_endline "programme : regle suite_regle FIN ") }

regle : axiome | deduction { (print_endline "regle : A COMPLETER") }

suite_regle : /*Vide*/{(print_endline "programme vide")}  
  |programme { (print_endline "suite_regle : A COMPLETER") } 

axiome: predicat UL_PT  { (print_endline "axiome : A COMPLETER") } 

deduction: predicat UL_DED deduction_bis UL_PT { (print_endline "deduction : A COMPLETER") }

deduction_bis:  deduction_ter deduction_ter_suite { (print_endline "deduction_bis : A COMPLETER") }

deduction_ter: predicat| UL_NEG predicat | UL_FAIL |UL_COUP { (print_endline "deduction_ter : A COMPLETER") }

deduction_ter_suite: /*Vide*/{(print_endline "programme vide")}  
|UL_VIRG deduction_bis { (print_endline "deduction_ter_suite : A COMPLETER") }


predicat: UL_SYMBOLE predicat_terme { (print_endline "predicat : A COMPLETER") }

predicat_terme: UL_PAROUV predicat_bis UL_PARFER { (print_endline "predicat_terme : A COMPLETER") }

predicat_bis: UL_VARIABLE predicat_ter | terme predicat_ter { (print_endline "predicat_bis : A COMPLETER") }


predicat_ter:   /*Vide*/{(print_endline "programme vide")}  
|UL_VIRG predicat_bis{ (print_endline "predicat_ter_suite : A COMPLETER") }

terme: UL_SYMBOLE | UL_SYMBOLE predicat_terme { (print_endline "terme : A COMPLETER") }
%%
