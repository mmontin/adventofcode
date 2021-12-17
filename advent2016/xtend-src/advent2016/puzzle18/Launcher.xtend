package advent2016.puzzle18

import java.util.List

class Launcher {
	
	static final List<Boolean> input = ".^^..^...^..^^.^^^.^^^.^^^^^^.^.^^^^.^^.^^^^^^.^...^......^...^^^..^^^.....^^^^^^^^^....^^...^^^^..^".toCharArray.toList.map[
		('' + it).equals(".") ? false : true
	]
	
	def static void main(String[] args) {
		var sum = input.filter[!it].size
		var current = input
		for(i : 1..<400000)
			sum += (current = current.computeRow).filter[!it].size
		println(sum)
	}
	
	def static List<Boolean> computeRow(List<Boolean> booleans) {
		(0..<booleans.size).fold(newArrayList)[l , i |
			var left = i==0 ? false : booleans.get(i-1)
			var center = booleans.get(i)
			var right = i==booleans.size-1 ? false : booleans.get(i+1)
			l.add((left && !center && !right) || (right && !center && ! left) || (left && center && !right) || (!left && center && right))
			l
		]
	}
}