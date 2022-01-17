package advent2016.puzzle22

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Map
import java.util.Set
import adventutils.astar.AStar

class Launcher {
	
	static public Map<Coordinate,Node> input = {
		val output = newHashMap
		val stream = new InputLoader(2016,22).inputReader
		stream.readLine
		stream.readLine
		var String s
		while((s = stream.readLine) !== null) {
			val split = s.split("\\s+")
			output.put(
				new Coordinate(split.get(0).split('/').get(3).substring(6).replaceAll("-y",',')),
				new Node(split.get(1),split.get(2))
			)
		}
		output
	}
	
	static int viablePairs = 0
	
	static public Set<Coordinate> walls = newHashSet
	
	static public Coordinate initial
	static public Coordinate dataPosition
	static public Coordinate target
	
	def static void main(String[] args) {
		initialize
		println(viablePairs)
		var totalCost = 0
		val astar = new AStar
		while (!dataPosition.equals(new Coordinate(0,0))) {
			astar.initialize(new CoordinateState(initial))
			totalCost += (astar.run.minDistance + 1)
			target = new Coordinate(target.x-1, target.y)
			dataPosition = new Coordinate(target.x + 1, target.y)
			initial = new Coordinate(dataPosition.x + 1, target.y)
		}
		println(totalCost)
	}
	
	def static initialize() {
		for (e1 : input.entrySet) {
			if ((e1.key.y == 0) && (dataPosition === null || e1.key.x > dataPosition.x)) dataPosition = e1.key
			if (e1.value.empty)	initial = e1.key
			else {
				var nb1 = 0
				for (e2 : input.entrySet) nb1 += (!e1.key.equals(e2.key) && e1.value.wouldFitIn(e2.value)) ? 1 : 0
				nb1 == 0 ? walls.add(e1.key) : viablePairs += nb1
			}
		}
		target = new Coordinate(dataPosition.x-1,dataPosition.y)
	}
}