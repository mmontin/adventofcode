package advent2016.puzzle24

import adventutils.astar.AStar
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Map
import java.util.Set

class Launcher {

	static public Set<Coordinate> walls = newHashSet
	static public Set<Coordinate> objectives = newHashSet
	
	static public Coordinate initial
	
	static public Map<Set<Coordinate>, Integer> distances = newHashMap
	
	def static void main(String[] args) {
		var lineNumber = 0
		for (line : new InputLoader(2016, 24).inputs) {
			for (columnNumber : 0 ..< line.length) {
				try {
					val v = Integer::parseInt(line.charAt(columnNumber) + '')
					if (v == 0) initial = new Coordinate(lineNumber, columnNumber)
					objectives.add(new Coordinate(lineNumber, columnNumber))
				} catch (NumberFormatException nfe) {
					if ((line.charAt(columnNumber) + '').equals("#"))
						walls.add(new Coordinate(lineNumber, columnNumber))
				}
			}
			lineNumber++
		}

		for (i : 0..<objectives.size) {
			val source = objectives.get(i)
			for (j : i+1..<objectives.size) {
				val target = objectives.get(j)
				distances.put(newHashSet(source,target),new AStar(new CoordinateState(source,target)).run.minDistance)
			}
		}

		println(new AStar(new OverState(initial,objectives)).run.minDistance)
	}
}
