package advent2016.puzzle3

import adventutils.input.InputLoader
import java.util.List
import java.util.ArrayList

class Launcher {
	def static void main(String[] args) {

		var List<List<Integer>> input = new InputLoader(2016,3).getInputs[it.split(" ").filter[s|!s.isEmpty].map[Integer::parseInt(it)].toList]

		println(input.fold(0) [ nb, triangle |
			var c1 = triangle.get(0)
			var c2 = triangle.get(1)
			var c3 = triangle.get(2)
			c1 + c2 > c3 && c1 + c3 > c2 && c2 + c3 > c1 ? nb + 1 : nb
		])

		val ArrayList<List<Integer>> other_inputs = newArrayList
		for (j : 0 .. 2) {
			for (i : 0 ..< input.size) {
				if (i % 3 == 0)
					other_inputs.add(newArrayList)
				other_inputs.last.add(input.get(i).get(j))
			}
		}
		
		println(other_inputs.fold(0)[ nb, triangle |
			var c1 = triangle.get(0)
			var c2 = triangle.get(1)
			var c3 = triangle.get(2)
			c1 + c2 > c3 && c1 + c3 > c2 && c2 + c3 > c1 ? nb + 1 : nb
		])
	}
}
