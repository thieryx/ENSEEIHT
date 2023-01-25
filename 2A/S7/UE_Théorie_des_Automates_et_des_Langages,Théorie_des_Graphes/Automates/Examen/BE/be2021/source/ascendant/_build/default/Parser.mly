%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_MODEL
%token UL_ACCOUV UL_ACCFER
%token UL_SYSTEM
%token UL_BLOCK
%token UL_FLOW
%token UL_FROM
%token UL_TO
%token UL_IN
%token UL_OUT
%token UL_INT
%token UL_FLOAT
%token UL_BOOLEAN
%token UL_PAROUV
%token UL_PARFER
%token UL_CROOUV
%token UL_CROFER
%token UL_PTVIRG
%token UL_VIRG
%token UL_DEUXPT
%token UL_POINT

/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_UPIDENT
%token <string> UL_IDENT
%token <int> UL_ENTIER
/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> modele

/* Le non terminal document est l'axiome */
%start modele

%% /* Regles de productions */

modele : UL_MODEL UL_UPIDENT UL_ACCOUV aux UL_ACCFER UL_FIN { (print_endline "modele : UL_MODEL UL_UPIDENT inter UL_FIN ") }

aux: /*Vide*/{(print_endline "aux vide")}  
    | aux2 aux {(print_endline "aux: aux2 aux")}  

aux2: bloc | systeme | flot {(print_endline "aux2: Bloc | Systeme | FLot")}

bloc: UL_BLOCK UL_UPIDENT parametres UL_PTVIRG {(print_endline "bloc: UL_BLOCK UL_Ident parametres UL_PTVIRG")}

systeme: UL_SYSTEM UL_UPIDENT parametres UL_ACCOUV aux UL_ACCFER {(print_endline "systeme: UL_SYSTEM UL_Ident parametres UL_ACCOUV aux UL_ACCFER")}

parametres: UL_PAROUV aux3 UL_PARFER {(print_endline "parametres: UL_PAROUV aux3 UL_PARFER")}

aux3: port | port UL_VIRG aux3 {(print_endline "aux3: Port | Port UL_PTVIRG aux3")}

port: UL_IDENT UL_DEUXPT aux4 types {(print_endline "port: UL_ident UL_DEUXPT aux4 type")}

aux4: UL_IN | UL_OUT {(print_endline "aux4: UL_IN | UL_OUT")}

types: int_float_bool | int_float_bool UL_CROOUV aux5 UL_CROFER {(print_endline "type: int_float_bool | int_float_bool UL_ACCOUV aux5 UL_ACCFER")}

int_float_bool: UL_INT | UL_FLOAT | UL_BOOLEAN {(print_endline "int_float_bool: UL_INT | UL_FLOAT | UL_BOOLEAN")}

aux5: UL_ENTIER | UL_ENTIER UL_VIRG aux5 {(print_endline "aux5: UL_entier | UL_entier UL_VIRG aux5")}

flot : UL_FLOW UL_IDENT UL_FROM sub_sub_flot UL_IDENT UL_TO sub_flot UL_PTVIRG { (print_endline "flot : UL_FLOW UL_IDENT UL_FROM UL_IDENT UL_TO UL_IDENT UL_PTVIRG") }

sub_sub_flot : /*empty*/ { (print_endline "sous_modeles : /* empty */ ") }
| UL_UPIDENT UL_POINT { (print_endline "sub_sub_flot : /*empty*/ | UL_IDENT UL_POINT") }

sub_flot : /* empty */ { (print_endline "sous_modeles : /* empty */ ") }
| flot_aux { (print_endline "sub_flot : flot_aux") }

flot_aux :   sub_flot2 | sub_flot2 UL_VIRG sub_flot { (print_endline "sub_flot : sub_flot2 | sub_flot2 UL_VIRG sub_flot") }

sub_flot2 : sub_flot3 UL_IDENT { (print_endline "sub_flot2 : UL_IDENT UL_POINT UL_IDENT UL_DEUXPT UL_IDENT UL_POINT UL_IDENT") }

sub_flot3 : /*empty*/ { (print_endline "sous_modeles : /* empty */ ") }
| UL_UPIDENT UL_POINT { (print_endline "sub_flot3 : /*empty*/ | UL_IDENT UL_POINT") }
%%
