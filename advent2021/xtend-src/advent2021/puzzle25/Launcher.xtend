package advent2021.puzzle25

import adventutils.input.InputLoader
import java.util.List
import adventutils.geometry.Coordinate
import java.util.Set
import java.util.HashSet

class Launcher {
	
	static final List<String> inputStrings = new InputLoader(2021,25).inputs
	
	static final int max_i = inputStrings.size
	static final int max_j = inputStrings.get(0).length ;
	
	static Set<Coordinate> east = newHashSet
	static Set<Coordinate> south = newHashSet
	
	def static void main(String[] args) {
		
		(0 ..< max_i).forEach [ i |
			val line = inputStrings.get(i)
			(0 ..< max_j).forEach [ j |
				switch ('' + line.charAt(j)) {
					case '>' : east.add(new Coordinate(i,j))
					case 'v' : south.add(new Coordinate(i,j))
				}
			]
		]
		
		var stepNb = 0
		do stepNb ++
		while (step)

		print(stepNb)
	}
	
	def static boolean step() {
		var ans = false
		
		val doubleEast = new HashSet(east)
		for (c : east) {
			val right = c.right(max_j)
			if (!(east.contains(right) || south.contains(right))) {
				doubleEast.remove(c)
				doubleEast.add(right)
				ans = true
			}
		}
		east = doubleEast
		
		val doubleSouth = new HashSet(south)
		for (c : south) {
			val bottom = c.down(max_i)
			if (!(east.contains(bottom) || south.contains(bottom))) {
				doubleSouth.remove(c)
				doubleSouth.add(bottom)
				ans = true
			}
		}
		south = doubleSouth
		
		ans
	}
}