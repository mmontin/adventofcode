package advent2019

class Day4 {

	static final int MIN = 197487
	static final int MAX = 673251

	def static void main(String[] args) {

		var nb1 = 0
		var nb2 = 0

		for (i : 1 .. 9) {
			for (j : i .. 9) {
				for (k : j .. 9) {
					for (l : k .. 9) {
						for (m : l .. 9) {
							for (n : m .. 9) {
								val x = n + m * 10 + l * 100 + k * 1000 + j * 10000 + i * 100000
								if (x >= MIN && x <= MAX) {
									if (i == j || j == k || k == l || l == m || m == n)
										nb1++
									if ((i == j && j != k) || (j == k && i != j && k != l) ||
										(k == l && j != k && l != m) || (l == m && k != l && m != n) ||
										(m == n && l != m))
										nb2++
								}
							}
						}
					}
				}
			}
		}

		println(nb1)
		println(nb2)
	}
}
