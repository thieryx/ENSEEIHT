package allumettes;

import java.util.Scanner;

/**
 * La classe Arbitre définit l'arbitre de la partie.
 */
public class Arbitre {

	/** Nombre de stratégies. */
	public static final int NB_STRAT = 6;
	/** Joueur 1. */
	private Joueur joueur1;
	/** Joueur 2. */
	private Joueur joueur2;
	/** Confiant. */
	private static boolean confiant;

	/**
	 * Constructeur de la classe Arbitre.
	 * @param j1 Le joueur 1
	 * @param j2 Le joueur 2
	 */
	public Arbitre(Joueur j1, Joueur j2) {
		this.joueur1 = j1;
		this.joueur2 = j2;
	}

	/**
	 * Constructeur de la classe Arbitre.
	 * @param j1 Le joueur 1
	 * @param j2 Le joueur 2
	 * @param nouveauConfiant La confiance de l'arbitre
	 */
	public Arbitre(Joueur j1, Joueur j2, boolean nouveauConfiant) {
		this(j1, j2);
		confiant = nouveauConfiant;
	}

	/**
	 * Arbitrer une partie de jeu.
	 * @param jeu Le jeu
	 * @param switchStrat Le booléen pour savoir si le
	 * changement de stratégie est activé
	 */
	public void arbitrer(Jeu jeu, boolean switchStrat) {
		assert (jeu != null);
		Joueur joueurcourant = this.joueur1;
		Joueur gagnant = this.joueur1;
		Joueur perdant = this.joueur2;
		Strategie stratcourant = joueurcourant.getStrat();
		int nbPrises;
		int choix;
		boolean coupInvalide = false;
		boolean jeuTriche = false;
		while (jeu.getNombreAllumettes() > 0 && !jeuTriche) {
			try {
				if (switchStrat) {
					afficherMenu();
					choix = integerRead();
					changeStrat(joueurcourant, choix);
				}
				coupInvalide = false;
				System.out.println("Allumettes restantes : " + jeu.getNombreAllumettes());
				nbPrises = joueurcourant.getPrise(jeu);
				if (nbPrises <= 1) {
					System.out.println(joueurcourant.getNom() + " prend "
						+ nbPrises + " allumette.");
				} else {
					System.out.println(joueurcourant.getNom() + " prend "
						+ nbPrises + " allumettes.");
				}
				jeu.retirer(nbPrises);
			} catch (CoupInvalideException e) {
				System.out.print("Impossible ! ");
				if (e.getCoup() > jeu.getNombreAllumettes()) {
					System.out.println("Nombre invalide : " + e.getCoup() + " (> "
							+ jeu.getNombreAllumettes() + ")");
				} else if (e.getCoup() < 1) {
					System.out.println("Nombre invalide : " + e.getCoup() + " (< 1)");
				} else if (e.getCoup() > Jeu.PRISE_MAX) {
					System.out.println("Nombre invalide : " + e.getCoup()
						+ " (> " + Jeu.PRISE_MAX + ")");
				}
				coupInvalide = true;
			} catch (OperationInterditeException e) {
				System.out.println("[Je triche...]");
				System.out.println("Abandon de la partie car "
					+ joueurcourant.getNom() + " triche !");
				jeuTriche = true;
			}
			if (!coupInvalide) {
				if (joueurcourant.isEqual(this.joueur2)) {
					joueurcourant = this.joueur1;
					stratcourant = this.joueur1.getStrat();
				} else {
					joueurcourant = this.joueur2;
					stratcourant = this.joueur2.getStrat();
				}
			}
		}
		if (!jeuTriche) {
			if (joueurcourant.isEqual(this.joueur2)) {
				gagnant = this.joueur2;
				perdant = this.joueur1;
			}
			System.out.println(perdant.getNom() + " perd !");
			System.out.println(gagnant.getNom() + " gagne !");
		}
	}

	/**
	 * Changer la stratégie d'un joueur.
	 * @param joueur Le joueur
	 * @param choix La stratégie choisie
	 */
	public void changeStrat(Joueur joueur, int choix) {

		if (choix == 1) {
			joueur.setStrat(new StrategieExpert());
		} else if (choix == 2) {
			joueur.setStrat(new StrategieHumain(joueur.getNom()));
		} else if (choix == 3) {
			joueur.setStrat(new StrategieLent());
		} else if (choix == 4) {
			joueur.setStrat(new StrategieNaif());
		} else if (choix == 5) {
			joueur.setStrat(new StrategieRapide());
		} else if (choix == 6) {
			joueur.setStrat(new StrategieTricheur(confiant));
		}
	}

	/**
	 * Afficher le menu contenant les stratégies.
	 */
	public void afficherMenu() {
		System.out.println("Veuillez choisir la nouvelle stratégie parmi celles-ci: ");
		System.out.println("1. Stratégie Expert");
		System.out.println("2. Stratégie Humain");
		System.out.println("3. Stratégie Lent");
		System.out.println("4. Stratégie Naïf");
		System.out.println("5. Stratégie Rapide");
		System.out.println("6. Stratégie Tricheur");
	}

	/**
	 *  Lire un entier entre 1 et NB_STRAT.
	 * @return l'entier rentré au clavier par le joueur
	 */
	public int integerRead() {
		int entier = 0;
		Scanner scan = new Scanner(System.in);
		while (entier <= 0 && entier > Arbitre.NB_STRAT) {
				System.out.println("Pour choisir, entrez un entier de 1 à 7.");
				entier = Integer.parseInt(scan.nextLine());
				if (entier <= 0 && entier > Arbitre.NB_STRAT) {
					System.out.println("Erreur, vous devez donner un entier entre 1 et "
						+ Arbitre.NB_STRAT + ".");
					System.out.println("Veuillez recommencer.");
					entier = 0;
				}
		}
		scan.close();
		return entier;
	}

}
