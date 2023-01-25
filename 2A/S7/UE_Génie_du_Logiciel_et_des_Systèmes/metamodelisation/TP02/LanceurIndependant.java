import java.lang.reflect.*;
import java.util.*;

import javax.xml.XMLConstants;

/** L'objectif est de faire un lanceur simple sans utiliser toutes les clases
  * de notre architecture JUnit.   Il permet juste de valider la compréhension
  * de l'introspection en Java.
  */
public class LanceurIndependant {
	private int nbTestsLances;
	private int nbErreurs;
	private int nbEchecs;
	private List<Throwable> erreurs = new ArrayList<>();

	public LanceurIndependant(String... nomsClasses) {
	    System.out.println();

		// Lancer les tests pour chaque classe
		for (String nom : nomsClasses) {
			try {
				System.out.print(nom + " : ");
				this.testerUneClasse(nom);
				System.out.println();
			} catch (ClassNotFoundException e) {
				System.out.println(" Classe inconnue !");
			} catch (Exception e) {
				System.out.println(" Problème : " + e);
				e.printStackTrace();
			}
		}

		// Afficher les erreurs
		for (Throwable e : erreurs) {
			System.out.println();
			e.printStackTrace();
		}

		// Afficher un bilan
		System.out.println();
		System.out.printf("%d tests lancés dont %d échecs et %d erreurs.\n",
				nbTestsLances, nbEchecs, nbErreurs);
	}


	public int getNbTests() {
		return this.nbTestsLances;
	}


	public int getNbErreurs() {
		return this.nbErreurs;
	}


	public int getNbEchecs() {
		return this.nbEchecs;
	}


	private void testerUneClasse(String nomClasse)
		throws ClassNotFoundException, InstantiationException,
						  IllegalAccessException, NoSuchMethodException
	{
		// Récupérer la classe
		Class<?> classe = Class.forName(nomClasse);

		// Récupérer les méthodes "preparer" et "nettoyer"
		Method preparer = classe.getMethod("preparer");
		Method nettoyer = classe.getMethod("nettoyer");

		// Instancier l'objet qui sera le récepteur des tests
		Object objet = null;
		try {
			objet = classe.getDeclaredConstructor().newInstance();
		} catch (Exception e) {
			System.out.println(" Problème : " + e);
			e.printStackTrace();
		}

		// Exécuter les méthods de test
		for (Method m : classe.getMethods()) {
			if (m.getName().startsWith("test")) {
				// Exécuter la méthode de test
				try {
					// Exécuter la méthode "preparer"
					if (preparer != null) {
						preparer.invoke(objet);
					}
					// Exécuter la méthode de test
					m.invoke(objet);
					// Exécuter la méthode "nettoyer"
					if (nettoyer != null) {
						nettoyer.invoke(objet);
					}
					System.out.print(".");
				} catch (InvocationTargetException e) {
					// La méthode de test a échoué
					Throwable cause = e.getCause();
					if (cause instanceof AssertionError) {
						// C'est un échec
						System.out.print("Echec");
						nbEchecs++;
					} else {
						// C'est une erreur
						System.out.print("Erreur");
						nbErreurs++;
						erreurs.add(cause);
					}
				} catch (Exception e) {
					// La méthode de test a échoué
					System.out.print("Echoue");
					nbErreurs++;
					erreurs.add(e);
				}
				nbTestsLances++;
			}
		}
	}

	public static void main(String... args) {
		LanceurIndependant lanceur = new LanceurIndependant(args);
	}

}
