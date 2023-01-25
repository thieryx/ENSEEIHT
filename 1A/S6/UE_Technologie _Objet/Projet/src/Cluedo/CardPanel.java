package Cluedo;

import javax.swing.JPanel;
import javax.swing.JLabel;
import javax.swing.ImageIcon;

public class CardPanel extends JPanel {
    private Joueur joueur;
    private Arbitre arbitre;
    private Carte perso; /* personnage du crime */
    private Carte arme; /* arme du crime */
    private Carte salle; /* salle du crime */

    CardPanel(Joueur nouveauJoueur, Arbitre arbitre) {
        this.joueur = nouveauJoueur;
        this.arbitre = arbitre;
        this.perso = this.arbitre.getTirage().getPerso();
        this.arme = this.arbitre.getTirage().getArme();
        this.salle = this.arbitre.getTirage().getSalle();

        JPanel panel = new JPanel();
        JLabel cartejoueur = new JLabel("Carte du joueur: ");
        JLabel imagejoueur =  new JLabel(this.joueur.getPersonnage().getImage());
        JLabel cartecrime = new JLabel("Cartes du crime: ");
        JLabel[] imagecrime = {new JLabel(this.perso.getImage()), new JLabel(this.arme.getImage()), new JLabel(this.salle.getImage())};
        panel.add(cartejoueur);
        //panel.add(imagejoueur);
        //panel.add(cartecrime);
        //panel.add(imagecrime[0]);
        //panel.add(imagecrime[1]);
        //panel.add(imagecrime[2]);

    }

    
}
