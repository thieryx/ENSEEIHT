with Ada.Text_IO;                 use Ada.Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Unchecked_Deallocation;

package body Vecteurs_Creux is


	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Vecteur_Creux);


	procedure Initialiser (V : out T_Vecteur_Creux) is
	begin
		V:= Null;
	end Initialiser;


	procedure Detruire (V: in out T_Vecteur_Creux) is
	begin
		Null;	-- TODO : à changer
	end Detruire;


	function Est_Nul (V : in T_Vecteur_Creux) return Boolean is
	begin
         return (V = null);
	end Est_Nul;


	function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
     begin
        if V.all.Indice = Indice then
            return V.all.Valeur;
        else
            return Composante_Recursif(V.all.suivant, Indice);
        end if;
	end Composante_Recursif;


    function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
        courant : T_Vecteur_Creux;
        begin
            courant := V;
            for i in 1..Indice loop
                courant := courant.all.Suivant;
            end loop;
            return courant.all.Valeur;
	end Composante_Iteratif;


	procedure Modifier (V : in out T_Vecteur_Creux ;
				       Indice : in Integer ;
					   Valeur : in Float ) is
	begin
            for i in 1..Indice loop
                V:=V.all.Suivant;
            end loop;
            V.all.Valeur:= Valeur;
	end Modifier;


	function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean is
	begin
            if V1.all.Valeur /= V2.all.Valeur then
                return False;
            else
                return Sont_Egaux_Recursif(V1.all.suivant,V2.all.suivant);
            end if;

            return True;
	end Sont_Egaux_Recursif;


    function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean is
        courant1 : T_Vecteur_Creux;
        courant2 : T_Vecteur_Creux;
    begin
        courant1 := V1;
        courant2 := V2;
            while courant1.all.Valeur = courant2.all.Valeur loop
                courant1:=courant1.all.Suivant;
                courant2:=courant2.all.Suivant;

                if courant1.all.Valeur /= courant2.all.Valeur then
                    return False;
                end if;

            end loop;
            return True;

	end Sont_Egaux_Iteratif;


	procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in T_Vecteur_Creux) is
         courant : T_Vecteur_Creux;
    begin
            courant := Null;
            while V1 /= null loop
                courant.all.Valeur := V1.all.Valeur + V2.all.Valeur;
                V1:=V1.all.Suivant;
                V2:=V2.all.Suivant;
                courant := courant.all.Suivant;
            end loop;
            V1 := courant;
	end Additionner;


	function Norme2 (V : in T_Vecteur_Creux) return Float is
	begin
		return 0.0;	-- TODO : à changer
	end Norme2;


	Function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float is
	begin
		return 0.0;	-- TODO : à changer
	end Produit_Scalaire;


	procedure Afficher (V : T_Vecteur_Creux) is
	begin
		if V = Null then
			Put ("--E");
		else
			-- Afficher la composante V.all
			Put ("-->[ ");
			Put (V.all.Indice, 0);
			Put (" | ");
			Put (V.all.Valeur, Fore => 0, Aft => 1, Exp => 0);
			Put (" ]");

			-- Afficher les autres composantes
			Afficher (V.all.Suivant);
		end if;
	end Afficher;


	function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer is
	begin
		if V = Null then
			return 0;
		else
			return 1 + Nombre_Composantes_Non_Nulles (V.all.Suivant);
		end if;
	end Nombre_Composantes_Non_Nulles;


end Vecteurs_Creux;
