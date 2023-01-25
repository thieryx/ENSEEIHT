package allumettes;

/**
 * La classe StrategieLent caractérise un joueur
 * qui prend la prise minimale.
 */
public class StrategieLent implements Strategie {

    @Override
    public int getPrise(Jeu jeu) {
        return 1;
    }

}
