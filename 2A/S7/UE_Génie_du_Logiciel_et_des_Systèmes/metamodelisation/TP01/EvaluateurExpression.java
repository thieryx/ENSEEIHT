import java.util.HashMap;

/** Afficheur infixe, complètement parenthésé, d'une expression arithmétique.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
  public class EvaluateurExpression implements VisiteurExpression<Integer> {

    private HashMap<String,Integer> map;
    private Integer droite, gauche;

    public EvaluateurExpression(HashMap<String,Integer> environnement) {
      this.map = environnement;
    }
    public Integer visiterAccesVariable(AccesVariable v) {
      return this.map.get(v.getNom());
    }
  
    public Integer visiterConstante(Constante c) {
      return c.getValeur();
    }
  
    public Integer visiterExpressionBinaire(ExpressionBinaire e) {
      gauche = e.getOperandeGauche().accepter(this);
      droite = e.getOperandeDroite().accepter(this);
      return e.getOperateur().accepter(this);
    }
  
    public Integer visiterAddition(Addition a) {
      return gauche + droite;
    }
  
    public Integer visiterMultiplication(Multiplication m) {
      return gauche*droite;
    }
  
    public Integer visiterExpressionUnaire(ExpressionUnaire e) {
      gauche = e.getOperande().accepter(this);
      return e.getOperateur().accepter(this);
    }
  
    public Integer visiterNegation(Negation n) {
      return -gauche;
    }
  
    public Integer visiterSoustraction(Soustraction a) {
      return gauche-droite;
    }
  }
  
  
