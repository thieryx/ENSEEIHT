with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with TH;

procedure th_sujet  is

   package TH1 is
       new TH(Unbounded_String, Integer, 11, Length);
   use TH1;

   procedure Afficher1(Cle: in Unbounded_String; Donnee: in Integer) is
   begin
		Put("[");
         Put(To_String(Cle));
		Put( " , ");
         Put(Donnee,1);
         Put("]");

   end Afficher1;

  procedure Afficher_TH is
		new Pour_Chaque(Afficher1);

Sda : T_TH;
begin

   Initialiser(Sda);
   Enregistrer(Sda, To_Unbounded_String("un"), 1);
   Enregistrer(Sda, To_Unbounded_String("Deux"), 2);
   Enregistrer(Sda, To_Unbounded_String("Trois"), 3);
   Enregistrer(Sda, To_Unbounded_String("Quatre"), 4);
   Enregistrer(Sda, To_Unbounded_String("Cinq"), 5);
   Enregistrer(Sda, To_Unbounded_String("Quatre-vingt-dix-neuf"), 99);
   Enregistrer(Sda, To_Unbounded_String("Vingt-et-un"), 21);
   Afficher_TH(Sda);
   Vider(Sda);

end TH_Sujet;
