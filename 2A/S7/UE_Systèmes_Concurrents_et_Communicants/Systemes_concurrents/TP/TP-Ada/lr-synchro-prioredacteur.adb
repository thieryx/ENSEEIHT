with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version simple : exclusion mutuelle pour toutes les opérations
--  fournit une ossature pour l'approche "service"

package body LR.Synchro.Prioredacteur is
   
   function Nom_Strategie return String is
   begin
      return "Priorité Rédacteur";
   end Nom_Strategie;

   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
   type EtatFichier is (Libre, Ecriture, Lecture);
   etat: EtatFichier := Libre;
   nl: integer := 0;
   begin
      loop
         case etat is
         when Libre =>
            select when Demander_Ecriture'count = 0 =>
               accept Demander_Lecture;
               nl := nl + 1;
               etat := Lecture;
            or
               accept Demander_Ecriture;
               etat := Ecriture;
            end select;

         when Ecriture =>
            accept Terminer_Ecriture;
            etat := Libre;

         when Lecture =>
            select when Demander_Ecriture'count = 0 =>
               accept Demander_Lecture;
               nl := nl + 1;
            or
               accept Terminer_Lecture;
               nl := nl - 1;
            end select;
            if  nl = 0 then
               etat := Libre;
               end if;

         end case;
      end loop;
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

end LR.Synchro.Prioredacteur;
