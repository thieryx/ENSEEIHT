with Ada.Text_IO;            use Ada.Text_IO;

package body TH is

	procedure Initialiser(Sda: out T_TH) is
	begin
        for i in 1..borne_max loop
            LCA1.Initialiser(Sda(i));
        end loop;
	end Initialiser;


    function Est_Vide (Sda : T_TH) return Boolean is
    begin
        for i in 1..borne_max loop
            if  not LCA1.Est_Vide(Sda(i)) then
                return False;
            end if;
        end loop;
        return True;
    end Est_Vide;


    function Taille (Sda : in T_TH) return Integer is
        cpt: Integer := 0;
    begin
        for i in 1..borne_max loop
            cpt := cpt + LCA1.Taille(Sda(i));
        end loop;
        return cpt;
    end Taille;


    procedure Enregistrer (Sda : in out T_TH ; Cle : in T_Cle ; Donnee : in T_Donnee) is
        rang : Integer;
    begin
        rang := Hachage(Cle) mod borne_max + 1;
        LCA1.Enregistrer(Sda(rang), Cle, Donnee);
    end Enregistrer;


    function Cle_Presente (Sda : in T_TH ; Cle : in T_Cle) return Boolean is
    begin
        for i in 1..borne_max loop
            if  LCA1.Cle_Presente(Sda(i), Cle) then
                return True;
            end if;
        end loop;
        return False;
    end;


    function La_Donnee (Sda : in T_TH ; Cle : in T_Cle) return T_Donnee is
    rang : Integer;
    begin
        rang := Hachage(Cle) mod borne_max + 1;
        return LCA1.La_Donnee(Sda(rang), Cle);
    end La_Donnee;


    procedure Supprimer (Sda : in out T_TH ; Cle : in T_Cle) is
    rang : Integer;
    begin
        rang := Hachage(Cle) mod borne_max + 1 ;
        LCA1.Supprimer(Sda(rang), Cle);
    end Supprimer;


    procedure Vider (Sda : in out T_TH) is
    begin
        for i in 1..borne_max loop
            LCA1.Vider(Sda(i));
        end loop;
    end Vider;


    procedure Pour_Chaque (Sda : in T_TH) is

        procedure Afficher_SDA is
                new LCA1.Pour_Chaque(Traiter);

    begin
        for i in 1..borne_max loop
            Put("#"&Integer'Image(i)&" || ");
            Afficher_SDA(Sda(i));
            New_Line;
        end loop;
    end Pour_Chaque;



end TH;
