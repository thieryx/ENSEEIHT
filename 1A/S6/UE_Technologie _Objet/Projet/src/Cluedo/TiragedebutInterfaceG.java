package Cluedo;

import java.awt.event.ActionEvent;
import java.io.IOException;

import javax.sound.sampled.Clip;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;


public class TiragedebutInterfaceG {
    private final JFrame fenetre;
    private Clip clip;
    private Joueur joueur;
    private Arbitre arbitre;

    public TiragedebutInterfaceG(Joueur nouveauJoueur, Arbitre arbitre, Clip clip) {
        this.joueur = nouveauJoueur;
        this.clip = clip;
        this.arbitre = arbitre;
        this.fenetre = new JFrame("Tirage des cartes du crime");
        fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		fenetre.setSize(500, 670);
		fenetre.setResizable(true);
		fenetre.setLocationRelativeTo(null);
		//Image de fond
		this.fenetre.setContentPane(new JLabel(new ImageIcon("Ressources/Image/tiragecrime.png")));
        
        //Bouton tirer
		JButton bTirer = new JButton("");
		bTirer.setIcon(new ImageIcon("Ressources/Image/tiragecarte.png"));
		bTirer.setBounds(75, 500, 324, 59);
		bTirer.addActionListener((e) -> {
            try {
                tirerListener(e);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        });
		this.fenetre.add(bTirer);

       
        //Afficher la fenetre 
		this.fenetre.setVisible(true);

    }

    private void tirerListener(ActionEvent e) throws IOException {
            this.fenetre.dispose();
            DemarerInterfaceG demarer = new DemarerInterfaceG(this.joueur, this.arbitre, clip);
    }


}
