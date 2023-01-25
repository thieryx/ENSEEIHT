with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Auteur: 
-- Gérer un stock de matériel informatique.
--
package body Stocks_Materiel is

    procedure Creer (Stock : out T_Stock) is
    begin
        null;
    end Creer;


    function Nb_Materiels (Stock: in T_Stock) return Integer is
    begin
        return -1;
    end;

    function Nb_Materiels_HS(Stock: in T_Stock) return Integer is 
    begin
        return -1;
    end Nb_Materiels_HS;
    
    procedure Maj_Materiel(Stock: in out T_Stock; Numero_Serie: in Integer) is
    begin
        null;
    end Maj_Materiel;
    
    procedure Suppr_Materiel(Stock: in out T_Stock; Numero_Serie: in Integer) is
    begin
        null;
    end Suppr_Materiel;
    
    procedure Enregistrer (
            Stock        : in out T_Stock;
            Numero_Serie : in     Integer;
            Nature       : in     T_Nature;
            Annee_Achat  : in     Integer
        ) is
    begin
        null;
    end;


end Stocks_Materiel;
