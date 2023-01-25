import java.awt.Color;

/** Modélisation de la notion d’objet géométrique. */
public abstract class ObjetGeometrique {
	private Color couleur; // couleur de l’objet
	
	/** Construire un objet géométrique.
	* @param c la couleur de l’objet géométrique */
	public ObjetGeometrique(Color c) {
		this.couleur = c;
	}

	 /** Obtenir la couleur de cet objet.
	 * @return la couleur de cet objet */
	 public Color getCouleur() {
		 return this.couleur;
	 }

	 /** Changer la couleur de cet objet.
	 * @param c nouvelle couleur */
	 public void setCouleur(Color c) {
		 this.couleur = c;
	 }

	 /** Afficher sur le terminal les caractéristiques de l’objet. */
	 abstract public void afficher();

	 /** Translater l’objet géométrique.
	 * @param dx déplacement en X
	 * @param dy déplacement en Y */
	 abstract public void translater(double dx, double dy);
	 
	 /** Dessiner l'objet géométrique sur l'afficheur.
	 * @param afficheur l'afficheur à utiliser
	 */
	 abstract public void dessiner(afficheur.Afficheur afficheur);
}
