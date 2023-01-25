/**
  * ExpressionTest :
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public abstract class ExpressionTestSetup extends junit.framework.TestCase {

	protected Constante cte;
	protected AccesVariable av;
	protected Expression e1, e2, e3;	// Expressions du sujet
	protected Expression e4, e5, e6;
	protected Expression l1, l2, l3;

	protected void setUp() {
		// 10
		this.cte = new Constante(10);
		// x
		this.av = new AccesVariable("x") ;

		// 2 + x
		this.e1 = new ExpressionBinaire(new Addition(),
				new Constante(2),
				av);

		// (2 + x) * 3
		this.e2	= new ExpressionBinaire(new Multiplication(),
				this.e1,
				new Constante(3));

		// 7 * (2 + x)
		this.e3 = new ExpressionBinaire(new Multiplication(),
				new Constante(7),
				this.e1) ;

		// (x + y) + z
		this.e4 = new ExpressionBinaire(new Addition(),
				new ExpressionBinaire(new Addition(),
					new AccesVariable("x"), new AccesVariable("y")),
				new AccesVariable("z"));

		// x + (y + z)
		this.e5 = new ExpressionBinaire(new Addition(),
				new AccesVariable("x"),
				new ExpressionBinaire(new Addition(),
					new AccesVariable("y"), new AccesVariable("z")));

		// - - (2 + x)
		this.e6 = new ExpressionUnaire(new Negation(),
				new ExpressionUnaire(new Negation(),
					this.e1));

		// let x = 10 in x * x
		this.l1 = new Let("x", this.cte,
				new ExpressionBinaire(new Multiplication(), this.av, this.av));

		// let a =  (2 + x) * 3 in
		//	let b = - - (2 + x) in
		//		a + b
		this.l2 = new Let("a", this.e2,
					new Let("b", this.e6,
						new ExpressionBinaire(new Addition(),
							new AccesVariable("a"),
							new AccesVariable("b"))));
		// let c = 2 * (let x = 10 in x * x ) in
		//	c + [l2]
		this.l3 = new Let("c",
				new ExpressionBinaire(new Multiplication(),
						new Constante(2), this.l1),
				new ExpressionBinaire(new Addition(),
						this.l2, new AccesVariable("c")));
	}

}

