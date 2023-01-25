package allumettes;

import java.util.Random;

/**
 * La classe StrategieExpert caractérise un joueur qui
 * joue du mieux qu’il peut (s’il peut gagner, il gagnera).
 */
public class StrategieExpert implements Strategie {

	@Override
	public int getPrise(Jeu jeu) {
		assert (jeu.getNombreAllumettes() > 0);
		Random rand = new Random();
		if ((jeu.getNombreAllumettes() - 1) % (Jeu.PRISE_MAX + 1) == 0) {
			return rand.nextInt(Math.min(Jeu.PRISE_MAX, jeu.getNombreAllumettes())) + 1;
		} else {
			return (jeu.getNombreAllumettes() - 1) % (Jeu.PRISE_MAX + 1);
		}
	}

}
