import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ControleurChat extends JPanel {

    public ControleurChat(Chat chat, String pseudo) {
        super(new FlowLayout());
        JLabel nom = new JLabel(pseudo);
        JTextField texte = new JTextField(20);
        JButton button = new JButton("Ok");
        add(nom);
        add(texte);
        add(button);
        button.addActionListener(ev -> chat.ajouter(new MessageTexte(nom.getText(), texte.getText())));
    }


}
