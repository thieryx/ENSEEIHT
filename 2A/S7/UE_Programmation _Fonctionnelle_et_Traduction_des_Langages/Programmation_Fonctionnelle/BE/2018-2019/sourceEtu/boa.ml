(** L’interface correspondant à une règle de réécriture. *)
module type Regle =
sig
  (** tid est le type des identifiants de règles. *)
  type tid = int
  (** td est le type des termes. *)
  type td
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

  type tid = int
  type td
  type arbre_reecriture = |Noeud of td*((tid*arbre_reecriture) list)
                          |Feuille of td

  val creer_noeud : td -> ((tid*arbre_reecriture) list) -> arbre_reecriture

  val racine : arbre_reecriture -> td
  val fils : arbre_reecriture -> ((tid*arbre_reecriture) list)

  val appartient : td -> arbre_reecriture -> bool

end

module ArbreReecritureBOA: ArbreReecriture =
struct
  type tid = int 
  type td = char list
  type arbre_reecriture = |Noeud of td * ((tid * arbre_reecriture) list)
                          |Feuille of td
  let creer_noeud terme fils= Noeud(terme,fils)
  let racine (Noeud(terme,_)) = terme
  let fils (Noeud(terme,fils)) = fils
  let rec appartient terme (Noeud(td,l)) = if (terme=td) then true
    else 

  let exemple1 = Noeud(['B';'O';'O'], [(1, Noeud(['B';'O';'O';'A'], [(1, Noeud(['B'], [])); (2, Noeud(['O'], []))])); (2, Noeud(['B';'O';'O';'O';'O'], []))])
  
  let%test _ = appartient ['O'] exemple1 = true

  let%test _ = appartient ['O'] exemple1 = true 
  let%test _ = appartient ['B'] exemple1 = true 
  let%test _ = appartient ['B';'O';'O'] exemple1 = true 
  let%test _ = appartient ['B';'O';'O';'A'] exemple1 = true 
  let%test _ = appartient ['B';'O';'O';'O';'O'] exemple1 = true 

  let%test _ = fils exemple1 = [(1, Noeud(['B';'O';'O';'A'], [(1, Noeud(['B'], [])); (2, Noeud(['O'], []))])); (2, Noeud(['B';'O';'O';'O';'O'], []))]
  let%test _ = racine exemple1 = ['B';'O';'O']
end