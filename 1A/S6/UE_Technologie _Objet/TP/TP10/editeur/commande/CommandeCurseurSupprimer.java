package editeur.commande;

import editeur.Ligne;

public class CommandeCurseurSupprimer extends CommandeLigne {

    /**
     * Initialiser la ligne sur laquelle travaille
     * cette commande.
     * 
     * @param l la ligne
     */
    // @ requires l != null; // la ligne doit être définie
    public CommandeCurseurSupprimer(Ligne l) {
        super(l);
    }

    @Override
    public void executer() {
        ligne.supprimer();
    }

    @Override
    public boolean estExecutable() {
        return ((ligne.getCurseur() <= ligne.getLongueur()) && ligne.getLongueur() != 0);
    }

}
