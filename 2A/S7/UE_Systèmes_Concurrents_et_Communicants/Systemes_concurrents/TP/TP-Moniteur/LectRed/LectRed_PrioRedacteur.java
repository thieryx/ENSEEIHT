// Time-stamp: <08 Apr 2008 11:35 queinnec@enseeiht.fr>

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux rédacteurs,
 * implantation: avec un moniteur. */
public class LectRed_PrioRedacteur implements LectRed
{   
    // Protection des variables partagées
    private Lock moniteur;

    // Variable de condition 
    private Condition read;
    private Condition write;

    private int NbRedAttente;
    private boolean redacteur;
    private int NbLect;


    public LectRed_PrioRedacteur()
    {
        this.moniteur = new ReentrantLock();
        this.read = this.moniteur.newCondition();
        this.write = this.moniteur.newCondition();
        this.redacteur = false;
        this.NbLect = 0;
        this.NbRedAttente = 0;
    }

    public void demanderLecture() throws InterruptedException
    {
        this.moniteur.lock();
        while (this.redacteur || this.NbRedAttente > 0) {
            this.read.await();
        }
        this.NbLect++;
        this.read.signal();
        this.moniteur.unlock();
    }

    public void terminerLecture() throws InterruptedException
    {
        this.moniteur.lock();
        this.NbLect--;
        if (this.NbLect==0) {
            this.write.signal();
        }
        this.moniteur.unlock();
    }

    public void demanderEcriture() throws InterruptedException
    {
        this.moniteur.lock();
        this.NbRedAttente++;
        while(this.redacteur || this.NbLect > 0) {
            this.write.await();
        }
        this.redacteur = true;
        this.NbRedAttente--;
        this.moniteur.unlock();
    }

    public void terminerEcriture() throws InterruptedException
    {
        this.moniteur.lock();
        this.redacteur = false;
        if(this.NbRedAttente > 0) {
            this.write.signal();
        }
        else {
            this.read.signal();
        }
        this.moniteur.unlock();
    }

    public String nomStrategie()
    {
        return "Stratégie: Priorité Rédacteurs.";
    }
}
