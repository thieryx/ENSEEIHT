(* Les règles de la déduction naturelle doivent être ajoutées à Coq. *) 
Require Import Naturelle. 

(* Ouverture d'une section *) 
Section LogiqueProposition. 

(* Déclaration de variables propositionnelles *) 
Variable A B C E Y R : Prop. 

Theorem Thm_0 : A /\ B -> B /\ A.
I_imp HAetB.
I_et.
E_et_d A.
Hyp HAetB.
E_et_g B.
Hyp HAetB.
Qed.

Theorem Thm_1 : ((A \/ B) -> C) -> (B -> C).
I_imp H1.
I_imp H2.
E_imp (A\/B).
Hyp H1.
I_ou_d.
Hyp H2.
Qed.

Theorem Thm_2 : A -> ~~A.
I_imp H1.
I_non H2.
E_non A.
Hyp H1.
Hyp H2.
Qed.

Theorem Thm_3 : (A -> B) -> (~B -> ~A).
I_imp H1.
I_imp H2.
I_non H3.
E_non B.
E_imp A.
Hyp H1.
Hyp H3.
Hyp H2.
Qed.

Theorem Thm_4 : (~~A) -> A.
I_imp H1.
absurde H2.
E_non (~A).
Hyp H2.
Hyp H1.
Qed.

Theorem Thm_5 : (~B -> ~A) -> (A -> B).
I_imp H1.
I_imp H2.
absurde H3.
E_non (A).
Hyp H2.
E_imp (~B).
Hyp H1.
Hyp H3.
Qed.

Theorem Thm_6 : ((E -> (Y \/ R)) /\ (Y -> R)) -> ~R -> ~E.
I_imp H1.
I_imp H2.
I_non H3.
E_non R.
E_ou Y R.
E_imp E.
E_et_g((Y -> R)).
Hyp H1.
Hyp H3.
E_et_d(E -> Y \/ R).
Hyp H1.
I_imp H4.
Hyp H4.
Hyp H2.
Qed.

(* Version en Coq *)

Theorem Coq_Thm_0 : A /\ B -> B /\ A.
intro H.
destruct H as (HA,HB).  (* élimination conjonction *)
split.                  (* introduction conjonction *)
exact HB.               (* hypothèse *)
exact HA.               (* hypothèse *)
Qed.


Theorem Coq_E_imp : ((A -> B) /\ A) -> B.
intro H1.
destruct H1 as (HA,HB).
E_imp A.
Hyp HA.
Hyp HB.
Qed.

Theorem Coq_E_et_g : (A /\ B) -> A.
intro H1.
destruct H1 as (HA,HB).
Hyp HA.
Qed.

Theorem Coq_E_ou : ((A \/ B) /\ (A -> C) /\ (B -> C)) -> C.
intro H1.
destruct H1 as (HA,HB).
destruct HB as (HB, HC).
E_ou A B.
Hyp HA.
Hyp HB. 
Hyp HC.
Qed.

Theorem Coq_Thm_7 : ((E -> (Y \/ R)) /\ (Y -> R)) -> (~R -> ~E).
intro H1.
intro H2.
I_non H3.
E_non R.
E_imp Y.
E_et_d ((E -> Y \/ R)).
Hyp H1.
absurde H.
E_non R.
absurde H4.


Qed.

End LogiqueProposition.

