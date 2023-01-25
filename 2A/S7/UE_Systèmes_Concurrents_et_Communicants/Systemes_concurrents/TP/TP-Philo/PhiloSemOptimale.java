// Time-stamp: <08 déc 2009 08:30 queinnec@enseeiht.fr>

import java.util.concurrent.Semaphore;

public class PhiloSemOptimale implements StrategiePhilo {

    /** Etat d'un philosophe : pense, mange, deamnde ? */
    private EtatPhilosophe[] etat;

    /** Un sémaphore par philosophe. */
    private Semaphore [] philo;

    /** Protection des vrabiales partagées. */
    private Semaphore protect;

    /****************************************************************/


    public PhiloSemOptimale (int nbPhilosophes) {
        protect = new Semaphore(1); // semaphore binaire à valeur de mutex
        etat = new EtatPhilosophe[nbPhilosophes];
        philo = new Semaphore[nbPhilosophes];
        for (int i=0; i<nbPhilosophes; i++) {
            philo[i] = new Semaphore(0);
            etat[i] = EtatPhilosophe.Pense;
        }
    }

    /* renvoie vrai le philosophe no peut manger, ie si il a demandé à manger et
     * et aucun de ses voisins ne mange
     */
    private boolean peut_manger(int no) {
        return (etat[no] == EtatPhilosophe.Demande)
            && (etat[Main.PhilosopheDroite[no]] != EtatPhilosophe.Mange)
            && (etat[Main.PhilosopheGauche[no]] != EtatPhilosophe.Mange)

    }

    /** Le philosophe no demande les fourchettes.
     *  Précondition : il n'en possède aucune.
     *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
    public void demanderFourchettes (int no) throws InterruptedException
    {
        int fg = Main.FourchetteGauche(no);
        int fd = Main.FourchetteDroite(no);

        protect.acquire();
        etat[no] = EtatPhilosophe.Demande;
        if (peut_mange(no)) {
            etat[no] = EtatPhilosophe.Mange;
            protect.release();
        } else {
            protect.release();
            philo[no].acquire();
        }
        // j'ai pris fourchette G -> affichage IHM
        IHMPhilo.poser(fg, EtatFourchette.AssietteDroite);

        // j'ai pris fourchette D -> affichage IHM
        IHMPhilo.poser(fd, EtatFourchette.AssietteGauche);


    }

    /** Le philosophe no rend les fourchettes.
     *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
     *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
    public void libererFourchettes (int no)
    {
        int fg = Main.FourchetteGauche(no);
        int fd = Main.FourchetteDroite(no);
        
        fourchette[fd].release();
        fourchette[fg].release();

        // reposer fourchettes -> affichage IHM
        IHMPhilo.poser (fg, EtatFourchette.Table);
        IHMPhilo.poser (fd, EtatFourchette.Table);
    }

    /** Nom de cette stratégie (pour la fenêtre d'affichage). */
    public String nom() {
        return "Implantation Sémaphores, stratégie ???";
    }

}

