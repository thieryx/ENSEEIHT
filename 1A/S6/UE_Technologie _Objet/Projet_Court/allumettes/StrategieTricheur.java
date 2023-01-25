package allumettes;

/**
 * La classe StrategieTricheur caractérise une stratégie où le joueur triche.
 */
public class StrategieTricheur implements Strategie {

	/** Confiance de l'arbitre. */
	private boolean confiant;

    /** Interdiction de triche. */
    private boolean interdiction = false;

    /**
     * Constructeur pour la classe StrategieTricheur.
     * @param nouvelleConfiance confiance de l'arbitre
     */
	public StrategieTricheur(boolean nouvelleConfiance) {
        this.confiant = nouvelleConfiance;
	}

    @Override
    public int getPrise(Jeu jeu) {
        assert (jeu.getNombreAllumettes() > 0);
		if (this.confiant || this.interdiction) {
            try {
                while (jeu.getNombreAllumettes() > 2) {
                    jeu.retirer(1);
                }
                System.out.println("[Je triche...]");
                System.out.println("[Allumettes restantes : "
                    + jeu.getNombreAllumettes() + "]");
            } catch (CoupInvalideException e) {
                System.out.println("Coup Invalide");
            }
            return 1;
        } else {
            this.interdiction = true;
			return getPrise(new Procuration(jeu, jeu.getNombreAllumettes()));
		}
    }
}
