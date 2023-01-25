
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRG
    | UL_UPIDENT of (
# 34 "Parser.mly"
       (string)
# 16 "Parser.ml"
  )
    | UL_TO
    | UL_SYSTEM
    | UL_PTVIRG
    | UL_POINT
    | UL_PAROUV
    | UL_PARFER
    | UL_OUT
    | UL_MODEL
    | UL_INT
    | UL_IN
    | UL_IDENT of (
# 35 "Parser.mly"
       (string)
# 31 "Parser.ml"
  )
    | UL_FROM
    | UL_FLOW
    | UL_FLOAT
    | UL_FIN
    | UL_ENTIER of (
# 36 "Parser.mly"
       (int)
# 40 "Parser.ml"
  )
    | UL_DEUXPT
    | UL_CROOUV
    | UL_CROFER
    | UL_BOOLEAN
    | UL_BLOCK
    | UL_ACCOUV
    | UL_ACCFER
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 62 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState03 : ('s _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_state
    (** State 03.
        Stack shape : UL_UPIDENT.
        Start symbol: modele. *)

  | MenhirState05 : (('s, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_state
    (** State 05.
        Stack shape : UL_SYSTEM UL_UPIDENT.
        Start symbol: modele. *)

  | MenhirState06 : (('s _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_cell1_UL_PAROUV, _menhir_box_modele) _menhir_state
    (** State 06.
        Stack shape : UL_UPIDENT UL_PAROUV.
        Start symbol: modele. *)

  | MenhirState17 : (('s, _menhir_box_modele) _menhir_cell1_UL_IDENT _menhir_cell0_aux4 _menhir_cell0_int_float_bool, _menhir_box_modele) _menhir_state
    (** State 17.
        Stack shape : UL_IDENT aux4 int_float_bool.
        Start symbol: modele. *)

  | MenhirState19 : (('s, _menhir_box_modele) _menhir_cell1_UL_ENTIER, _menhir_box_modele) _menhir_state
    (** State 19.
        Stack shape : UL_ENTIER.
        Start symbol: modele. *)

  | MenhirState24 : (('s, _menhir_box_modele) _menhir_cell1_port, _menhir_box_modele) _menhir_state
    (** State 24.
        Stack shape : port.
        Start symbol: modele. *)

  | MenhirState29 : ((('s, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_cell1_parametres, _menhir_box_modele) _menhir_state
    (** State 29.
        Stack shape : UL_SYSTEM UL_UPIDENT parametres.
        Start symbol: modele. *)

  | MenhirState37 : (('s, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT _menhir_cell0_sub_sub_flot _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_state
    (** State 37.
        Stack shape : UL_FLOW UL_IDENT sub_sub_flot UL_IDENT.
        Start symbol: modele. *)

  | MenhirState43 : (('s, _menhir_box_modele) _menhir_cell1_sub_flot2, _menhir_box_modele) _menhir_state
    (** State 43.
        Stack shape : sub_flot2.
        Start symbol: modele. *)

  | MenhirState49 : (('s, _menhir_box_modele) _menhir_cell1_UL_BLOCK _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_state
    (** State 49.
        Stack shape : UL_BLOCK UL_UPIDENT.
        Start symbol: modele. *)

  | MenhirState55 : (('s, _menhir_box_modele) _menhir_cell1_aux2, _menhir_box_modele) _menhir_state
    (** State 55.
        Stack shape : aux2.
        Start symbol: modele. *)


and ('s, 'r) _menhir_cell1_aux2 = 
  | MenhirCell1_aux2 of 's * ('s, 'r) _menhir_state * (unit)

and 's _menhir_cell0_aux4 = 
  | MenhirCell0_aux4 of 's * (unit)

and 's _menhir_cell0_int_float_bool = 
  | MenhirCell0_int_float_bool of 's * (unit)

and ('s, 'r) _menhir_cell1_parametres = 
  | MenhirCell1_parametres of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_port = 
  | MenhirCell1_port of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_sub_flot2 = 
  | MenhirCell1_sub_flot2 of 's * ('s, 'r) _menhir_state * (unit)

and 's _menhir_cell0_sub_sub_flot = 
  | MenhirCell0_sub_sub_flot of 's * (unit)

and ('s, 'r) _menhir_cell1_UL_BLOCK = 
  | MenhirCell1_UL_BLOCK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_ENTIER = 
  | MenhirCell1_UL_ENTIER of 's * ('s, 'r) _menhir_state * (
# 36 "Parser.mly"
       (int)
# 149 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_FLOW = 
  | MenhirCell1_UL_FLOW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_IDENT = 
  | MenhirCell1_UL_IDENT of 's * ('s, 'r) _menhir_state * (
# 35 "Parser.mly"
       (string)
# 159 "Parser.ml"
)

and 's _menhir_cell0_UL_IDENT = 
  | MenhirCell0_UL_IDENT of 's * (
# 35 "Parser.mly"
       (string)
# 166 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_PAROUV = 
  | MenhirCell1_UL_PAROUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_SYSTEM = 
  | MenhirCell1_UL_SYSTEM of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_UL_UPIDENT = 
  | MenhirCell0_UL_UPIDENT of 's * (
# 34 "Parser.mly"
       (string)
# 179 "Parser.ml"
)

and _menhir_box_modele = 
  | MenhirBox_modele of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 51 "Parser.mly"
             ((print_endline "aux vide"))
# 190 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 52 "Parser.mly"
               ((print_endline "aux: aux2 aux"))
# 198 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 54 "Parser.mly"
                            ((print_endline "aux2: Bloc | Systeme | FLot"))
# 206 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 54 "Parser.mly"
                            ((print_endline "aux2: Bloc | Systeme | FLot"))
# 214 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 54 "Parser.mly"
                            ((print_endline "aux2: Bloc | Systeme | FLot"))
# 222 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 62 "Parser.mly"
                               ((print_endline "aux3: Port | Port UL_PTVIRG aux3"))
# 230 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 62 "Parser.mly"
                               ((print_endline "aux3: Port | Port UL_PTVIRG aux3"))
# 238 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 66 "Parser.mly"
                     ((print_endline "aux4: UL_IN | UL_OUT"))
# 246 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 66 "Parser.mly"
                     ((print_endline "aux4: UL_IN | UL_OUT"))
# 254 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 72 "Parser.mly"
                                         ((print_endline "aux5: UL_entier | UL_entier UL_VIRG aux5"))
# 262 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 72 "Parser.mly"
                                         ((print_endline "aux5: UL_entier | UL_entier UL_VIRG aux5"))
# 270 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 56 "Parser.mly"
                                               ((print_endline "bloc: UL_BLOCK UL_Ident parametres UL_PTVIRG"))
# 278 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 74 "Parser.mly"
                                                                               ( (print_endline "flot : UL_FLOW UL_IDENT UL_FROM UL_IDENT UL_TO UL_IDENT UL_PTVIRG") )
# 286 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 82 "Parser.mly"
                                                    ( (print_endline "sub_flot : sub_flot2 | sub_flot2 UL_VIRG sub_flot") )
# 294 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 82 "Parser.mly"
                                                    ( (print_endline "sub_flot : sub_flot2 | sub_flot2 UL_VIRG sub_flot") )
# 302 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 70 "Parser.mly"
                                               ((print_endline "int_float_bool: UL_INT | UL_FLOAT | UL_BOOLEAN"))
# 310 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 70 "Parser.mly"
                                               ((print_endline "int_float_bool: UL_INT | UL_FLOAT | UL_BOOLEAN"))
# 318 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 70 "Parser.mly"
                                               ((print_endline "int_float_bool: UL_INT | UL_FLOAT | UL_BOOLEAN"))
# 326 "Parser.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 49 "Parser.mly"
                                                            ( (print_endline "modele : UL_MODEL UL_UPIDENT inter UL_FIN ") )
# 334 "Parser.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 60 "Parser.mly"
                                     ((print_endline "parametres: UL_PAROUV aux3 UL_PARFER"))
# 342 "Parser.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 64 "Parser.mly"
                                    ((print_endline "port: UL_ident UL_DEUXPT aux4 type"))
# 350 "Parser.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 79 "Parser.mly"
                       ( (print_endline "sous_modeles : /* empty */ ") )
# 358 "Parser.ml"
     : (unit))

let _menhir_action_23 =
  fun () ->
    (
# 80 "Parser.mly"
           ( (print_endline "sub_flot : flot_aux") )
# 366 "Parser.ml"
     : (unit))

let _menhir_action_24 =
  fun () ->
    (
# 84 "Parser.mly"
                               ( (print_endline "sub_flot2 : UL_IDENT UL_POINT UL_IDENT UL_DEUXPT UL_IDENT UL_POINT UL_IDENT") )
# 374 "Parser.ml"
     : (unit))

let _menhir_action_25 =
  fun () ->
    (
# 86 "Parser.mly"
                      ( (print_endline "sous_modeles : /* empty */ ") )
# 382 "Parser.ml"
     : (unit))

let _menhir_action_26 =
  fun () ->
    (
# 87 "Parser.mly"
                      ( (print_endline "sub_flot3 : /*empty*/ | UL_IDENT UL_POINT") )
# 390 "Parser.ml"
     : (unit))

let _menhir_action_27 =
  fun () ->
    (
# 76 "Parser.mly"
                         ( (print_endline "sous_modeles : /* empty */ ") )
# 398 "Parser.ml"
     : (unit))

let _menhir_action_28 =
  fun () ->
    (
# 77 "Parser.mly"
                      ( (print_endline "sub_sub_flot : /*empty*/ | UL_IDENT UL_POINT") )
# 406 "Parser.ml"
     : (unit))

let _menhir_action_29 =
  fun () ->
    (
# 58 "Parser.mly"
                                                                 ((print_endline "systeme: UL_SYSTEM UL_Ident parametres UL_ACCOUV aux UL_ACCFER"))
# 414 "Parser.ml"
     : (unit))

let _menhir_action_30 =
  fun () ->
    (
# 68 "Parser.mly"
                                                                ((print_endline "type: int_float_bool | int_float_bool UL_ACCOUV aux5 UL_ACCFER"))
# 422 "Parser.ml"
     : (unit))

let _menhir_action_31 =
  fun () ->
    (
# 68 "Parser.mly"
                                                                ((print_endline "type: int_float_bool | int_float_bool UL_ACCOUV aux5 UL_ACCFER"))
# 430 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_ACCFER ->
        "UL_ACCFER"
    | UL_ACCOUV ->
        "UL_ACCOUV"
    | UL_BLOCK ->
        "UL_BLOCK"
    | UL_BOOLEAN ->
        "UL_BOOLEAN"
    | UL_CROFER ->
        "UL_CROFER"
    | UL_CROOUV ->
        "UL_CROOUV"
    | UL_DEUXPT ->
        "UL_DEUXPT"
    | UL_ENTIER _ ->
        "UL_ENTIER"
    | UL_FIN ->
        "UL_FIN"
    | UL_FLOAT ->
        "UL_FLOAT"
    | UL_FLOW ->
        "UL_FLOW"
    | UL_FROM ->
        "UL_FROM"
    | UL_IDENT _ ->
        "UL_IDENT"
    | UL_IN ->
        "UL_IN"
    | UL_INT ->
        "UL_INT"
    | UL_MODEL ->
        "UL_MODEL"
    | UL_OUT ->
        "UL_OUT"
    | UL_PARFER ->
        "UL_PARFER"
    | UL_PAROUV ->
        "UL_PAROUV"
    | UL_POINT ->
        "UL_POINT"
    | UL_PTVIRG ->
        "UL_PTVIRG"
    | UL_SYSTEM ->
        "UL_SYSTEM"
    | UL_TO ->
        "UL_TO"
    | UL_UPIDENT _ ->
        "UL_UPIDENT"
    | UL_VIRG ->
        "UL_VIRG"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_59 : type  ttv_stack. ttv_stack _menhir_cell0_UL_UPIDENT -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let MenhirCell0_UL_UPIDENT (_menhir_stack, _) = _menhir_stack in
          let _v = _menhir_action_19 () in
          MenhirBox_modele _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYSTEM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_UPIDENT _v ->
          let _menhir_stack = MenhirCell0_UL_UPIDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PAROUV ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack _menhir_cell0_UL_UPIDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_PAROUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_DEUXPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_OUT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_09 () in
              _menhir_goto_aux4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | UL_IN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_08 () in
              _menhir_goto_aux4 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_aux4 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_aux4 (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_16 () in
          _menhir_goto_int_float_bool _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | UL_FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_goto_int_float_bool _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | UL_BOOLEAN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_goto_int_float_bool _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_int_float_bool : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT _menhir_cell0_aux4 -> _ -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_CROOUV ->
          let _menhir_stack = MenhirCell0_int_float_bool (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_ENTIER _v ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
          | _ ->
              _eRR ())
      | UL_PARFER | UL_VIRG ->
          let _ = _menhir_action_30 () in
          _menhir_goto_types _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_UL_ENTIER (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_ENTIER _v ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
          | _ ->
              _eRR ())
      | UL_CROFER ->
          let _ = _menhir_action_10 () in
          _menhir_goto_aux5 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_aux5 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState17 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState19 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT _menhir_cell0_aux4 _menhir_cell0_int_float_bool -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_int_float_bool (_menhir_stack, _) = _menhir_stack in
      let _ = _menhir_action_31 () in
      _menhir_goto_types _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_goto_types : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT _menhir_cell0_aux4 -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_aux4 (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_21 () in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_port (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _v ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24
          | _ ->
              _eRR ())
      | UL_PARFER ->
          let _ = _menhir_action_06 () in
          _menhir_goto_aux3 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_aux3 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState06 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_cell1_UL_PAROUV -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_PAROUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_20 () in
      _menhir_goto_parametres _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_parametres : type  ttv_stack. (ttv_stack _menhir_cell0_UL_UPIDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState05 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_50 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_BLOCK _menhir_cell0_UL_UPIDENT -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PTVIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_UL_UPIDENT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_UL_BLOCK (_menhir_stack, _menhir_s) = _menhir_stack in
          let _ = _menhir_action_12 () in
          let _v = _menhir_action_03 () in
          _menhir_goto_aux2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_aux2 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_aux2 (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYSTEM ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | UL_FLOW ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | UL_BLOCK ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState55
      | UL_ACCFER ->
          let _ = _menhir_action_01 () in
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_FLOW (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_FROM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_UPIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_POINT ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_28 () in
                      _menhir_goto_sub_sub_flot _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | _ ->
                      _eRR ())
              | UL_IDENT _ ->
                  let _v = _menhir_action_27 () in
                  _menhir_goto_sub_sub_flot _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_sub_sub_flot : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_sub_sub_flot (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_TO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_UPIDENT _ ->
                  _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
              | UL_PTVIRG ->
                  let _ = _menhir_action_22 () in
                  _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
              | UL_IDENT _ ->
                  let _ = _menhir_action_25 () in
                  _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_POINT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_26 () in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_24 () in
          (match (_tok : MenhirBasics.token) with
          | UL_VIRG ->
              let _menhir_stack = MenhirCell1_sub_flot2 (_menhir_stack, _menhir_s, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_UPIDENT _ ->
                  _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | UL_PTVIRG ->
                  let _ = _menhir_action_22 () in
                  _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
              | UL_IDENT _ ->
                  let _ = _menhir_action_25 () in
                  _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43 _tok
              | _ ->
                  _eRR ())
          | UL_PTVIRG ->
              let _ = _menhir_action_14 () in
              _menhir_goto_flot_aux _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_sub_flot2 -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_sub_flot2 (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_15 () in
      _menhir_goto_flot_aux _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_flot_aux : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _ = _menhir_action_23 () in
      _menhir_goto_sub_flot _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_sub_flot : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState37 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState43 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT _menhir_cell0_sub_sub_flot _menhir_cell0_UL_IDENT -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell0_sub_sub_flot (_menhir_stack, _) = _menhir_stack in
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_FLOW (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_13 () in
      let _v = _menhir_action_05 () in
      _menhir_goto_aux2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_48 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_BLOCK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_UPIDENT _v ->
          let _menhir_stack = MenhirCell0_UL_UPIDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PAROUV ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState49
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_56 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_aux2 -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_aux2 (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_02 () in
      _menhir_goto_aux _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_aux : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState29 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState55 ->
          _menhir_run_56 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_57 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_UPIDENT, _menhir_box_modele) _menhir_cell1_parametres -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_parametres (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell0_UL_UPIDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_SYSTEM (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_29 () in
      let _v = _menhir_action_04 () in
      _menhir_goto_aux2 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_UPIDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_parametres (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_ACCOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYSTEM ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | UL_FLOW ->
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | UL_BLOCK ->
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
          | UL_ACCFER ->
              let _ = _menhir_action_01 () in
              _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_port -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_port (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_07 () in
      _menhir_goto_aux3 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_ENTIER -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_UL_ENTIER (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_11 () in
      _menhir_goto_aux5 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_MODEL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_UPIDENT _v ->
              let _menhir_stack = MenhirCell0_UL_UPIDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_ACCOUV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_SYSTEM ->
                      _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_FLOW ->
                      _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_BLOCK ->
                      _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_ACCFER ->
                      let _ = _menhir_action_01 () in
                      _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let modele =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_modele v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 88 "Parser.mly"
  

# 950 "Parser.ml"
