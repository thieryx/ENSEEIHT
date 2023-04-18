using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

//////////////////////////////////////////////////////////////////////////
///////////////// Classe qui gère la subdivision via DCJ /////////////////
//////////////////////////////////////////////////////////////////////////
public class DeCasteljauSubdivision : MonoBehaviour
{
    // Pas d'échantillonage pour affichage
    public float pas = 1 / 100;
    // Nombre de subdivision dans l'algo de DCJ
    public int NombreDeSubdivision = 3;
    // Liste des points composant la courbe
    private List<Vector3> ListePoints = new List<Vector3>();
    // Donnees i.e. points cliqués
    public GameObject Donnees;
    // Coordonnees des points composant le polygone de controle
    private List<float> PolygoneControleX = new List<float>();
    private List<float> PolygoneControleY = new List<float>();

    //////////////////////////////////////////////////////////////////////////
    // fonction : DeCasteljauSub                                            //
    // semantique : renvoie la liste des points composant la courbe         //
    //              approximante selon un nombre de subdivision données     //
    // params : - List<float> X : abscisses des point de controle           //
    //          - List<float> Y : odronnees des point de controle           //
    //          - int nombreDeSubdivision : nombre de subdivision           //
    // sortie :                                                             //
    //          - (List<float>, List<float>) : liste des abscisses et liste //
    //            des ordonnées des points composant la courbe              //
    //////////////////////////////////////////////////////////////////////////
    /*
    (List<float>, List<float>) DeCasteljauSub(List<float> X, List<float> Y, int nombreDeSubdivision)
    {
        List<float> XSortie = new List<float>();
        List<float> YSortie = new List<float>();
        
        List<float> R_X = new List<float>();
        List<float> R_Y = new List<float>();

        List<float> Q_X = new List<float>();
        List<float> Q_Y = new List<float>();

        List<float> Px = new List<float>();
        List<float> Py = new List<float>();
        
        float t = 0.5f;

        Q_X.Add(X[0]);
        Q_X.Add(Y[0]);
        R_X.Add(X.Last());
        R_Y.Add(Y.Last());

        for (int j=0; j<n-1; j++)
        {
            Px.Add((1-t)*X[j]+t*X[j+1]);
            Py.Add((1-t)*Y[j]+t*Y[j+1]);
        }

        if (nombreDeSubdivision == 1) {
            return (XSortie, YSortie);
        } else {
            (XSubdivision, YSubdivision) = DeCasteljauSub(Q_X,Q_Y, nombreDeSubdivision-1)
            (XSubdivision, YSubdivision) = DeCasteljauSub(R_X,R_Y, nombreDeSubdivision-1)
        }
    }
    */

    (List<float>, List<float>) DeCasteljauSub(List<float> X, List<float> Y, int nombreDeSubdivision)
    {
        List<float> XSortie = new List<float>();
        List<float> YSortie = new List<float>();

        List<float> Q_X = new List<float>();
        List<float> Q_Y = new List<float>();
        List<float> R_X = new List<float>();
        List<float> R_Y = new List<float>();

        // Copie des listes
        List<float> X_tmp = new List<float>(XSortie);
        List<float> Y_tmp = new List<float>(YSortie);

        float t = 0.5f;

        Q_X.Add(X[0]);
        Q_Y.Add(Y[0]);
        R_X.Add(X[X.Count - 1]);
        R_Y.Add(Y[Y.Count - 1]);

        for (int j = 0; j < X.Count ; j++)
        {
            X_tmp[j] = (1-t) * X_tmp[j] + t * X_tmp[j + 1];
            Y_tmp[j] = (1-t) * Y_tmp[j] + t * Y_tmp[j + 1];

        }
        Q_X.Add(X_tmp[0]);
        Q_Y.Add(Y_tmp[0]);
        R_X.Add(X[X.Count - 2]);
        R_Y.Add(Y[Y.Count - 2]);

        if (nombreDeSubdivision != 1)
        {
            (Q_XSubdivision, Q_YSubdivision) = DeCasteljauSub(Xg, Yg, nombreDeSubdivision - 1);
            (R_XSubdivision, R_YSubdivision) = DeCasteljauSub(Xd, Yd, nombreDeSubdivision - 1);

        }
        else
        {
            XSortie.AddRange(Xg);
            XSortie.AddRange(Xd);
            YSortie.AddRange(Yg);
            YSortie.AddRange(Yd);
        }
        return (XSortie, YSortie);

    }

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////// NE PAS TOUCHER //////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    void Start()
    {

    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Return))
        {
            var ListePointsCliques = GameObject.Find("Donnees").GetComponent<Points>();
            if (ListePointsCliques.X.Count > 0)
            {
                for (int i = 0; i < ListePointsCliques.X.Count; ++i)
                {
                    PolygoneControleX.Add(ListePointsCliques.X[i]);
                    PolygoneControleY.Add(ListePointsCliques.Y[i]);
                }
                List<float> XSubdivision = new List<float>();
                List<float> YSubdivision = new List<float>();

                (XSubdivision, YSubdivision) = DeCasteljauSub(ListePointsCliques.X, ListePointsCliques.Y, NombreDeSubdivision);
                for (int i = 0; i < XSubdivision.Count; ++i)
                {
                    ListePoints.Add(new Vector3(XSubdivision[i], -4.0f, YSubdivision[i]));
                }
            }

        }
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        for (int i = 0; i < PolygoneControleX.Count - 1; ++i)
        {
            Gizmos.DrawLine(new Vector3(PolygoneControleX[i], -4.0f, PolygoneControleY[i]), new Vector3(PolygoneControleX[i + 1], -4.0f, PolygoneControleY[i + 1]));
        }

        Gizmos.color = Color.blue;
        for (int i = 0; i < ListePoints.Count - 1; ++i)
        {
            Gizmos.DrawLine(ListePoints[i], ListePoints[i + 1]);
        }
    }
}
