package allumettes;

public class Joueur {

	/** Nom du joueur. */
	private String nom;
	/** Nom de la stratégie. */
	private Strategie strategie;


	/**
	 * Constructeur du joueur à partir d'une chaîne de
	 * caractères contenant le nom du joueur et sa stratégie.
	 *
	 * @param nom       nom du joueur
	 * @param strategie stratégie du joueur
	 */
	public Joueur(String nom, Strategie strategie) {
		this.nom = nom;
		this.strategie = strategie;
	}

	/**
	 * Obtenir le nom du joueur.
	 *
	 * @return le nom du joueur
	 */
	public String getNom() {
		String nouveauNom = this.nom;
		return nouveauNom;
	}

	/**
	 * Obtenir le nombre d'allumettes pris par le joueur.
	 * @param jeu Le jeu
	 * @return Le nombre d'allumettes pris par le joueur
	 */
	public int getPrise(Jeu jeu) {
		return this.strategie.getPrise(jeu);
	}

	/**
	 * Vérifier si deux joueurs sont identiques.
	 *
	 * @param joueur joueur comparé
	 * @return vrai si les joueurs sont égaux et faux dans le cas contraire
	 */
	public boolean isEqual(Joueur joueur) {
		return this.getNom() == joueur.getNom();
	}

	/**
	 * Obtenir la stratégie du joueur.
	 *
	 * @return stratégie du joueur
	 */
	public Strategie getStrat() {
		Strategie nouvelleStrat = this.strategie;
		return nouvelleStrat;
	}

	/**
	 * Changer la stratégie du joueur.
	 * @param nouvelleStrat
	 */
	public void setStrat(Strategie nouvelleStrat) {
		this.strategie = nouvelleStrat;
	}
}
