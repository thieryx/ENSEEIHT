// Time-stamp: <08 Apr 2008 11:35 queinnec@enseeiht.fr>

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux lecteurs,
 * implantation: avec un moniteur. */
public class LectRed_PrioLecteur implements LectRed
{   
    // Protection des variables partagées
    private Lock moniteur;

    // Variable de condition 
    private Condition read;
    private Condition write;

    private int NbLectAttente;
    private boolean lecteur;
    private int NbRed;


    public LectRed_PrioLecteur()
    {
        this.moniteur = new ReentrantLock();
        this.read = this.moniteur.newCondition();
        this.write = this.moniteur.newCondition();
        this.lecteur = false;
        this.NbRed = 0;
        this.NbLectAttente = 0;
    }

    public void demanderLecture() throws InterruptedException
    {
        this.moniteur.lock();
        this.NbLectAttente++;
        while (this.lecteur || this.NbRed > 0) {
            this.read.await();
        }
        this.lecteur = true;
        this.NbLectAttente--;
        this.moniteur.unlock();
    }

    public void terminerLecture() throws InterruptedException
    {
        this.moniteur.lock();
        this.lecteur = false;
        if (this.NbLectAttente > 0) {
            this.read.signal();
        } else {
          this.read.signal();
        }
        this.moniteur.unlock();
    }

    public void demanderEcriture() throws InterruptedException
    {
        this.moniteur.lock();
        while(this.lecteur || this.NbLectAttente > 0) {
            this.write.await();
        }
        this.NbRed++;
        this.moniteur.unlock();
    }

    public void terminerEcriture() throws InterruptedException
    {
        this.moniteur.lock();
        this.NbRed--;
        if(this.NbRed==0) {
            this.read.signal();
        }
        this.moniteur.unlock();
    }

    public String nomStrategie()
    {
        return "Stratégie: Priorité Rédacteurs.";
    }
}
