
public class EnsembleChaine implements Ensemble {
	protected Cellule premiere;
	
	public EnsembleChaine() {
		this.premiere = null;
	}
	
	@Override
	public int cardinal() {
		if (this.premiere == null) {
			return 0;
		} else {
			return getNombreCellule(this.premiere);
		}
	}

	private int getNombreCellule(Cellule cellule) {
		if (cellule == null ) {
			return 0;
		} else {
			return 1 + getNombreCellule(cellule.suivante);
		}
	}

	@Override
	public boolean estVide() {
		return (this.premiere == null);
	}

	@Override
	public boolean contient(int x) {
			return contient(x, this.premiere);	
	}

	private boolean contient(int x, Cellule cellule) {
		if (cellule == null) {
			return false;
		} else if (cellule.element == x) {
			return true;
		} else {
			return this.contient(x, cellule.suivante);
		}
	}

	@Override
	public void ajouter(int x) {
		if (!contient(x)) {
			this.premiere = new Cellule(x, this.premiere);
		}
	}

	@Override
	public void supprimer(int x) {
		if (contient(x)) {
			if (this.premiere.suivante.element == x) {
				this.premiere.suivante = this.premiere.suivante.suivante;
			} else {
				this.supprimer(x, this.premiere);
			}
		}
	}

	private void supprimer(int x, Cellule cellule) {
		if (cellule.suivante.element == x) {
			cellule.suivante = cellule.suivante.suivante;
		} else {
			this.supprimer(x, cellule.suivante);
		}
	}

}
