package advent2021.puzzle4

import adventutils.input.InputLoader
import java.io.BufferedReader
import java.util.ArrayList

class Launcher {
	def static void main(String[] args) {

		val numbers = new ArrayList<Integer>
		val boards = new ArrayList<Board>

		val BufferedReader br = new InputLoader(2021,4).getInputReader

		br.readLine().split(",").forEach[s|numbers.add(Integer::parseInt(s))]

		while (br.ready())
			boards.add(new Board(br))

		try
			numbers.forEach[n|boards.forEach[b|b.play(n)]]
		catch (CompletedException ce)
			println(ce.result)

		numbers.forEach [ n |
			var i = 0
			while (i < boards.size) {
				try {
					boards.get(i).play(n)
				} catch (CompletedException ce) {
					if (boards.size == 1) println(ce.result)
					boards.remove(i)
					i--
				}
				i++
			}
		]
	}
}
