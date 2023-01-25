import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;

/**
  * Classe de test complément de la classe Cercle.
  * @author	Thierry Xu
  */
public class ComplementsCercleTest {

	/**
	 * Déclaraion des variables.
	 */
	public static final double PI = Math.PI;	// constante PI

	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;

	// Les points du sujet
	private Point A, B, C, D, E;

	// Les cercles du sujet
	private Cercle C1, C2;

	@Before public void setUp() {
		// Construire les points
		A = new Point(1, 2);
		B = new Point(2, 1);
		C = new Point(4, 1);
		D = new Point(8, 1);
		E = new Point(8, 4);

		// Construire les cercles
		C1 = new Cercle(A, 2.5);
		C2 = new Cercle(new Point(6, 1), 2);
		C2.setCouleur(Color.yellow);
	}

	/** Vérifier si deux points ont mêmes coordonnées.
	  * @param p1 le premier point
	  * @param p2 le deuxième point
	  */
	static void memesCoordonnees(String message, Point p1, Point p2) {
		assertEquals(message + " (x)", p1.getX(), p2.getX(), EPSILON);
		assertEquals(message + " (y)", p1.getY(), p2.getY(), EPSILON);
	}

	@Test public void testerComplement1() {
		C2.translater(12, -5);
		C2.translater(-7, 42);
		C2.translater(14, -24);
		memesCoordonnees("Centre de C2 incorrect", new Point(25,14), C2.getCentre());
		assertEquals("Rayon de C2 incorrect",
				2, C2.getRayon(), EPSILON);
		assertEquals("Couleur de C2 incorrect", Color.yellow, C2.getCouleur());
	}

	@Test public void testerComplement2() {
		C1.setDiametre(10);
		C1.setCouleur(Color.red);
		assertTrue(C2.contient(C));
		memesCoordonnees("Centre de C1 incorrect", A, C1.getCentre());
		assertEquals("Aire de C2 incorrect",
				PI*5*5, C1.aire(), EPSILON);
		assertEquals("Couleur de C2 incorrect", Color.red, C1.getCouleur());	}
}
