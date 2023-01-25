
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRG
    | UL_VARIABLE of (
# 20 "Parser.mly"
       (string)
# 16 "Parser.ml"
  )
    | UL_SYMBOLE of (
# 19 "Parser.mly"
       (string)
# 21 "Parser.ml"
  )
    | UL_PT
    | UL_PAROUV
    | UL_PARFER
    | UL_NEG
    | UL_FIN
    | UL_FAIL
    | UL_DED
    | UL_COUP
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 44 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_programme) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: programme. *)

  | MenhirState01 : (('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_state
    (** State 01.
        Stack shape : UL_SYMBOLE.
        Start symbol: programme. *)

  | MenhirState02 : ((('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_cell1_UL_PAROUV, _menhir_box_programme) _menhir_state
    (** State 02.
        Stack shape : UL_SYMBOLE UL_PAROUV.
        Start symbol: programme. *)

  | MenhirState03 : (('s, _menhir_box_programme) _menhir_cell1_UL_VARIABLE, _menhir_box_programme) _menhir_state
    (** State 03.
        Stack shape : UL_VARIABLE.
        Start symbol: programme. *)

  | MenhirState04 : (('s, _menhir_box_programme) _menhir_cell1_UL_VIRG, _menhir_box_programme) _menhir_state
    (** State 04.
        Stack shape : UL_VIRG.
        Start symbol: programme. *)

  | MenhirState05 : (('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_state
    (** State 05.
        Stack shape : UL_SYMBOLE.
        Start symbol: programme. *)

  | MenhirState07 : (('s, _menhir_box_programme) _menhir_cell1_terme, _menhir_box_programme) _menhir_state
    (** State 07.
        Stack shape : terme.
        Start symbol: programme. *)

  | MenhirState14 : (('s, _menhir_box_programme) _menhir_cell1_regle, _menhir_box_programme) _menhir_state
    (** State 14.
        Stack shape : regle.
        Start symbol: programme. *)

  | MenhirState17 : (('s, _menhir_box_programme) _menhir_cell1_regle, _menhir_box_programme) _menhir_state
    (** State 17.
        Stack shape : regle.
        Start symbol: programme. *)

  | MenhirState23 : (('s, _menhir_box_programme) _menhir_cell1_predicat, _menhir_box_programme) _menhir_state
    (** State 23.
        Stack shape : predicat.
        Start symbol: programme. *)

  | MenhirState24 : (('s, _menhir_box_programme) _menhir_cell1_UL_NEG, _menhir_box_programme) _menhir_state
    (** State 24.
        Stack shape : UL_NEG.
        Start symbol: programme. *)

  | MenhirState30 : (('s, _menhir_box_programme) _menhir_cell1_deduction_ter, _menhir_box_programme) _menhir_state
    (** State 30.
        Stack shape : deduction_ter.
        Start symbol: programme. *)


and ('s, 'r) _menhir_cell1_deduction_ter = 
  | MenhirCell1_deduction_ter of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_predicat = 
  | MenhirCell1_predicat of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_regle = 
  | MenhirCell1_regle of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_terme = 
  | MenhirCell1_terme of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_NEG = 
  | MenhirCell1_UL_NEG of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_PAROUV = 
  | MenhirCell1_UL_PAROUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_SYMBOLE = 
  | MenhirCell1_UL_SYMBOLE of 's * ('s, 'r) _menhir_state * (
# 19 "Parser.mly"
       (string)
# 130 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_VARIABLE = 
  | MenhirCell1_UL_VARIABLE of 's * ('s, 'r) _menhir_state * (
# 20 "Parser.mly"
       (string)
# 137 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_VIRG = 
  | MenhirCell1_UL_VIRG of 's * ('s, 'r) _menhir_state

and _menhir_box_programme = 
  | MenhirBox_programme of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 41 "Parser.mly"
                        ( (print_endline "axiome : A COMPLETER") )
# 151 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 43 "Parser.mly"
                                               ( (print_endline "deduction : A COMPLETER") )
# 159 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 45 "Parser.mly"
                                                  ( (print_endline "deduction_bis : A COMPLETER") )
# 167 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 47 "Parser.mly"
                                                            ( (print_endline "deduction_ter : A COMPLETER") )
# 175 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 47 "Parser.mly"
                                                            ( (print_endline "deduction_ter : A COMPLETER") )
# 183 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 47 "Parser.mly"
                                                            ( (print_endline "deduction_ter : A COMPLETER") )
# 191 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 47 "Parser.mly"
                                                            ( (print_endline "deduction_ter : A COMPLETER") )
# 199 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 49 "Parser.mly"
                             ((print_endline "programme vide"))
# 207 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 50 "Parser.mly"
                       ( (print_endline "deduction_ter_suite : A COMPLETER") )
# 215 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 53 "Parser.mly"
                                    ( (print_endline "predicat : A COMPLETER") )
# 223 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 57 "Parser.mly"
                                                            ( (print_endline "predicat_bis : A COMPLETER") )
# 231 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 57 "Parser.mly"
                                                            ( (print_endline "predicat_bis : A COMPLETER") )
# 239 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 60 "Parser.mly"
                        ((print_endline "programme vide"))
# 247 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 61 "Parser.mly"
                     ( (print_endline "predicat_ter_suite : A COMPLETER") )
# 255 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 55 "Parser.mly"
                                                 ( (print_endline "predicat_terme : A COMPLETER") )
# 263 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 34 "Parser.mly"
                                     ( (print_endline "programme : regle suite_regle FIN ") )
# 271 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 36 "Parser.mly"
                           ( (print_endline "regle : A COMPLETER") )
# 279 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 36 "Parser.mly"
                           ( (print_endline "regle : A COMPLETER") )
# 287 "Parser.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 38 "Parser.mly"
                      ((print_endline "programme vide"))
# 295 "Parser.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 39 "Parser.mly"
             ( (print_endline "suite_regle : A COMPLETER") )
# 303 "Parser.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 63 "Parser.mly"
                                              ( (print_endline "terme : A COMPLETER") )
# 311 "Parser.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 63 "Parser.mly"
                                              ( (print_endline "terme : A COMPLETER") )
# 319 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_COUP ->
        "UL_COUP"
    | UL_DED ->
        "UL_DED"
    | UL_FAIL ->
        "UL_FAIL"
    | UL_FIN ->
        "UL_FIN"
    | UL_NEG ->
        "UL_NEG"
    | UL_PARFER ->
        "UL_PARFER"
    | UL_PAROUV ->
        "UL_PAROUV"
    | UL_PT ->
        "UL_PT"
    | UL_SYMBOLE _ ->
        "UL_SYMBOLE"
    | UL_VARIABLE _ ->
        "UL_VARIABLE"
    | UL_VIRG ->
        "UL_VIRG"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_37_spec_00 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_programme =
    fun _menhir_stack _v ->
      MenhirBox_programme _v
  
  let rec _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_regle -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_regle (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _v = _menhir_action_16 () in
          _menhir_goto_programme _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_programme : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_37_spec_00 _menhir_stack _v
      | MenhirState14 ->
          _menhir_run_20_spec_14 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState17 ->
          _menhir_run_20_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_20_spec_14 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_regle -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_20 () in
      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_regle -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let MenhirCell1_regle (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _v = _menhir_action_16 () in
          _menhir_goto_programme _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20_spec_17 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_regle -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_20 () in
      _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PAROUV ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE as 'stack) -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_PAROUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VARIABLE _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02
      | UL_SYMBOLE _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_VARIABLE (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | UL_PARFER ->
          let _ = _menhir_action_13 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_VIRG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VARIABLE _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04
      | UL_SYMBOLE _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PAROUV ->
          let _menhir_stack = MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | UL_PARFER | UL_VIRG ->
          let _v = _menhir_action_21 () in
          _menhir_goto_terme _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_terme : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_terme (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | UL_PARFER ->
          let _ = _menhir_action_13 () in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_terme -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_terme (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_12 () in
      _menhir_goto_predicat_bis _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_predicat_bis : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState02 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState04 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_cell1_UL_PAROUV -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_PAROUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_15 () in
      _menhir_goto_predicat_terme _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_goto_predicat_terme : type  ttv_stack. ((ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE as 'stack) -> _ -> _ -> ('stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_10 () in
      _menhir_goto_predicat _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_predicat : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState30 ->
          _menhir_run_28_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState23 ->
          _menhir_run_28_spec_23 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState00 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_28_spec_30 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_deduction_ter -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_04 () in
      _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
  
  and _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_deduction_ter (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYMBOLE _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState30
          | UL_NEG ->
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | UL_FAIL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
          | UL_COUP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
          | _ ->
              _eRR ())
      | UL_PT ->
          let _ = _menhir_action_08 () in
          _menhir_goto_deduction_ter_suite _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_NEG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24
      | _ ->
          _eRR ()
  
  and _menhir_goto_deduction_ter_suite : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_deduction_ter -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_deduction_ter (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_03 () in
      _menhir_goto_deduction_bis _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_deduction_bis : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState23 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_predicat -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_predicat (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_02 () in
      let _v = _menhir_action_18 () in
      _menhir_goto_regle _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_regle : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState17 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_regle (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState17
      | UL_FIN ->
          let _ = _menhir_action_19 () in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_regle (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState14
      | UL_FIN ->
          let _ = _menhir_action_19 () in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_deduction_ter -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _ = _menhir_action_09 () in
      _menhir_goto_deduction_ter_suite _menhir_stack _menhir_lexbuf _menhir_lexer
  
  and _menhir_run_28_spec_23 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_predicat -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_04 () in
      _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_NEG -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_NEG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_05 () in
      _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          let _v = _menhir_action_17 () in
          _menhir_goto_regle _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | UL_DED ->
          let _menhir_stack = MenhirCell1_predicat (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYMBOLE _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState23
          | UL_NEG ->
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | UL_FAIL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | UL_COUP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_22 () in
      _menhir_goto_terme _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_VIRG -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_UL_VIRG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_14 () in
      _menhir_goto_predicat_ter _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_predicat_ter : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_VARIABLE -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_UL_VARIABLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_11 () in
      _menhir_goto_predicat_bis _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let programme =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_programme v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 64 "Parser.mly"
  

# 728 "Parser.ml"
