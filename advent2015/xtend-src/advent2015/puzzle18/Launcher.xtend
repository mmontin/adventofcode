package advent2015.puzzle18

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Launcher {
	
	def static void main(String[] args) {
		val List<List<Integer>> tiles = new ArrayList	
		new InputLoader(2015,18).getInputs.forEach[l | 
			val line = newArrayList
			l.toCharArray.forEach[c | line.add((c + '').equals('#') ? 1 : 0) ]
			tiles.add(line)
		]

		var input = tiles
		for (k : 0..99)
			input = step(input)
			
		println(input.fold(0)[v , l | l.fold(v)[x , y | x + y]])
	}
	
	def static step(List<List<Integer>> input) {
		val output = new ArrayList<List<Integer>>
		for (i : 0..99) {
			val line = new ArrayList<Integer>
			for (j : 0..99) {
				var neighbours = 0
				for (k : Math.max(i-1,0)..Math.min(i+1,99))
					for (l : Math.max(j-1,0)..Math.min(j+1,99))
						if (k != i || l != j)
							neighbours += input.get(k).get(l)
				var newValue = input.get(i).get(j)
				if ((i == 0 && (j == 0 || j == 99)) || (i == 99 && (j == 0 || j == 99))) 
					newValue = 1
				else {
					if (newValue == 1)
						newValue = neighbours == 2 || neighbours == 3 ? 1 : 0 
					else 
						newValue = neighbours == 3 ? 1 : 0
				}
				line.add(newValue)
			}
			output.add(line)
		} 
		output
	}
}