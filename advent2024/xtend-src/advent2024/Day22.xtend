package advent2024

import adventutils.input.InputLoader

class Day22 {

	def static void main(String[] args) {

		println(new InputLoader(2024, 22).inputs.fold(0L) [ acc, el |
			var current = Long.parseLong(el)
			for (i : 1 .. 2000)
				current = current.next_secret_number
			acc + current
		])
	}

	def static next_secret_number(long secret_number) {
		var res = secret_number
		res = res.bitwiseXor(res * 64L) % 16777216
		res = res.bitwiseXor(res / 32L) % 16777216
		res.bitwiseXor(res * 2048L) % 16777216
	}
}
