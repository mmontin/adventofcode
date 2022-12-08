package advent2022

import java.util.Map
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader

class Day8 {
	
	static final Map<Coordinate,Integer> trees = newHashMap
	
	def static void main(String[] args) {
		
		val inputs = new InputLoader(2022,8).getInputs
		val max_i = inputs.size
		val max_j = inputs.get(0).length ;
		
		(0..<max_i).forEach[ i |
			val line = inputs.get(i).toCharArray ;
			(0..<max_j).forEach[ j |
				trees.put(new Coordinate(i,j),Integer.parseInt(line.get(j) + ""))
			]
		]
		
		val visible = newHashSet ;
		
		// Looking how many trees are visible horizontally
		for (i : 0..<max_i) {
			var max_left_size = -1
			var max_right_size = -1
			for (j : 0..<max_j) {
				val current_left = new Coordinate(i,j)
				val current_right = new Coordinate(i,max_j-1-j)
				val current_left_size = trees.get(current_left)
				val current_right_size = trees.get(current_right)
				if (current_left_size > max_left_size) {
					visible.add(current_left)
					max_left_size = current_left_size
				}
				if (current_right_size > max_right_size) {
					visible.add(current_right)
					max_right_size = current_right_size
				}
			}
		}
		
		// Looking how many trees are visible vertically
		for (j : 0..<max_j) {
			var max_top_size = -1
			var max_bot_size = -1
			for (i : 0..<max_i) {
				val current_top = new Coordinate(i,j)
				val current_bot = new Coordinate(max_i-1-i,j)
				val current_top_size = trees.get(current_top)
				val current_bot_size = trees.get(current_bot)
				if (current_top_size > max_top_size) {
					visible.add(current_top)
					max_top_size = current_top_size
				}
				if (current_bot_size > max_bot_size) {
					visible.add(current_bot)
					max_bot_size = current_bot_size
				}
			}
		}
		
		println(visible.size)
		
		// Finding the best spot by computing the highest scenic score
		var best_score = 0
		for (i : 0..<max_i) {
			for (j : 0..<max_j) {
				val current_height = trees.get(new Coordinate(i,j))
				
				// Going left
				var visibility_left = 0
				var k = j - 1
				while (trees.containsKey(new Coordinate(i,k)) && trees.get(new Coordinate(i,k)) < current_height) {
					visibility_left ++
					k --
				}
				if (trees.containsKey(new Coordinate(i,k))) visibility_left ++
				
				// Going right
				var visibility_right = 0
				var l = j + 1
				while (trees.containsKey(new Coordinate(i,l)) && trees.get(new Coordinate(i,l)) < current_height) {
					visibility_right ++
					l ++
				}
				if (trees.containsKey(new Coordinate(i,l))) visibility_right ++
				
				// Going up
				var visibility_up = 0
				var m = i - 1
				while (trees.containsKey(new Coordinate(m,j)) && trees.get(new Coordinate(m,j)) < current_height) {
					visibility_up ++
					m --
				}
				if (trees.containsKey(new Coordinate(m,j))) visibility_up ++
				
				// Going down
				var visibility_down = 0
				var n = i + 1
				while (trees.containsKey(new Coordinate(n,j)) && trees.get(new Coordinate(n,j)) < current_height) {
					visibility_down ++
					n ++
				}
				if (trees.containsKey(new Coordinate(n,j))) visibility_down ++
				
				best_score = Math.max(best_score,visibility_left * visibility_right * visibility_up * visibility_down)		
			}
		}
		
		println(best_score)
	}
}