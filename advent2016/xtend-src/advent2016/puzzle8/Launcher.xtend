package advent2016.puzzle8

import advent2016.Utils
import java.util.HashMap

class Launcher {
	
	static final int width = 50
	static final int height = 6
	
	static HashMap<Coordinates,Boolean> screen = newHashMap
	
	def static void main(String[] args) {
		
		for (i : 0..<width) 
			for (j : 0..<height)
				screen.put(new Coordinates(i,j),false)

		Utils.getInputs(8).forEach[step]
		
		for (i : 0..<height)
			println((0..<width).fold('')[v , j | v + (screen.get(new Coordinates(j,i)) ? "Y" : ".")])
			
		
		println(screen.values.filter[it].size)
	}
	
	def static step(String s) {
		val split = s.split(" ")
		if (split.size == 2) {
			val size = split.get(1).split("x").map[Integer::parseInt(it)]
			rectangle(size.get(0),size.get(1))
		} else if (split.get(1).equals("row"))
			shift_row(Integer::parseInt(split.get(2).split("=").get(1)), Integer::parseInt(split.get(4)))
		else
			shift_column(Integer::parseInt(split.get(2).split("=").get(1)), Integer::parseInt(split.get(4)))
	}
	
	def static rectangle(int x, int y) {
		for (i : 0..<x)
			for (j : 0..<y)
				screen.replace(new Coordinates(i,j),true)
	}
	
	def static shift_row(int y, int offset) {
		screen.entrySet.map[key].filter[it.y == y].forEach[it.x = (it.x + offset) % width]
		screen = new HashMap(screen)
	}
	
	def static shift_column(int x, int offset) {
		screen.entrySet.map[key].filter[it.x == x].forEach[it.y = (it.y + offset) % height]
		screen = new HashMap(screen)
	}
}