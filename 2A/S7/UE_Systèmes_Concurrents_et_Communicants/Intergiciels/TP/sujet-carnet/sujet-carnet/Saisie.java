/* ------------------------------------------------------- 
		Les packages Java qui doivent etre importes.
*/
import java.lang.*;
import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.rmi.*;
import javax.swing.*;
import java.rmi.registry.*;


/* ------------------------------------------------------- 
		Implementation de l'application
*/

public class Saisie extends JApplet {
	private static final long serialVersionUID = 1;
	TextField nom, email;
	Choice carnets;
	Label message;
	public void init() {
		setSize(300,200);
		setLayout(new GridLayout(6,2));
		add(new Label("  Nom : "));
		nom = new TextField(30);
		add(nom);
		add(new Label("  Email : "));
		email = new TextField(30);
		add(email);
		add(new Label("  Carnet : "));
		carnets = new Choice();
		carnets.addItem("Carnet1");
		carnets.addItem("Carnet2");
		add(carnets);
		add(new Label(""));
		add(new Label(""));
		Button Abutton = new Button("Ajouter");
		Abutton.addActionListener(new AButtonAction());
		add(Abutton);
		Button Cbutton = new Button("Consulter");
		Cbutton.addActionListener(new CButtonAction());
		add(Cbutton);
		message = new Label();
		add(message);
	}

	// La reaction au bouton Consulter
	class CButtonAction implements ActionListener {
		public void actionPerformed(ActionEvent ae) {
			String n, c;
			n = nom.getText();
			c = carnets.getSelectedItem();
			message.setText("Consulter("+n+","+c+")        ");
			// DO IT
			try {
				Carnet carnet = (Carnet) Naming.lookup("//localhost:1234/carnet");
				String email_bis = carnet.Consulter(n, true).getEmail();

				if (email_bis != null) {
					email.setText(email_bis);
				} else {
					System.out.println("Email non trouvé");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	// La reaction au bouton Ajouter
	class AButtonAction implements ActionListener {
		public void actionPerformed(ActionEvent ae) {
			String n, e, c;
			n = nom.getText();
			e = email.getText();
			c = carnets.getSelectedItem();
			message.setText("Ajouter("+n+","+e+","+c+")        ");
			// DO IT
			try {
				Carnet carnet = (Carnet) Naming.lookup("//localhost:1234/carnet");
				carnet.Ajouter(new SFicheImpl(n,e));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}
	
	public static void main(String args[]) {
		Saisie a = new Saisie();
		a.init();
		a.start();
		JFrame frame = new JFrame("Applet");
		frame.setSize(400,200);
  	frame.getContentPane().add(a);
  	frame.setVisible(true);
	}
	
}


