package Cluedo;

import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JPanel;
//import java.awt.Graphics;
//import java.awt.image.BufferedImage;
//import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
//import javax.imageio.ImageIO;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.BorderLayout;
//import java.awt.Component;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JTabbedPane;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.JScrollPane;
//import javax.swing.JTextArea;

public class GUI {
  Joueur joueur;
  BoardPanel panelcentre;
  JPanel panelgauche;
  GrilleCluedo grille;
  CardPanel cardpanel;
  Arbitre arbitre;
  Jeu jeu;

  public static void main(String[] args) throws IOException {
    Jeu jeu = new Jeu();
    Joueur[] joueurs = new Joueur[3];
    joueurs[0] = new Joueur("A", 1);
    // LE JOUEUR 1 SERA TOUJOURS LE JOUEUR HUMAIN
    joueurs[1] = new BotNaif("B", 2);
    joueurs[2] = new BotNaif("C", 3);
    Arbitre arbitre = new Arbitre(joueurs);
    GUI gui = new GUI(joueurs[0], arbitre);

  }

  public GUI(Joueur nouveauJoueur, Arbitre arbitre) throws IOException {
    this.arbitre = arbitre;
    this.jeu = this.arbitre.getJeu();
    this.joueur = nouveauJoueur;
    JFrame frame = construireFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setResizable(true);
    frame.setVisible(true);
    frame.setExtendedState(JFrame.MAXIMIZED_BOTH);


    JMenuBar menuBar = new JMenuBar();
    frame.setJMenuBar(menuBar);
    frame.getContentPane().setLayout(new BorderLayout(0, 0));
    JMenu menuJeu = new JMenu("Jeu");
    menuBar.add(menuJeu);

    JMenuItem menuNouveau = new JMenuItem("Nouvelle partie");
    JMenuItem menuQuitter = new JMenuItem("Quitter");
    menuJeu.add(menuNouveau);
    menuJeu.add(menuQuitter);
    menuQuitter.addActionListener(new ActionListener() {

      public void actionPerformed(ActionEvent e) {

        frame.dispose();
      }
    });

    // panel au centre
    BoardPanel panelcentre = new BoardPanel(new Dimension(692, 480));
    this.panelcentre = panelcentre;
    this.panelcentre.setVisible(true);
    frame.add(this.panelcentre, BorderLayout.CENTER);

    JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);

    ChangeListener changeListener = new ChangeListener() {
      public void stateChanged(ChangeEvent changeEvent) {
        JTabbedPane sourceTabbedPane = (JTabbedPane) changeEvent.getSource();
        int index = sourceTabbedPane.getSelectedIndex();
        System.out.println("Fenêtre affichée: " + sourceTabbedPane.getTitleAt(index));
      }
    };

    tabbedPane.addChangeListener(changeListener);

    // Carnet Cluedo
    GrilleCluedo nouvelleGrille = new GrilleCluedo();
    this.grille = nouvelleGrille;
    JScrollPane carnet = new JScrollPane(this.grille);
    tabbedPane.add(carnet, "Carnet");


    // Cartes
    CardPanel cardpanel = new CardPanel(this.joueur, this.arbitre);
    tabbedPane.add(cardpanel, "Cartes");
    

    add(tabbedPane, "Console");
    
    tabbedPane.setPreferredSize(new Dimension(500, 500));
    frame.add(tabbedPane, BorderLayout.EAST);

    // panel en haut à gauche
    JPanel nouveaupanelgauche = new JPanel(new GridLayout(2, 1));
    this.panelgauche = nouveaupanelgauche;
    frame.add(this.panelgauche, BorderLayout.WEST);
    this.panelgauche.setSize(250, 1000);
    JButton boutonAccusation = new JButton("Accusation");
    JButton boutonHypothese = new JButton("Hypothese");
    boutonAccusation.setBounds(750, 1000, 20, 20);
    this.panelgauche.add(boutonAccusation);
    this.panelgauche.add(boutonHypothese);
    ActionHypothese formulationHypAcc = new ActionHypothese(this.jeu);
    boutonHypothese.addActionListener(formulationHypAcc);
    boutonAccusation.addActionListener(formulationHypAcc);

  }

  public JFrame construireFrame() {
    JFrame frame = new JFrame("Plateau");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setVisible(true);
    return frame;
  }

  public void add(JTabbedPane tabbedPane, String label) {
    JButton button = new JButton(label);
    tabbedPane.addTab(label, button);
  }

  
  public void update() {
    this.cardpanel.repaint();
    this.grille.repaint();
    this.panelcentre.repaint();
    this.cardpanel.repaint();
  }
}
