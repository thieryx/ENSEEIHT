package allumettes;

public class JeuSimple implements Jeu {

	/** Nombre d'allumettes dans la partie. */
	private int nombreAllumettes;

	/**
	 * Constructeur de la classe JeuSimple.
	 * @param nbAllumettes Le nombre d'allumettes actuel
	 */
	public JeuSimple(int nbAllumettes) {
		this.nombreAllumettes = nbAllumettes;
	}

	@Override
	public int getNombreAllumettes() {
		return this.nombreAllumettes;
	}

	@Override
	public void retirer(int nbPrises) throws CoupInvalideException {
		if ((nbPrises > 0) && (nbPrises
			<= Math.min(Jeu.PRISE_MAX, this.nombreAllumettes))) {
			this.nombreAllumettes -= nbPrises;
		} else {
			throw new CoupInvalideException(nbPrises, null);
		}
	}

}
