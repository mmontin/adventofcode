package advent2021.puzzle24

import adventutils.input.InputLoader
import adventutils.collection.ListUtils
import java.util.ArrayList
import java.util.List

class Launcher {

	static final List<String> inputStrings = new InputLoader(2021,24).inputs
	static final List<Pair<Integer,Integer>> input = 
		(0..13).fold(new ArrayList<Pair<Integer,Integer>>)[l , i |
			ListUtils.cons(new Pair(
				Integer::parseInt(inputStrings.get(i*18+5).split(" ").get(2)),
				Integer::parseInt(inputStrings.get(i*18+15).split(" ").get(2))
			), l)
		]

	
	def static void main(String[] args) {
		println(input)
	}
}
