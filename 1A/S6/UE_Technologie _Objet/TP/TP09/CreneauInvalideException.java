/**
 * CreneauInvalideException indique qu'une date n'est pas valide.
 */
public class CreneauInvalideException extends RuntimeException {
	public CreneauInvalideException () {
		super("Ce créneau est invalide.");
	}
}
