package advent2020.puzzle13;

import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import advent2020.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {

		List<Pair> pairs = new ArrayList<Pair>() ;
		int i = 0 ;
		for (String s : Utils.getInputs(13).get(1).split(",")) {
			try {
				int v = Integer.parseInt(s) ;
				int os = v - (i % v) ;
				pairs.add(new Pair(BigInteger.valueOf(v) , BigInteger.valueOf(os))) ;
			} catch (Exception e) {
				// Nothing to do here
			} finally {
				i ++ ;
			}
		}
		
		Pair p = pairs.stream().reduce(new Pair(BigInteger.ONE , BigInteger.ZERO), Launcher::combine) ;

		System.out.println("The answer is " + p.b);
	}

	private static class Pair {

		BigInteger a;
		BigInteger b;

		public Pair(BigInteger a, BigInteger b) {
			super();
			this.a = a;
			this.b = b.mod(a);
		}

		public BigInteger evaluate(BigInteger x) {
			return a.multiply(x).add(b);
		}

		@Override
		public String toString() {
			return "[ " + a + " x + " + b + " ]";
		}
	}

	private static Pair combine(Pair p1, Pair p2) {

		boolean p1pos = p1.a.signum() >= 0;
		boolean p2pos = p2.a.signum() >= 0;

		BigInteger input1 = p1pos ? p1.a : p1.a.negate();
		BigInteger input2 = p2pos ? p2.a : p2.a.negate();

		BigInteger[] GCD = gcd(input1, input2);

		if (!p1pos)	GCD[1] = GCD[1].negate();
		if (!p2pos)	GCD[2] = GCD[2].negate();

		BigInteger toto = p1.evaluate(GCD[1].multiply(p2.b.subtract(p1.b)));

		return new Pair(p1.a.multiply(p2.a), toto);
	}

	public static BigInteger[] gcd(BigInteger p, BigInteger q) {
		if (q.equals(BigInteger.valueOf(0)))
			return new BigInteger[] { p, BigInteger.valueOf(1), BigInteger.valueOf(0) };

		BigInteger[] vals = gcd(q, p.mod(q));
		BigInteger d = vals[0];
		BigInteger a = vals[2];
		BigInteger b = vals[1].subtract(p.divide(q).multiply(vals[2]));
		return new BigInteger[] { d, a, b };
	}
}
