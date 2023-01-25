package allumettes;

/**
 * Lance une partie des 13 allumettes en fonction des arguments fournis
 * sur la ligne de commande.
 *
 * @author Xavier Crégut
 * @version $Revision: 1.5 $
 */
public class Jouer {

	/** Le nombre d'allumettes en début de partie. */
	private static final int ALLUMETTES_DEPART = 13;
	/** Le nombre d'arguments rentré. */
	private static final int NB_ARGS = 3;
	/** Confiance de l'arbitre. */
	private static boolean confiant;

	/**
	 * Lancer une partie. En argument sont donnés les deux joueurs sous
	 * la forme nom@stratégie.
	 *
	 * @param args la description des deux joueurs
	 */
	public static void main(String[] args) {
		Joueur joueur1 = null;
		Joueur joueur2 = null;
		Arbitre arbitre = null;
		try {
			verifierNombreArguments(args);
			verifierOccurenceArguments(args);
			Jeu partie = new JeuSimple(ALLUMETTES_DEPART);
			confiant = args[0].equals("-confiant");
			if (args.length == NB_ARGS) {
				joueur1 = creerJoueur(args[1]);
				joueur2 = creerJoueur(args[2]);
			} else {
				joueur1 = creerJoueur(args[0]);
				joueur2 = creerJoueur(args[1]);
			}
			arbitre = new Arbitre(joueur1, joueur2, confiant);
			arbitre.arbitrer(partie, false);

		} catch (ConfigurationException e) {
			System.out.println();
			System.out.println("Erreur : " + e.getMessage());
			afficherUsage();
			System.exit(1);
		}
	}

	private static void verifierNombreArguments(String[] args) {
		final int nbJoueurs = 2;
		if (args.length < nbJoueurs) {
			throw new ConfigurationException("Trop peu d'arguments : "
					+ args.length);
		}
		if (args.length > nbJoueurs + 1) {
			throw new ConfigurationException("Trop d'arguments : "
					+ args.length);
		}
	}

	private static void verifierOccurenceArguments(String[] args) {
		final int nbJoueurs = 2;
		if (args.length == nbJoueurs) {
			int occ0 = args[0].length() - args[0].replace("@", "").length();
			int occ1 = args[1].length() - args[1].replace("@", "").length();
			if (occ1 != 1 || occ0 != 1) {
				throw new ConfigurationException("Saisie invalide");
			}
		} else if (args.length == nbJoueurs + 1) {
			int occ0 = args[1].length() - args[1].replace("@", "").length();
			int occ1 = args[2].length() - args[2].replace("@", "").length();
			if (occ1 != 1 || occ0 != 1) {
				throw new ConfigurationException("Saisie invalide");
			}
		}

	}

	/** Afficher des indications sur la manière d'exécuter cette classe. */
	public static void afficherUsage() {
		System.out.println("\n" + "Usage :"
				+ "\n\t" + "java allumettes.Jouer joueur1 joueur2"
				+ "\n\t\t" + "joueur est de la forme nom@stratégie"
				+ "\n\t\t" + "strategie = naif | rapide | expert | humain | tricheur"
				+ "\n"
				+ "\n\t" + "Exemple :"
				+ "\n\t" + "	java allumettes.Jouer Xavier@humain "
				+ "Ordinateur@naif"
				+ "\n");
	}
	/**
	 * Identifier la stratégie.
	 * @param arguments Argument en entrée
	 * @param nom Nom du joueur
	 * @return La stratégie
	 */
	public static Strategie identStrat(String arguments, String nom) {
		Strategie strategieIdent = null;
		String strategie = arguments.toLowerCase();

		switch (strategie) {
			case "expert":
				strategieIdent = new StrategieExpert();
				break;
			case "humain":
				strategieIdent = new StrategieHumain(nom);
				break;
			case "naif":
				strategieIdent = new StrategieNaif();
				break;
			case "rapide":
				strategieIdent = new StrategieRapide();
				break;
			case "lent":
				strategieIdent = new StrategieLent();
				break;
			case "tricheur":
				strategieIdent = new StrategieTricheur(confiant);
				break;
			default:
				throw new ConfigurationException("Stratégie incorrecte");
		}
		return strategieIdent;
	}

	/**
	 * Créer un joueur avec son nom et sa stratégie.
	 * @param args Argument en entrée
	 * @return Le joueur crée.
	 */
	public static Joueur creerJoueur(String args) {
		String[] j = args.split("@");
		return new Joueur(j[0], identStrat(j[1], j[0]));
	}
}
