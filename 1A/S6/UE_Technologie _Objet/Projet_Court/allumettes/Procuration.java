package allumettes;

public class Procuration implements Jeu {
    /** Nombre d'allumettes dans la partie. */
    private int nombreAllumettes;
    /** Le jeu. */
    private Jeu jeu;

    /**
     * Constructeur pour la classe Procuration.
     * @param nouveauJeu Le jeu
     * @param nbAllumettes Le nombre d'allumettes
     */
    public Procuration(Jeu nouveauJeu, int nbAllumettes) {
        this.jeu = nouveauJeu;
        this.nombreAllumettes = nbAllumettes;
    }

    @Override
    public int getNombreAllumettes() {
        return this.nombreAllumettes;
    }

    @Override
    public void retirer(int nbPrises) throws OperationInterditeException {
        throw new OperationInterditeException(null);
    }

}
