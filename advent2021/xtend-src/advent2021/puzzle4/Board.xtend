package advent2021.puzzle4

import java.io.BufferedReader
import java.util.ArrayList
import java.util.List

class Board {
	
	List<List<Square>> grid
	
	new(BufferedReader br) {
		br.readLine
		grid = new ArrayList(5)
		for (i : 0..<5) {
			val s = new ArrayList(5)
			br.readLine().split(" ").forEach[x | if (!x.empty) s.add(new Square(Integer::parseInt(x)))]
			grid.add(s)
		}		
	}
	
	def play(int number) throws CompletedException {
		for (i : 0..<5) 
			for (j : 0..<5)
				grid.get(i).get(j).call(number)
		
		if (completed)
			throw new CompletedException(count, number)
	}
	
	def completed() {
		var ans = false
		for (i : 0..<5) {
			var b0 = true
			var b1 = true
			for (j : 0..<5) {
				b0 = b0 && grid.get(i).get(j).called
				b1 = b1 && grid.get(j).get(i).called
			}
			ans = ans || b0 || b1
		}
		ans
	}
	
	def count() {
		grid.fold(0, [v , l | l.fold(v, [w , x | w + (x.called ? 0 : x.number) ]) ])
	}
}