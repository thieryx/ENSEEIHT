package Cluedo;

import java.io.IOException;

/**
 * Lance une partie de cluedo
 * 
 * @author Agathe Perrin
 * @author Antoine Dalle fratte
 * @author Antonin Litschgy
 * @author Maëlis Marchand
 * @author Mickaël Song
 * @author Thierry Xu
 * @author Tom Bonetto
 * @version $Revision : 1.3 $
 */
public class Jouer {

    public static void main(String[] args) throws IOException {

        /* Pour simplifier, on joue avec 3 joueurs : un humain et 2 bots naïfs */
        Joueur[] joueurs = new Joueur[3];
        joueurs[0] = new Joueur("A", 1);
        // LE JOUEUR 1 SERA TOUJOURS LE JOUEUR HUMAIN
        joueurs[1] = new BotNaif("B", 2);
        joueurs[2] = new BotNaif("C", 3);

        Arbitre arbitre = new Arbitre(joueurs);

        if (arbitre.getJeu().getGUI() == null) {
            System.out.println("ouiclear");
        }
        arbitre.arbitrer(joueurs[0], arbitre);
        if (arbitre.getJeu().getGUI() != null) {
            System.out.println("ouiclear1");
        }
    }
}
