package advent2016.puzzle8

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashMap
import java.util.HashSet

class Launcher {
	
	static final int width = 50
	static final int height = 6
	
	static HashMap<Coordinate,Boolean> screen = newHashMap
	
	def static void main(String[] args) {
		
		for (i : 0..<width) 
			for (j : 0..<height)
				screen.put(new Coordinate(i,j),false)

		new InputLoader(2016,8).getInputs.forEach[step]
		
		for (i : 0..<height)
			println((0..<width).fold('')[v , j | v + (screen.get(new Coordinate(j,i)) ? "Y" : ".")])
			
		
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
				screen.replace(new Coordinate(i,j),true)
	}
	
	def static shift_row(int y, int offset) {
		val entries = new HashSet(screen.entrySet).filter[it.key.y == y]
		entries.map[key].forEach[screen.remove(it)]
		entries.forEach[screen.put(new Coordinate((it.key.x + offset) % width,it.key.y),it.value)]
	}
	
	def static shift_column(int x, int offset) {
		val entries = new HashSet(screen.entrySet).filter[it.key.x == x]
		entries.map[key].forEach[screen.remove(it)]
		entries.forEach[screen.put(new Coordinate(it.key.x, (it.key.y + offset) % height),it.value)]
	}
}