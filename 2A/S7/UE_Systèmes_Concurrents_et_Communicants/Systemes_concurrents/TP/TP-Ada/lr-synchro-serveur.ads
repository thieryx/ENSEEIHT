-- Time-stamp: <11 sep 2012 10:20 queinnec@enseeiht.fr>

package LR.Synchro.Serveur is
   
   function Nom_Strategie return String;

   procedure Demander_Lecture;
   procedure Demander_Ecriture;
   procedure Terminer_Lecture;
   procedure Terminer_Ecriture;

end LR.Synchro.Serveur;
