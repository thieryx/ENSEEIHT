import java.awt.Container;
import java.awt.GridLayout;
import javax.swing.JFrame;
import java.awt.BorderLayout;

public class ChatSwing {
    private JFrame fenetre;
    private Chat chat;

    public ChatSwing(Chat chat, String nom) {
        this.fenetre = new JFrame ("Chat");
        this.fenetre.setLocation(100,200);
        this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        Container contenu = this.fenetre.getContentPane();
        contenu.setLayout(new BorderLayout());
        
        VueChat vchat = new VueChat();
        ControleurChat controlchat = new ControleurChat(chat, nom);

        contenu.add(BorderLayout.SOUTH, controlchat);
        contenu.add(BorderLayout.CENTER, vchat);

        this.fenetre.pack();			// redimmensionner la fenêtre
		this.fenetre.setVisible(true);
    }   
}
