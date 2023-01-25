package allumettes;

import java.util.Random;

/**
 * La classe StrategieNaive caractérise une stratégie où le joueur prend
 * aléatoirement un nombre d'allumettes entre un et trois.
 */
public class StrategieNaif implements Strategie {

	@Override
	public int getPrise(Jeu jeu) {
		assert (jeu.getNombreAllumettes() > 0);
		Random rnd = new Random();
		if (jeu.getNombreAllumettes() > Jeu.PRISE_MAX) {
			return rnd.nextInt(Jeu.PRISE_MAX) + 1;
		} else {
			return rnd.nextInt(jeu.getNombreAllumettes()) + 1;
		}
	}

}
