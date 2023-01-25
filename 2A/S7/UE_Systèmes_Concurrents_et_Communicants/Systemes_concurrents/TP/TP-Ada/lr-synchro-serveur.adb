-- Time-stamp: <19 oct 2012 15:00 queinnec@enseeiht.fr>

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version avec machine à etats. Pas de priorité définie.
package body LR.Synchro.Serveur is
   
   function Nom_Strategie return String is
   begin
      return "Seveur, approche 2";
   end Nom_Strategie;
   
   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
   nl : integer := 0;
   red: boolean := false;
   begin
      loop
         -- D.E. -> (not red) and (nl = 0)
         -- D.L. -> not red
         -- T.E. -> no cond
         -- T.L. -> no cond
         select
          when (not red) and (nl = 0) =>
            accept Demander_Ecriture;
            red := true;
         or
            when not red =>
               accept Demander_Lecture;
               nl := nl + 1;
         or
            accept Terminer_Ecriture;
            red := false;
         or
            accept Terminer_Lecture;
            nl:= nl -1;
         end select;
      end loop;
   exception
      when Error: others =>
         Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
   end LectRedTask;

   procedure Demander_Lecture is
   begin
      LectRedTask.Demander_Lecture;
   end Demander_Lecture;

   procedure Demander_Ecriture is
   begin
      LectRedTask.Demander_Ecriture;
   end Demander_Ecriture;

   procedure Terminer_Lecture is
   begin
      LectRedTask.Terminer_Lecture;
   end Terminer_Lecture;

   procedure Terminer_Ecriture is
   begin
      LectRedTask.Terminer_Ecriture;
   end Terminer_Ecriture;

end LR.Synchro.Serveur;
