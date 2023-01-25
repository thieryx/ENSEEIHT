import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;


/**
  * L'objectif de cette classe est de vérifier que les exigences E12, E13 et E14 ont été
  * correctement programmées.
  *
  * @author	Thierry Xu
  */

public class CercleTest {

	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;

	// Les points
	private Point A, B, C, D, E, F, G;

	// Les cercles du sujet
	private Cercle C1, C2;
	private static Cercle C3;

	@Before public void setUp() {
		// Construire les points
		A = new Point(1, 2);
		B = new Point(2, 1);
		C = new Point(4, 1);
		D = new Point(8, 1);
		E = new Point(8, 4);
		F = new Point((A.getX() + B.getX()) / 2, (A.getY() + B.getY()) / 2);
		G = new Point((C.getX() + D.getX()) / 2, (C.getY() + D.getY()) / 2);

		// Construire les cercles
		C1 = new Cercle(A, B);
		C2 = new Cercle(C, D, Color.yellow);
		C3 = Cercle.creerCercle(D, E);
	}

	/** Vérifier si deux points ont mêmes coordonnées.
	  * @param p1 le premier point
	  * @param p2 le deuxième point
	  */
	static void memesCoordonnees(String message, Point point1, Point point2) {
		assertEquals(message + " (x)", point1.getX(), point2.getX(), EPSILON);
		assertEquals(message + " (y)", point1.getY(), point2.getY(), EPSILON);
	}

	@Test public void testerE12C2() {
		memesCoordonnees("E12 : Centre de C2 incorrect", F, C1.getCentre());
		assertEquals("E12 : Rayon de C2 incorrect", A.distance(B) / 2, C1.getRayon(), EPSILON);
		assertEquals("E12 : Couleur de C2 incorrect", Color.blue, C1.getCouleur());
	}

	@Test public void testerE13C2() {
		memesCoordonnees("E13 : Centre de C2 incorrect", G, C2.getCentre());
		assertEquals("E13 : Rayon de C2 incorrect", C.distance(D) / 2, C2.getRayon(), EPSILON);
		assertEquals("E13 : Couleur de C2 incorrect", Color.yellow, C2.getCouleur());
	}

	@Test public void testerE14C3() {
		memesCoordonnees("E14 : Centre de C3 incorrect", D, C3.getCentre());
		assertEquals("E14 : Rayon de C3 incorrect", D.distance(E), C3.getRayon(), EPSILON);
		assertEquals("E14 : Couleur de C3 incorrect", Color.blue, C3.getCouleur());
	}
}
