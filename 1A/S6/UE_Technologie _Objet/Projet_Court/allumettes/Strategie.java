package allumettes;

public interface Strategie {
	/**
	 * Renvoie le nombre d’allumettes
	 * que le joueur veut prendre pour un jeu donné
	 *
	 * @param jeu Le jeu
	 */
	int getPrise(Jeu jeu);
}
