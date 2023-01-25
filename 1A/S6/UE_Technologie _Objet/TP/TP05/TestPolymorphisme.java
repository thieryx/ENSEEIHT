/** Tester le polymorphisme (principe de substitution) et la liaison
 * dynamique.
 * @author	Xavier Crégut
 * @version	1.5
 */
public class TestPolymorphisme {

	/** Méthode principale */
	public static void main(String[] args) {
		// Créer et afficher un point p1
		Point p1 = new Point(3, 4);	// Est-ce autorisé ? Pourquoi ?
		// Autorisé car poignée sur un type apparent Point qui possède un type réel Point.
		p1.translater(10,10);		// Quel est le translater exécuté ?
		// Il s'agit du translater de Point qui est exécuté.
		System.out.print("p1 = "); p1.afficher (); System.out.println ();
										// Qu'est ce qui est affiché ?
		// Il est affiché "p1 = (13.0, 14.0)".

		// Créer et afficher un point nommé pn1
		PointNomme pn1 = new PointNomme (30, 40, "PN1");
										// Est-ce autorisé ? Pourquoi ?
		// Autorisé car poignée de type apparent PointNomme et qui possède un même type réel.
		pn1.translater (10,10);		// Quel est le translater exécuté ?
		// PointNomme est un sous-type de Point. Il s'agit du translater de la classe Point qui est utilisé.
		System.out.print ("pn1 = "); pn1.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		// Il est affiché "pn1 = PN1:(40.0, 50.0)"

		// Définir une poignée sur un point
		Point q;

		// Attacher un point à q et l'afficher
		q = p1;				// Est-ce autorisé ? Pourquoi ?
		// q et p1 ont même types. L'instruction est donc autorisé.
		System.out.println ("> q = p1;");
		System.out.print ("q = "); q.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		// Il est affiché "> q = p1;
		//                q = (13.0, 14.0)"

		// Attacher un point nommé à q et l'afficher
		q = pn1;			// Est-ce autorisé ? Pourquoi ?
		// PointNomme est un sous-type de Point (Un point nommé est un point). L'instruction est donc autorisée.
		System.out.println ("> q = pn1;");
		System.out.print ("q = "); q.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		// Il est affiché "> q = pn1;
		//		  		   q = PN1:(40.0, 50.0)"

		// Définir une poignée sur un point nommé
		PointNomme qn;

		// Attacher un point à q et l'afficher
		// qn = p1;			// Est-ce autorisé ? Pourquoi ?
		// L'instruction n'est pas autorisée.
		// En effet, un Point n'est pas un sous-type de PointNomme (Un Point n'est pas forcément un PointNomme).
		// C'est à cause de la liaison dynamique.
		// System.out.println ("> qn = p1;");
		// System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		// Il est affiche "> qn = p1;" puis les instructions à la ligne 58 entrainent une erreur.
		
		// Attacher un point nommé à qn et l'afficher
		qn = pn1;			// Est-ce autorisé ? Pourquoi ?
		// L'instruction est autorisée étant donné que qn et pn1 sont de même type.
		System.out.println ("> qn = pn1;");
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		// Il est affiché "> qn = pn1;
		//				   qn = PN1:(40.0, 50.0)"

		double d1 = p1.distance (pn1);	// Est-ce autorisé ? Pourquoi ?
		// C'est autorisé, étant donné que pn1 est de type PointNomme, donc un sous-type de Point et grâce à la surchage.
		System.out.println ("distance = " + d1);

		double d2 = pn1.distance (p1);	// Est-ce autorisé ? Pourquoi ?
		// C'est autorisé.
		System.out.println ("distance = " + d2);

		double d3 = pn1.distance (pn1);	// Est-ce autorisé ? Pourquoi ?
		// C'est autorisé étant donné que PointNomme est un sous-type de Point.
		System.out.println ("distance = " + d3);

		System.out.println ("> qn = q;");
		// qn = q;				// Est-ce autorisé ? Pourquoi ?
		// Ce n'est pas autorisé car le type de q n'est pas un sous-type de celui de  qn.
		// System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?

		System.out.println ("> qn = (PointNomme) q;");
		qn = (PointNomme) q;		// Est-ce autorisé ? Pourquoi ?
		// Cela est autorisé. Le type apparent de q est PointNomme.
		System.out.print ("qn = "); qn.afficher(); System.out.println ();

		// System.out.println ("> qn = (PointNomme) p1;");
		// qn = (PointNomme) p1;		// Est-ce autorisé ? Pourquoi ?
		// Cela n'est pas autorisé. p1 est un Point et non un PointNomme. De plus, p1 possède un type apparent et réel Point.
		// C'est donc à cause de la liaison dynamique.

		System.out.print ("qn = "); qn.afficher(); System.out.println ();
	}

}
