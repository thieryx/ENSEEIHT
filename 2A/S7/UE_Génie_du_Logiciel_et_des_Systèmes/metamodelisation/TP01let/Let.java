/** Définition de variables locales sous la forme :
  * <CODE>
  * let ident = valeur in expression
  * </CODE>
  * où ident est une chaîne de caractère et valeur et expression sont deux
  * expressions.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class Let implements Expression {
	private String ident;
	private Expression valeur;
	private Expression expression;

	public Let(String ident, Expression valeur, Expression expression) {
		this.ident = ident;
		this.valeur = valeur;
		this.expression = expression;
	}

	public String getIdent() {
		return this.ident;
	}

	public Expression getValeur() {
		return this.valeur;
	}

	public Expression getExpression() {
		return this.expression;
	}

	public <R> R accepter(VisiteurExpression<R> visiteur) {
		return visiteur.visiterLet(this);
	}

}
