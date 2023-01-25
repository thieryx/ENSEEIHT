import java.awt.Color;

public class Cercle implements Mesurable2D {
	/**
	 * Déclaraion des variables.
	 */
	private double rayon;	 /** rayon du cercle. */
	private Color couleur;	 /** couleur du cercle. */
	private Point centre;	 /** centre du cercle. */
	public static final double PI = Math.PI;	// constante PI


	/** Construire un cercle à partir de son centre et de son rayon.
	 * @param centre centre du cercle
	 * @param rayon rayon du cercle
	 */
	public Cercle(Point centre, double rayon) {
		assert centre != null;
		assert rayon > 0;
		Point nouveauCentre = new Point(centre.getX(), centre.getY());
		this.centre = nouveauCentre;
		this.rayon = rayon;
		this.couleur = Color.blue;
	}

	/** Construire un cercle de couleur bleu à
	 * partir de deux points diamétralement opposés.
	 * @param point1 premier point
	 * @param point2 deuxième point
	 */
	public Cercle(Point point1, Point point2) {
		assert point1 != null;
		assert point2 != null;
		assert (point1.getX() != point2.getX()) || (point1.getY() != point2.getY());
		double dx = (point2.getX() + point1.getX()) / 2;
		double dy = (point2.getY() + point1.getY()) / 2;
		this.centre = new Point(dx, dy);
		this.rayon = point2.distance(point1) / 2;
		this.couleur = Color.blue;
	}

	/** Construire un cercle de couleur choisi
	 *  	à partir de deux points diamétralement opposés.
	 * @param point1 premier point
	 * @param point2 deuxième point
	 * @param nouvelleCouleur couleur du cercle
	 */
	public Cercle(Point point1, Point point2, Color nouvelleCouleur) {
		this(point1, point2);
		assert nouvelleCouleur != null;
		this.couleur = nouvelleCouleur;
	}

	/** Construire un cercle à partir de deux points, le premier correspond
	 * au centre du cercle et le deuxième est un point du cercle.
	 * @param point1 premier point
	 * @param point2 deuxième point
	 * @return cercle crée à partir de ces points
	 */
	public static Cercle creerCercle(Point point1, Point point2) {
		assert point1 != null;
		assert point2 != null;
		return new Cercle(point1, point1.distance(point2));
	}

	/** Translater le cercle.
	 * @param dx déplacement suivant l'axe des X
	 * @param dy déplacement suivant l'axe des Y
	*/
	public void translater(double dx, double dy) {
		assert this != null;
		assert dx != 0;
		assert dy != 0;
		this.centre.translater(dx, dy);
	}

	/** Obtenir le centre du cercle.
	 * @return centre du cercle
	 */
	public Point getCentre() {
		assert this != null;
		Point nouveauCentre = new Point(this.centre.getX(), this.centre.getY());
		return nouveauCentre;
	}

	/** Obtenir le rayon du cercle.
	 * @return rayon du cercle
	 */
	public double getRayon() {
		assert this != null;
		return this.rayon;
	}

	/** Obtenir le diamètre du cercle.
	 * @return diamètre du cercle
	 */
	public double getDiametre() {
		assert this != null;
		return 2 * this.getRayon();
	}
	/** Vérifier si un point est à l'intérieur du cercle.
	 * @param autre point vérifié
	 * @return vrai ou faux
	 */
	public boolean contient(Point autre) {
		assert this != null;
		assert autre != null;
		return autre.distance(centre) <= this.rayon;
	}

	/** Obtenir l'aire du cercle.
	 * @return aire du cercle
	 */
	public double aire() {
		assert this != null;
		return PI * Math.pow(this.getRayon(), 2);
	}

	/** Obtenir le périmètre du cercle.
	 * @return périmètre du cercle
	 */
	public double perimetre() {
		assert this != null;
		return PI * getDiametre();
	}

	/** Obtenir la couleur du cercle.
	 * @return couleur du cercle
	 */
	public Color getCouleur() {
		assert this != null;
		Color nouveauCouleur = this.couleur;
		return nouveauCouleur;
	}

	/** Changer la couleur du cercle.
	  * @param nouvelleCouleur nouvelle couleur du cercle
	  */
	public void setCouleur(Color nouvelleCouleur) {
		assert this != null;
		assert nouvelleCouleur != null;
		this.couleur = nouvelleCouleur;
	}

	/** Afficher le cercle.
	 * @return affichage du cercle
	 */
	public String toString() {
		assert this != null;
		return ("C" + this.getRayon() + "@" + this.centre.toString());
	}

	/** Changer le rayon du cercle.
	  * @param nouveauRayon nouveau rayon du cercle
	  */
	public void setRayon(double nouveauRayon) {
		assert this != null;
		assert nouveauRayon > 0;
		this.rayon = nouveauRayon;
	}

	/** Changer le diamètre du cercle.
	  * @param nouveauDiametre nouveau diamètre du cercle
	  */
	public void setDiametre(double nouveauDiametre) {
		assert this != null;
		assert nouveauDiametre > 0;
		this.setRayon(nouveauDiametre / 2);
	}
}
