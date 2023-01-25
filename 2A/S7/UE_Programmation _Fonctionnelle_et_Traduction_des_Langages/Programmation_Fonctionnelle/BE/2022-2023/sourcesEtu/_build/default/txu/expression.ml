(* Exercice 3 *)
module type Expression = sig
  (* Type pour représenter les expressions *)
  type exp


  (* eval : exp -> in
     Evalue la valeur d'une expression
     Paramètre: expression à évaluer
     Retour: La valeur de l'expression*)

  val eval : exp -> int
end

(* Exercice 4 *)

(* TO DO avec l'aide du fichier  expressionArbreBinaire.txt *)
module ExpAvecArbreBinaire: Expression =
struct
  (* Type pour représenter les expressions binaires *)
  type op = Moins | Plus | Mult | Div
  type exp = Binaire of exp * op * exp | Entier of int
  
  (* eval *)
  let eval arbre = 
    let rec aux arb = 
      match arb with
      |Entier(a) -> a
      |Binaire(exp1,op,exp2) ->
        match op with
        |Moins -> (aux exp1) - (aux exp2)
        |Plus -> (aux exp1) + (aux exp2)
        |Mult -> (aux exp1) * (aux exp2)
        |Div -> (aux exp1) / (aux exp2)
    in aux arbre


  (* Tests : TO DO *)
  let arb0 = Entier 3
  let arb1 = Binaire(Entier 4,Div,Entier 2)
  let arb2 = Binaire(Binaire(Entier 3,Plus,Entier 4),Moins,Entier 12)
  let arb3 = Binaire(Binaire(Entier 3,Plus,Entier 4),Moins,Binaire(Entier 3,Mult,Entier 0))

  let%test _ = eval arb0 = 3
  let%test _ = eval arb1 = 2

  let%test _ = eval arb2 = -5
  let%test _ = eval arb3 = 7

  end
  (* Exercice 5 *)

  (* TO DO avec l'aide du fichier  expressionArbreNaire.txt *)
  module ExpAvecArbreNaire: Expression =
  struct

  (* Linéarisation des opérateurs binaire associatif gauche et droit *)
  type op = Moins | Plus | Mult | Div
  type exp = Naire of op * exp list | Valeur of int

    
  (* bienformee : exp -> bool *)
  (* Vérifie qu'un arbre n-aire représente bien une expression n-aire *)
  (* c'est-à-dire que les opérateurs d'addition et multiplication ont au moins deux opérandes *)
  (* et que les opérateurs de division et soustraction ont exactement deux opérandes.*)
  (* Paramètre : l'arbre n-aire dont ont veut vérifier si il correspond à une expression *)
  let bienformee arbre =
    let rec aux arb = match arb with
    |Valeur _ -> true
    |Naire(op,l) ->
      if (op=Plus) || (op=Mult) then ((List.length l)>=2) && (aux (List.hd l))
      else ((List.length l)=2) && (aux (List.hd l))
    in aux arbre

  let en1 = Naire (Plus, [ Valeur 3; Valeur 4; Valeur 12 ])
  let en2 = Naire (Moins, [ en1; Valeur 5 ])
  let en3 = Naire (Mult, [ en1; en2; en1 ])
  let en4 = Naire (Div, [ en3; Valeur 2 ])
  let en1err = Naire (Plus, [ Valeur 3 ])
  let en2err = Naire (Moins, [ en1; Valeur 5; Valeur 4 ])
  let en3err = Naire (Mult, [ en1 ])
  let en4err = Naire (Div, [ en3; Valeur 2; Valeur 3 ])

  let%test _ = bienformee en1
  let%test _ = bienformee en2
  let%test _ = bienformee en3
  let%test _ = bienformee en4
  let%test _ = not (bienformee en1err)
  let%test _ = not (bienformee en2err)
  let%test _ = not (bienformee en3err)
  let%test _ = not (bienformee en4err)

  (* eval : exp-> int *)
  (* Calcule la valeur d'une expression n-aire *)
  (* Paramètre : l'expression dont on veut calculer la valeur *)
  (* Précondition : l'expression est bien formée *)
  (* Résultat : la valeur de l'expression *)
  let  eval_bienformee arbre =
    let rec aux arb = 
      match arb with
        |Valeur (a) -> a
        |Naire(op,[t1;t2]) -> if (op=Moins) then (aux t1) - (aux t2)
                              else (aux t1) / (aux t2)
        |Naire(op,l) -> if (op=Plus) then List.fold_left (fun acc t -> (aux t)+acc) 0 l
                              else List.fold_left (fun acc t -> (aux t)*acc) 1 l
    in aux arbre

  let%test _ = eval_bienformee en1 = 19
  let%test _ = eval_bienformee en2 = 14
  let%test _ = eval_bienformee en3 = 5054
  let%test _ = eval_bienformee en4 = 2527

  (* Définition de l'exception Malformee *)
  (* TO DO *)
  exception Malformee

  (* eval : exp-> int *)
  (* Calcule la valeur d'une expression n-aire *)
  (* Paramètre : l'expression dont on veut calculer la valeur *)
  (* Résultat : la valeur de l'expression *)
  (* Exception  Malformee si le paramètre est mal formé *)
  let eval arbre = if (bienformee arbre) then eval_bienformee arbre
  else raise Malformee

  let%test _ = eval en1 = 19
  let%test _ = eval en2 = 14
  let%test _ = eval en3 = 5054
  let%test _ = eval en4 = 2527

  let%test _ =
    try
      let _ = eval en1err in
      false
    with Malformee -> true

  let%test _ =
    try
      let _ = eval en2err in
      false
    with Malformee -> true

  let%test _ =
    try
      let _ = eval en3err in
      false
    with Malformee -> true

  let%test _ =
    try
      let _ = eval en4err in
      false
    with Malformee -> true



end