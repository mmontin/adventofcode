package adventutils.maths

import java.util.ArrayList

class GaussianElim {

	def static solve(ArrayList<ArrayList<Rational>> coeffs, ArrayList<Rational> b) {
		val n = b.length

		for (p : 0 ..< n) {
			var max = (p ..< n).maxBy[coeffs.get(it).get(p).abs]

			val temp = coeffs.get(p)
			coeffs.set(p, coeffs.get(max))
			coeffs.set(max, temp)

			val t = b.get(p)
			b.set(p, b.get(max))
			b.set(max, t)

			val p_line = coeffs.get(p)
			val pivot = p_line.get(p)
			val res = b.get(p)

			if (pivot == Rational.ZERO)
				throw new NumberFormatException

			for (i : p + 1 ..< n) {
				val line = coeffs.get(i)
				val alpha = line.get(p) / pivot

				b.set(i, b.get(i) - alpha * res)
				for (j : p ..< n)
					line.set(j, line.get(j) - alpha * p_line.get(j))
			}
		}
		val x = newArrayList;
		(0 ..< n).forEach[x.add(Rational.ZERO)]

		for (i : n - 1 .. 0) {
			val i_line = coeffs.get(i)
			var sum = (i + 1 ..< n).fold(Rational.ZERO) [ acc, j |
				acc + i_line.get(j) * x.get(j)
			]
			x.set(i, (b.get(i) - sum) / i_line.get(i))
		}

		x
	}
}
