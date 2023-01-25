/**
  * AfficheurPostfixeTest :
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class AfficheurPostfixeTest extends ExpressionTestSetup {


	private void verifier(String valeurAttendue, Expression e) {
		AfficheurPostfixe affPostfixe = new AfficheurPostfixe();
		assertEquals(valeurAttendue, e.accepter(affPostfixe));
	}

	public void testerConstante() {
		verifier("10", cte);
	}

	public void testerAccesVariable1() {
		verifier("x", av);
	}

	public void testerE1() {
		verifier("2 x +", e1);
	}

	public void testerE2() {
		verifier("2 x + 3 *", e2);
	}

	public void testerE3() {
		verifier("7 2 x + *", e3);
	}

	public void testerE4() {
		verifier("x y + z +", e4);
	}

	public void testerE5() {
		verifier("x y z + +", e5);
	}

	public void testerE6() {
		verifier("2 x + ~ ~", e6);
	}

	public void testerL1() {
		verifier("10 x ni x x * tel", l1);
	}

	public void testerL2() {
		verifier("2 x + 3 * a ni "
				+ "2 x + ~ ~ b ni a b + tel tel", l2);
	}

	public void testerL3() {
		verifier("2 10 x ni x x * tel * c ni "
				+ "2 x + 3 * a ni "
				+ "2 x + ~ ~ b ni a b + tel tel c + tel", l3);
	}

	public static void main(String[] args) {
		junit.textui.TestRunner.run(
				new junit.framework.TestSuite(AfficheurPostfixeTest.class));
	}

}
