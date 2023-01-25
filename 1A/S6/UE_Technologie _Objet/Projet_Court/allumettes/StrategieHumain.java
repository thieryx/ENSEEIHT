package allumettes;

import java.util.Scanner;

/**
 * La classe StrategieRapide caractérise une stratégie où le joueur est un
 * humain.
 */
public class StrategieHumain implements Strategie {

	/** le scanner pour lire le nombre d'allumettes. */
	private static Scanner scan;

	/** Nom du joueur. */
	private String nom;

	/**
	 * Constructeur pour la classe StratégieHumain.
	 */
	public StrategieHumain() {
		scan = new Scanner(System.in);
	}

	/**
	 * Constructeur pour la classe StratégieHumain.
	 * @param nouveauNom Nom du joueur
	 */
	public StrategieHumain(String nouveauNom) {
		scan = new Scanner(System.in);
		this.nom = nouveauNom;
	}

	@Override
	public int getPrise(Jeu jeu) {
		assert (jeu != null);
		assert (jeu.getNombreAllumettes() > 0);
		int nbAllumettes = 0;
		try {
			System.out.print(this.nom + ", combien d'allumettes ? ");
			nbAllumettes = Integer.parseInt(scan.nextLine());
		} catch (NumberFormatException e) {
			if (e.getMessage().contains("triche")) {
				try {
					System.out.println("[Une allumette en moins, plus que "
						+ (jeu.getNombreAllumettes() - 1) + ". Chut !]");
					jeu.retirer(1);
					return getPrise(jeu);
				} catch (CoupInvalideException e1) {
					System.out.println("Coup Invalide");
				}
			} else {
				System.out.println("Vous devez donner un entier.");
				return getPrise(jeu);
			}
		}
		return nbAllumettes;
	}
}
