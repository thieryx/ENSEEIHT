with LCA;
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with SDA_Exceptions;            use SDA_Exceptions;

procedure lca_sujet is

    package LCA1 is
            new LCA (T_Cle => Unbounded_String, T_Donnee => Integer);
    use LCA1;

    Sda : T_LCA;

    procedure Traiter (Cle: in Unbounded_String; Donnee: in Integer) is

        procedure Afficher1 (Cle: in Unbounded_String) is
            begin
                Put("[");
                Put(To_String(Cle));
            end Afficher1;

        procedure Afficher2 (Donnee: in Integer) is
            begin
                Put(Donnee, 1);
                Put("]");
            end Afficher2;

        begin
            Afficher1(Cle);
            Put(",");
            Afficher2(Donnee);
            New_Line;
        end Traiter;

    procedure Afficher is new Pour_Chaque(Traiter);


    begin
        Initialiser(Sda);
        Enregistrer(Sda, To_Unbounded_String("un"), 1);
        Enregistrer(Sda, To_Unbounded_String("deux"), 2);
        Afficher(Sda);
        Vider(Sda);
    exception
        when Cle_Absente_Exception => Put_Line("La clé est absente.");
    end lca_sujet;

