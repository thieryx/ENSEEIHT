(*  Module qui permet la décomposition et la recomposition de données **)
(*  Passage du type t1 vers une liste d'éléments de type t2 (décompose) **)
(*  et inversement (recopose).**)
module type DecomposeRecompose =
sig
  (*  Type de la donnée **)
  type mot 
  (*  Type des symboles de l'alphabet de t1 **)
  type symbole

  val decompose : mot -> symbole list
  val recompose : symbole list -> mot
end

module DRString: DecomposeRecompose with type mot = string and type symbole = char =
struct
  type mot = string
  type symbole = char
  let decompose s =
    let rec decompose i accu =
      if i < 0 then accu
      else decompose (i-1) (s.[i]::accu)
    in decompose (String.length s - 1) []
  
    let%test _ = decompose "abc" = ['a'; 'b'; 'c']

  let rec recompose lc =
    List.fold_right (fun t q -> String.make 1 t ^ q) lc ""

  let%test _ = recompose ['a'; 'b'; 'c'] = "abc"
end

module DRNat: DecomposeRecompose with type mot = int and type symbole = int =
struct
  type mot = int
  type symbole = int
(*
  Decompose un nombre en une liste d'entiers
  Signature = int -> int list = <fun>
  Paramètre s: le nombre à décomposer
  Résultat: le nombre passé en paramètre décomposé en une liste d'entiers avec des entiers compris entre 0 et 9 inclus
   *)
  let decompose s =
    let rec aux s l = 
      if (s<10) then [s]@l
      else let r = s/10 in aux (r) [s mod 10]@l
    in aux s []
  
    let%test _ = decompose 523 = [5;2;3]
    let%test _ = decompose 0 = [0]

(*
  Recompose une liste d'entiers en un nombre
  Signature = int list -> int = <fun>
  Paramètre s: la liste d'entiers à recomposer
  Résultat: le nombre recomposé à partir de la liste d'entiers
*)
  let recompose l = List.fold_left(fun acc t -> (acc*10) + t) 0 l

  let%test _ = recompose [0] = 0
  let%test _ = recompose [5] = 5
  let%test _ = recompose [1;8] = 18
  let%test _ = recompose [1;8;6] = 186
  let%test _ = recompose [1;8;6;7] = 1867
  let%test _ = recompose [5;2;3;5;2;5;4;4;2] = 523525442

end
