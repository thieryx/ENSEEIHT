(** L’interface correspondant à une règle de réécriture. *)
module type Regle =
sig
  (** tid est le type des identifiants de règles. *)
  type tid = int
  (** td est le type des termes. *)
  type td = char list
(** id: tid -> int
  Renvoie le type des idenfitiants de règles du terme
  Resultat : retourne l'identiant de al règle
   *)
  val id : tid -> int
  (** 
  Appliquer la règle sur un terme. 
  appliquer : char list -> char list list
  Resulat : retourne le nouveu terme généré
  *)
  val appliquer : td -> td list
end

module Regle1: Regle =
struct
  type tid = int
  type td = char list
  let id terme = 1
  let appliquer terme = [List.append terme ['A']];;

  let%test _ = appliquer ['B';'O'] = [['B'; 'O'; 'A']] 
end

module Regle2: Regle =
struct
  type tid = int
  type td = char list
  let id terme = 2
  let appliquer terme = [List.append terme (List.tl terme)]

  let%test _ = appliquer ['B'; 'O';'A'] = [['B'; 'O'; 'A'; 'O'; 'A']]
end

module Regle3: Regle =
struct
  type tid = int
  type td = char list
  let id terme = 3
  let appliquer terme =
    let rec aux t list=
      match t with
      | t1::t2::t3::q -> if (t1='O') && (t2='O') && (t3 ='O') || (t1='A') && (t2='O') && (t3 ='A')
        then [list@'A'::q]
        else aux (t2::t3::q) (list@[t1])
      | _ -> []
      in aux terme []

  let%test _ = List.mem ['B'; 'A'; 'O'] (appliquer ['B'; 'O'; 'O'; 'O'; 'O'])
  let%test _ = List.mem ['B'; 'O'; 'A'] (appliquer ['B'; 'O'; 'O'; 'O'; 'O'])
end

module Regle4: Regle =
struct
  type tid = int
  type td = char list
  let id terme = 4
  let appliquer terme =
    let rec aux t list=
      match t with
      | t1::t2::q -> if (t1='A') && (t2='A')
        then [list@q]
        else aux (t2::q) (list@[t1])
      | _ -> []
    in aux terme []
  let%test _ = appliquer ['B';'O';'A';'A';'O']  = [['B';'O';'O']]
end

module type ArbreReecriture =
sig
  (*
  type tid = int
  type td
  type arbre_reecriture = ...

  val creer_noeud : ...

  val racine : ...
  val fils : ..

  val appartient : td -> arbre_reecriture -> bool
  *)
end