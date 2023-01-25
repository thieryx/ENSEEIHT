package allumettes;

/**
 * La classe StrategieRapide caractérise une stratégie où le joueur prend
 * le maximum d'allumettes possible.
 */
public class StrategieRapide implements Strategie {

	@Override
	public int getPrise(Jeu jeu) {
		assert (jeu.getNombreAllumettes() > 0);
		return Math.min(Jeu.PRISE_MAX, jeu.getNombreAllumettes());
	}

}
