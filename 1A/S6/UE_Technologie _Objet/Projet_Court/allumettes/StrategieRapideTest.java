package allumettes;

import org.junit.*;

import static org.junit.Assert.*;

public class StrategieRapideTest {

    private static final int NbAllumettesInit = 13;
    private Joueur joueur;
    private Jeu jeu;

    @Before
    public void setUp() {
    	joueur = new Joueur("Rapido", new StrategieRapide());
    }

    @Test
    public void Test1() throws CoupInvalideException {
    	int Nb_Allumettes = 0;
        jeu = new JeuSimple(NbAllumettesInit);
    	assertTrue(jeu.getNombreAllumettes() == 13);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 10);

    	jeu.retirer(1);
    	assertTrue(jeu.getNombreAllumettes() == 9);

    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 6);
    	
    	jeu.retirer(1);
    	assertTrue(jeu.getNombreAllumettes() == 5);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 2);
    	
    	jeu.retirer(1);
    	assertTrue(jeu.getNombreAllumettes() == 1);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == 1);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 0);
    	
    	System.out.println("Tous les tests de Test1 sont passés");
    }

    @Test
    public void Test2() throws CoupInvalideException {
    	int Nb_Allumettes = 0;
        jeu = new JeuSimple(NbAllumettesInit);
    	assertTrue(jeu.getNombreAllumettes() == 13);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 10);

    	jeu.retirer(2);
    	assertTrue(jeu.getNombreAllumettes() == 8);

    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 5);
    	
    	jeu.retirer(3);
    	assertTrue(jeu.getNombreAllumettes() == 2);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == 2);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 0);

    	System.out.println("Tous les tests de Test2 sont passés");
    }

    @Test
    public void Test3() throws CoupInvalideException {
    	int Nb_Allumettes = 0;
        jeu = new JeuSimple(NbAllumettesInit);
    	assertTrue(jeu.getNombreAllumettes() == 13);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 10);

    	jeu.retirer(3);
    	assertTrue(jeu.getNombreAllumettes() == 7);

    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == Jeu.PRISE_MAX);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 4);
    	
    	jeu.retirer(1);
    	assertTrue(jeu.getNombreAllumettes() == 3);
    	
    	Nb_Allumettes = joueur.getPrise(jeu);
    	assertTrue(Nb_Allumettes == 3);
    	jeu.retirer(Nb_Allumettes);
    	assertTrue(jeu.getNombreAllumettes() == 0);

    	System.out.println("Tous les tests de Test3 sont passés");
    }
    public static void main(String[] args) {
        org.junit.runner.JUnitCore.main(StrategieRapideTest.class.getName());
    }

}
