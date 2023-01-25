
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | TRUE
    | SLASH
    | RETURN
    | RAT
    | PV
    | PRINT
    | PO
    | PLUS
    | PI
    | PF
    | NUM
    | NULL
    | NEW
    | MULT
    | LOOP
    | INT
    | INF
    | IF
    | ID of (
# 11 "parser.mly"
       (string)
# 34 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 42 "parser.ml"
  )
    | ELSE
    | DP
    | DENOM
    | CONTINUE
    | CONST
    | CO
    | CF
    | CALL
    | BREAK
    | BOOL
    | AO
    | AF
    | ADR
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 68 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState002 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 002.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState010 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 010.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState013 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 013.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState016 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_, _menhir_box_main) _menhir_state
    (** State 016.
        Stack shape : typ ID list(param).
        Start symbol: main. *)

  | MenhirState017 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 017.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState018 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 018.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState020 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 020.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState021 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 021.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState026 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 026.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState027 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 027.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState030 : (('s, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 030.
        Stack shape : CALL ID.
        Start symbol: main. *)

  | MenhirState035 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 035.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState039 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 039.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState044 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 044.
        Stack shape : PO NEW.
        Start symbol: main. *)

  | MenhirState047 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT, _menhir_box_main) _menhir_state
    (** State 047.
        Stack shape : PO MULT.
        Start symbol: main. *)

  | MenhirState048 : (((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 048.
        Stack shape : PO MULT PO.
        Start symbol: main. *)

  | MenhirState052 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 052.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState055 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 055.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState057 : (((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 057.
        Stack shape : PO e e.
        Start symbol: main. *)

  | MenhirState061 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 061.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState064 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 064.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState067 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState070 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 070.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState072 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 072.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState075 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 075.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState078 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 078.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState079 : (('s, _menhir_box_main) _menhir_cell1_LOOP, _menhir_box_main) _menhir_state
    (** State 079.
        Stack shape : LOOP.
        Start symbol: main. *)

  | MenhirState081 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState082 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 082.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState084 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 084.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState088 : (('s, _menhir_box_main) _menhir_cell1_ID, _menhir_box_main) _menhir_state
    (** State 088.
        Stack shape : ID.
        Start symbol: main. *)

  | MenhirState105 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 105.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState110 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 110.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState113 : (('s, _menhir_box_main) _menhir_cell1_affect, _menhir_box_main) _menhir_state
    (** State 113.
        Stack shape : affect.
        Start symbol: main. *)

  | MenhirState121 : (('s, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 121.
        Stack shape : list(fonc) ID.
        Start symbol: main. *)

  | MenhirState123 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 123.
        Stack shape : fonc.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_affect = 
  | MenhirCell1_affect of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.affectable)

and ('s, 'r) _menhir_cell1_bloc = 
  | MenhirCell1_bloc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.bloc)

and ('s, 'r) _menhir_cell1_e = 
  | MenhirCell1_e of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.expression)

and ('s, 'r) _menhir_cell1_fonc = 
  | MenhirCell1_fonc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction)

and ('s, 'r) _menhir_cell1_i = 
  | MenhirCell1_i of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.instruction)

and ('s, 'r) _menhir_cell1_list_fonc_ = 
  | MenhirCell1_list_fonc_ of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction list)

and ('s, 'r) _menhir_cell1_list_param_ = 
  | MenhirCell1_list_param_ of 's * ('s, 'r) _menhir_state * ((Type.typ * string) list)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Type.typ * string)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Type.typ)

and ('s, 'r) _menhir_cell1_AO = 
  | MenhirCell1_AO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CO = 
  | MenhirCell1_CO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DENOM = 
  | MenhirCell1_DENOM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 11 "parser.mly"
       (string)
# 300 "parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 307 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LOOP = 
  | MenhirCell1_LOOP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MULT = 
  | MenhirCell1_MULT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NEW = 
  | MenhirCell1_NEW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NUM = 
  | MenhirCell1_NUM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PO = 
  | MenhirCell1_PO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINT = 
  | MenhirCell1_PRINT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.AstSyntax.programme) [@@unboxed]

let _menhir_action_01 =
  fun n ->
    (
# 117 "parser.mly"
                          (Ident n)
# 345 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_02 =
  fun a ->
    (
# 118 "parser.mly"
                          (Deref (a))
# 353 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_03 =
  fun li ->
    (
# 71 "parser.mly"
                        (li)
# 361 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_04 =
  fun lp n ->
    (
# 98 "parser.mly"
                          (AppelFonction (n,lp))
# 369 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_05 =
  fun e1 e2 ->
    (
# 99 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 377 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun () ->
    (
# 100 "parser.mly"
                          (Booleen true)
# 385 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun () ->
    (
# 101 "parser.mly"
                          (Booleen false)
# 393 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun e ->
    (
# 102 "parser.mly"
                          (Entier e)
# 401 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun e1 ->
    (
# 103 "parser.mly"
                          (Unaire(Numerateur,e1))
# 409 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e1 ->
    (
# 104 "parser.mly"
                          (Unaire(Denominateur,e1))
# 417 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 105 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 425 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 106 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 433 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 107 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 441 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun e1 e2 ->
    (
# 108 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 449 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun exp ->
    (
# 109 "parser.mly"
                          (exp)
# 457 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun e1 e2 e3 ->
    (
# 110 "parser.mly"
                             (Ternaire (e1,e2,e3))
# 465 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_17 =
  fun () ->
    (
# 111 "parser.mly"
                          (Null)
# 473 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_18 =
  fun t ->
    (
# 112 "parser.mly"
                          (New t)
# 481 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_19 =
  fun n ->
    (
# 113 "parser.mly"
                          (Adresse n)
# 489 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_20 =
  fun a ->
    (
# 114 "parser.mly"
                          (Affectable (a))
# 497 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_21 =
  fun li lp n t ->
    (
# 67 "parser.mly"
                                          (Fonction(t,n,lp,li))
# 505 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_22 =
  fun e1 n t ->
    (
# 74 "parser.mly"
                                    (Declaration (t,n,e1))
# 513 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_23 =
  fun e n ->
    (
# 75 "parser.mly"
                                    (Constante (n,e))
# 521 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun e1 ->
    (
# 76 "parser.mly"
                                    (Affichage (e1))
# 529 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun exp li1 li2 ->
    (
# 77 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 537 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun exp li1 ->
    (
# 78 "parser.mly"
                                    (Conditionnelle_opt (exp,li1))
# 545 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_27 =
  fun exp li ->
    (
# 79 "parser.mly"
                                    (TantQue (exp,li))
# 553 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_28 =
  fun exp ->
    (
# 80 "parser.mly"
                                    (Retour (exp))
# 561 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_29 =
  fun li ->
    (
# 81 "parser.mly"
                                    (Boucle (li))
# 569 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_30 =
  fun li n ->
    (
# 82 "parser.mly"
                                    (BoucleID (n,li))
# 577 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_31 =
  fun () ->
    (
# 83 "parser.mly"
                                    (Break)
# 585 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_32 =
  fun n ->
    (
# 84 "parser.mly"
                                    (BreakID (n))
# 593 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_33 =
  fun () ->
    (
# 85 "parser.mly"
                                    (Continue)
# 601 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_34 =
  fun n ->
    (
# 86 "parser.mly"
                                    (ContinueID (n))
# 609 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_35 =
  fun a e1 ->
    (
# 87 "parser.mly"
                                    (Affectation (a,e1))
# 617 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_36 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 625 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_37 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 633 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_38 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 641 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_39 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 649 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_40 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 657 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_41 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 665 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_42 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 673 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_43 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 681 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_44 =
  fun lfi ->
    (
# 63 "parser.mly"
                        (lfi)
# 689 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_45 =
  fun n t ->
    (
# 69 "parser.mly"
                    ((t,n))
# 697 "parser.ml"
     : (Type.typ * string))

let _menhir_action_46 =
  fun lf li ->
    (
# 65 "parser.mly"
                            (Programme (lf,li))
# 705 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_47 =
  fun () ->
    (
# 91 "parser.mly"
                    (Bool)
# 713 "parser.ml"
     : (Type.typ))

let _menhir_action_48 =
  fun () ->
    (
# 92 "parser.mly"
                    (Int)
# 721 "parser.ml"
     : (Type.typ))

let _menhir_action_49 =
  fun () ->
    (
# 93 "parser.mly"
                    (Rat)
# 729 "parser.ml"
     : (Type.typ))

let _menhir_action_50 =
  fun t ->
    (
# 94 "parser.mly"
                    (Pointeur (t))
# 737 "parser.ml"
     : (Type.typ))

let _menhir_action_51 =
  fun t ->
    (
# 95 "parser.mly"
                   (t)
# 745 "parser.ml"
     : (Type.typ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ADR ->
        "ADR"
    | AF ->
        "AF"
    | AO ->
        "AO"
    | BOOL ->
        "BOOL"
    | BREAK ->
        "BREAK"
    | CALL ->
        "CALL"
    | CF ->
        "CF"
    | CO ->
        "CO"
    | CONST ->
        "CONST"
    | CONTINUE ->
        "CONTINUE"
    | DENOM ->
        "DENOM"
    | DP ->
        "DP"
    | ELSE ->
        "ELSE"
    | ENTIER _ ->
        "ENTIER"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | FALSE ->
        "FALSE"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | INF ->
        "INF"
    | INT ->
        "INT"
    | LOOP ->
        "LOOP"
    | MULT ->
        "MULT"
    | NEW ->
        "NEW"
    | NULL ->
        "NULL"
    | NUM ->
        "NUM"
    | PF ->
        "PF"
    | PI ->
        "PI"
    | PLUS ->
        "PLUS"
    | PO ->
        "PO"
    | PRINT ->
        "PRINT"
    | PV ->
        "PV"
    | RAT ->
        "RAT"
    | RETURN ->
        "RETURN"
    | SLASH ->
        "SLASH"
    | TRUE ->
        "TRUE"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_122 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_46 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let lfi = _v in
          let _v = _menhir_action_44 lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_008 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_49 () in
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010 _tok
              | PO ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState010
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_48 () in
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_47 () in
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010 _tok
              | PF ->
                  let _v = _menhir_action_42 () in
                  _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let _v = _menhir_action_50 t in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState110 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState010 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_103 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | MULT ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PO ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
              | NUM ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
              | NULL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_17 () in
                  _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ID _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_3 in
                  let _v = _menhir_action_01 n in
                  _menhir_run_037_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ENTIER _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_6 in
                  let _v = _menhir_action_08 e in
                  _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | DENOM ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
              | CO ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
              | CALL ->
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
              | ADR ->
                  _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_22 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | RETURN ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_49 () in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState110 _tok
      | PRINT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | PO ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | LOOP ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_48 () in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState110 _tok
      | IF ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | ID _v_2 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState110
      | CONTINUE ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | CONST ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | BREAK ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState110 _tok
      | AF ->
          let _v = _menhir_action_40 () in
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | RETURN ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_49 () in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | PRINT ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | PO ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | LOOP ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_48 () in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | IF ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | ID _v ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017
      | CONTINUE ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CONST ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | BREAK ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | AF ->
          let _v = _menhir_action_40 () in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_28 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | NEW ->
          let _menhir_stack = MenhirCell1_NEW (_menhir_stack, MenhirState020) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_49 () in
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState044 _tok
          | PO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState044
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_48 () in
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState044 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_47 () in
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState044 _tok
          | _ ->
              _eRR ())
      | MULT ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState020
      | _ ->
          _eRR ()
  
  and _menhir_run_051 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
          | _ ->
              _eRR ())
      | PI ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
          | ID _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_9 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
          | ENTIER _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_12 in
              let _v = _menhir_action_08 e in
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
          | _ ->
              _eRR ())
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_15 exp in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_16 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_19 in
              let _v = _menhir_action_08 e in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_23 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_23 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_26 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_26 in
              let _v = _menhir_action_08 e in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_30 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_30 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_33 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_33 in
              let _v = _menhir_action_08 e in
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_11 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_e : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState113 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState057 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState020 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState026 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState039 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState027 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState035 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState030 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_affect -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_affect (_menhir_stack, _menhir_s, a) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_35 a e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState082
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_24 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_13 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_14 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_12 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_058 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_16 e1 e2 e3 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | DP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_09 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037_spec_021 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState026
      | _ ->
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_10 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037_spec_026 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState027
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | CF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_CO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_05 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_037_spec_039 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
              | PO ->
                  _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
              | NUM ->
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
              | NULL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_17 () in
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_2 in
                  let _v = _menhir_action_01 n in
                  _menhir_run_037_spec_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
              | ENTIER _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_5 in
                  let _v = _menhir_action_08 e in
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
              | DENOM ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
              | CO ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
              | CALL ->
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
              | ADR ->
                  _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
              | PF ->
                  let _v = _menhir_action_36 () in
                  _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | ID _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_2 in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | ENTIER _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v_5 in
          let _v = _menhir_action_08 e in
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | PF ->
          let _v = _menhir_action_36 () in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_037_spec_035 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_19 n in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_37 x xs in
      _menhir_goto_list_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState035 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState030 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_033 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let lp = _v in
      let _v = _menhir_action_04 lp n in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_037_spec_030 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
  
  and _menhir_run_037_spec_027 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
  
  and _menhir_run_037_spec_057 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_052 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_055 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
  
  and _menhir_run_037_spec_061 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_064 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_067 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_045 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_NEW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_18 t in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_49 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002 _tok
      | PO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState002
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_48 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState002 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_51 t in
          _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MULT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          let _menhir_stack = MenhirCell1_PO (_menhir_stack, MenhirState047) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | MULT ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState048
          | _ ->
              _eRR ())
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_MULT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_MULT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let a = _v in
          let _v = _menhir_action_02 a in
          _menhir_goto_affect _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_affect : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState017 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState113 ->
          _menhir_run_037_spec_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState105 ->
          _menhir_run_037_spec_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState081 ->
          _menhir_run_037_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState075 ->
          _menhir_run_037_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState072 ->
          _menhir_run_037_spec_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_037_spec_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState020 ->
          _menhir_run_037_spec_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState067 ->
          _menhir_run_037_spec_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState064 ->
          _menhir_run_037_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_037_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_037_spec_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState057 ->
          _menhir_run_037_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState052 ->
          _menhir_run_037_spec_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_037_spec_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState026 ->
          _menhir_run_037_spec_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState027 ->
          _menhir_run_037_spec_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState039 ->
          _menhir_run_037_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState030 ->
          _menhir_run_037_spec_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState035 ->
          _menhir_run_037_spec_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_112 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_affect (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | NUM ->
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | NULL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_17 () in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_037_spec_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | CO ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | CALL ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | ADR ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_037_spec_113 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_affect -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_105 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_081 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081 _tok
  
  and _menhir_run_037_spec_075 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_072 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_037_spec_018 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018 _tok
  
  and _menhir_run_037_spec_020 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_20 a in
      _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020 _tok
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_49 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
      | PO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
      | MULT ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_48 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LOOP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081 _tok
      | PO ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | NUM ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | NULL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081 _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_037_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081 _tok
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081 _tok
      | DENOM ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | CO ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | CALL ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | ADR ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | DP ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LOOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | AO ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState088
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | EQUAL ->
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_goto_affect _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_33 () in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_34 n in
              _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ENTIER _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PV ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (n, e) = (_v, _v_0) in
                      let _v = _menhir_action_23 e n in
                      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_31 () in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_32 n in
              _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_03 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState121 ->
          _menhir_run_122 _menhir_stack _v _tok
      | MenhirState016 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState088 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState070 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_116 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list_param_ (_menhir_stack, _, lp) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_21 li lp n t in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_49 () in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
      | PO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_48 () in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
      | ID _ ->
          let _v = _menhir_action_38 () in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_124 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_39 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState123 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_120 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, n) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_30 li n in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_085 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_25 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_083 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | _ ->
              _eRR ())
      | AF | BOOL | BREAK | CONST | CONTINUE | ID _ | IF | INT | LOOP | PO | PRINT | RAT | RETURN | WHILE ->
          let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let li1 = _v in
          let _v = _menhir_action_26 exp li1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LOOP -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_LOOP (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_29 li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_071 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_27 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_111 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_41 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState017 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MULT ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (t, n) = (_v, _v_0) in
          let _v = _menhir_action_45 n t in
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_49 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
          | PO ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_48 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_47 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState013 _tok
          | PF ->
              let _v = _menhir_action_42 () in
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_43 x xs in
      _menhir_goto_list_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState010 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState013 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_015 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_param_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState016
      | _ ->
          _eRR ()
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_49 () in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | PO ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_48 () in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_47 () in
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | ID _ ->
          let _v = _menhir_action_38 () in
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
