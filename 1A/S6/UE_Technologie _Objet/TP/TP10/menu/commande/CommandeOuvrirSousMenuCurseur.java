package menu.commande;

import menu.Commande;
import menu.Menu;

public class CommandeOuvrirSousMenuCurseur implements Commande {

public Menu menu;

public CommandeOuvrirSousMenuCurseur (Menu menu) {
	this.menu.afficher();
	this.menu.selectionner();
	this.menu.valider();
}

@Override
public void executer() {
	this.menu.afficher();
	this.menu.selectionner();
	this.menu.valider();	
}

@Override
public boolean estExecutable() {
	return true;
}

}
