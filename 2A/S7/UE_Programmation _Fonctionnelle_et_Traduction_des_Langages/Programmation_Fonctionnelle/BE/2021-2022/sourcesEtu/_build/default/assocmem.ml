open Util
open Mem

(* get_assoc: Fonction qui renvoie la valeur associée à la clef e dans la liste l, ou la valeur fournie def si la clef n’existe pas.
   Paramètre: e, la clef 
   Paramètre: l, la liste
   Paramètre: def, valeur par défaut
   Retour: la valeur associéed à la clef
 *)
let rec get_assoc e l def = 
    match l with
    |[] -> def
    |(cle,v)::q -> if cle=e then v
                    else get_assoc e q def

(* Tests unitaires : TODO *)
let%test _ = get_assoc 1 [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')] _0 = 'a'
let%test _ = get_assoc 5 [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')] _0 = 'e'
let%test _ = get_assoc 7 [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')] _0 = _0

(* set_assoc: Fonction qui remplace la valeur associée à la clef e dans la liste l par x, ou ajoute le couple (e; x) si la clef n’existe pas déjà.
   Paramètre: e, la clef 
   Paramètre: l, la liste
   Paramètre: x, valeur à ajouter
   Retour: la liste avec la valeur x ajoutée
 *)
let rec set_assoc e l x =
    match l with
    |[] -> l@[(e,x)]
    |(cle,v)::q ->
        if cle=e then [(cle,x)]@q
        else [(cle,v)]@(set_assoc e q x)


(* Tests unitaires : TODO *)
let%test _ = set_assoc 1 [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')] 'z'= [(1,'z');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')]
let%test _ = set_assoc 4 [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')] 'z'= [(1,'a');(2,'b');(3,'c');(4,'z');(5,'e');(6,'f')]
let%test _ = set_assoc 7 [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f')] 'z'= [(1,'a');(2,'b');(3,'c');(4,'d');(5,'e');(6,'f');(7,'z')]


module AssocMemory : Memory =
struct
    (* Type = liste qui associe des adresses (entiers) à des valeurs (caractères) *)
    type mem_type = (int*char) list

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    (* Nom de l'implémentation *)
    let name = "assoc"

    (* Taille du bus d'adressage *)
    let bussize (bs, _) = bs

    (* Taille maximale de la mémoire *)
    let size (bs, _) = pow2 bs

    (* Taille de la mémoire en mémoire *)
    let allocsize (bs, m) = (List.length(m))

    (* Nombre de cases utilisées *)
    (*let busyness (bs, m) = List.fold_right (fun (x,y) acc -> if (x <>0) then 1+acc
                                                            else 0 ) m 0
    *)
    (*let busyness (bs, m) = List.fold_left (fun acc (x,y) -> if y = _0 then acc else acc + 1) 0 m *)

    let busyness (bs, m) = List.fold_left (fun acc (x,y) -> if y = _0 then acc else acc+ 1) 0 m

    (* Construire une mémoire vide *)

    let clear bs = (bs, [])

    (* Lire une valeur *)
    let read (bs, m) addr = get_assoc addr m _0

    (* Écrire une valeur *)
    let write (bs, m) addr x = (bs,set_assoc addr m x)
end
