
public class Cellule {
	int element;
	Cellule suivante;
	
	public Cellule(int e, Cellule s) {
		this.element = e;
		this.suivante = s;
	}

	public String toString() {
		return ("[" + this.element + "]--" + (this.suivante == null?"E":">" + this.suivante));
	}

}
