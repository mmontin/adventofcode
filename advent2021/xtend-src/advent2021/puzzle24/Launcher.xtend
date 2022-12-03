package advent2021.puzzle24

import adventutils.input.InputLoader
import adventutils.list.ListUtils
import java.util.ArrayList
import java.util.List
import java.util.Stack

class Launcher {

	static final List<String> inputStrings = new InputLoader(2021,24).inputs
	static final List<Pair<Integer,Integer>> input = 
		(0..13).fold(new ArrayList<Pair<Integer,Integer>>)[l , i |
			ListUtils.cons(new Pair(
				Integer::parseInt(inputStrings.get(i*18+5).split(" ").get(2)),
				Integer::parseInt(inputStrings.get(i*18+15).split(" ").get(2))
			), l)
		]
	
	static int z = 0

//	def static step(int z, int v, int b, int c) {
//		var output = z
//		var x = output % 26
//		if (b < 0) output /= 26
//		if (x + b != v)	output = 26 * output + v + c
//		output
//	}
	
	def static int function() {
		val stack = new Stack
		for (i : 9..1)
			for (j : 9..1)
				for (k : 9..1)
					for (l : 9..1)
						println
		0
	}
	
	def static void main(String[] args) {
		function
	}
}
