import java.awt.Color;

import afficheur.Afficheur;

public class AfficheurTexte implements Afficheur {

	@Override
	public void dessinerCercle(double x, double y, double rayon, Color c) {
		System.out.print("Cercle {");
		System.out.print("\n");
		System.out.print("	centre_x = " + x);
		System.out.print("\n");
		System.out.print("	centre_y = " + y);
		System.out.print("\n");
		System.out.print("	rayon = " + rayon);
		System.out.print("\n");
		System.out.print("	couleur = " + c);
		System.out.print("\n");
		System.out.print("}");
	}

	@Override
	public void dessinerLigne(double x1, double y1, double x2, double y2, Color c) {
		System.out.print("Ligne {");
		System.out.print("\n");
		System.out.print("	x1 = " + x1);
		System.out.print("\n");
		System.out.print("	y1 = " + y1);
		System.out.print("\n");
		System.out.print("	x2 = " + x2);
		System.out.print("\n");
		System.out.print("	y2 = " + y2);
		System.out.print("\n");
		System.out.print("	couleur = " + c);
		System.out.print("\n");
		System.out.print("}");
	}

	@Override
	public void dessinerPoint(double x, double y, Color c) {
		System.out.print("Point {");
		System.out.print("\n");
		System.out.print("	x = " + x);
		System.out.print("\n");
		System.out.print("	y = " + y);
		System.out.print("\n");
		System.out.print("	couleur = " + c);
		System.out.print("\n");
		System.out.print("}");
	}

	@Override
	public void dessinerTexte(double x, double y, String texte, Color c) {
		System.out.print("Texte {");
		System.out.print("\n");
		System.out.print("	x = " + x);
		System.out.print("\n");
		System.out.print("	y = " + y);
		System.out.print("\n");
		System.out.print("	valeur = " + texte);
		System.out.print("\n");
		System.out.print("	couleur = " + c);
		System.out.print("\n");
		System.out.print("}");
	}
}
