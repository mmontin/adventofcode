package advent2024

import java.math.BigInteger
import java.util.List

class Day17 {

	static final int A = 28422061
	static final List<Integer> program = newArrayList(2, 4, 1, 1, 7, 5, 1, 5, 4, 2, 5, 5, 0, 3, 3, 0)
	static final List<String> string_values = #["000", "001", "010", "011", "100", "101", "110", "111"]

	def static void main(String[] args) {

		println(BigInteger.valueOf(A).unfold_my_program)

		println(program.reverse.fold(newHashSet("")) [ acc, el |
			val ans = newHashSet
			for (el_set : acc)
				for (string_value : string_values) {
					val current_candidate = el_set + string_value
					if (new BigInteger(current_candidate, 2).my_program.equals(BigInteger.valueOf(el)))
						ans.add(current_candidate)
				}
			ans
		].map[new BigInteger(it,2)].min)
	}

	def static unfold_my_program(BigInteger a) {
		var my_a = a
		val list = newArrayList
		while (!my_a.equals(BigInteger.ZERO)) {
			list.add(my_program(my_a))
			my_a = my_a.shiftRight(3)
		}
		list.join(",")
	}

	def static my_program(BigInteger a) {
		var reg_a = a
		var reg_b = BigInteger.valueOf(0)
		var reg_c = BigInteger.valueOf(0)
		reg_b = (reg_a.mod(BigInteger.valueOf(8))).xor(BigInteger.valueOf(1))
		reg_c = reg_a.shiftRight(reg_b.intValue)
		reg_b = reg_b.xor(BigInteger.valueOf(5)).xor(reg_c)
		reg_b.mod(BigInteger.valueOf(8))
	}
}
