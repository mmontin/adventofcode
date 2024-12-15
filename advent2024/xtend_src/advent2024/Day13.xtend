package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.maths.GaussianElim
import adventutils.maths.Rational
import java.math.BigInteger
import java.util.List
import java.util.Optional

class Day13 {
	def static void main(String[] args) {
		val input = new InputLoader(2024, 13).inputs

		val machines = newArrayList
		for (var i = 0; i < input.size; i += 4)
			machines.add(new Machine(input.subList(i, i + 3)))

		println(machines.fold(BigInteger.ZERO -> BigInteger.ZERO) [ acc, el |

			val solve1 = el.solve(false)
			val solve2 = el.solve(true)

			val newKey = acc.key.add(solve1.isEmpty
					? BigInteger.ZERO
					: {
					val res = solve1.get
					res.key.multiply(BigInteger.valueOf(3)).add(res.value)
				})
				
			val newValue = acc.value.add(solve2.isEmpty
					? BigInteger.ZERO
					: {
						val res = solve2.get
						res.key.multiply(BigInteger.valueOf(3)).add(res.value)
					})
					
			newKey -> newValue
		])
	}

	static class Machine {
		Coordinate x_button
		Coordinate y_button
		Coordinate price

		new(List<String> input) {
			val split1 = input.get(0).split("(Button A: X\\+)|(, Y\\+)").map[Integer.parseInt(it)]
			x_button = new Coordinate(split1.get(1), split1.get(2))
			val split2 = input.get(1).split("(Button B: X\\+)|(, Y\\+)").map[Integer.parseInt(it)]
			y_button = new Coordinate(split2.get(1), split2.get(2))
			val split3 = input.get(2).split("(Prize: X=)|(, Y=)").map[Integer.parseInt(it)]
			price = new Coordinate(split3.get(1), split3.get(2))
		}

		def Optional<Pair<BigInteger, BigInteger>> solve(boolean q2) {
			try {
				val res = GaussianElim.solve(newArrayList(
					newArrayList(new Rational(x_button.x), new Rational(y_button.x)),
					newArrayList(new Rational(x_button.y), new Rational(y_button.y))
				), newArrayList(
					new Rational(
						BigInteger.valueOf(price.x).add(q2 ? BigInteger.valueOf(10000000000000L) : BigInteger.ZERO)),
					new Rational(
						BigInteger.valueOf(price.y).add(q2 ? BigInteger.valueOf(10000000000000L) : BigInteger.ZERO)
					)
				))
				Optional.of(res.get(0).toBigInteger -> res.get(1).toBigInteger)
			} catch (ArithmeticException _) {
				Optional.empty
			}
		}
	}
}
