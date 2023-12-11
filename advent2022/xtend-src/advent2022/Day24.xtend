package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Coordinate.Direction
import adventutils.input.InputLoader
import java.util.List
import adventutils.pathfinding.State
import java.util.Map
import java.util.Set
import adventutils.pathfinding.AStar

class Day24 {

	static final List<char[]> inputs = new InputLoader(2022, 24).inputs.map[toCharArray]
	static final int WALL_DOWN = inputs.size - 2
	static final int WALL_RIGHT = inputs.get(0).size - 2
	static final Coordinate departure = new Coordinate(-1,0)
	static final Coordinate arrival = new Coordinate(WALL_DOWN, WALL_RIGHT - 1)

	static final List<Blizzard> blizzards = {
		val output = newArrayList;
		(1 .. WALL_DOWN).forEach [ i |
			(1 .. WALL_RIGHT).forEach [ j |
				switch (inputs.get(i).get(j).toString) {
					case ">": output.add(new Blizzard(new Coordinate(i-1, j-1), Direction.RIGHT))
					case "<": output.add(new Blizzard(new Coordinate(i-1, j-1), Direction.LEFT))
					case "v": output.add(new Blizzard(new Coordinate(i-1, j-1), Direction.DOWN))
					case "^": output.add(new Blizzard(new Coordinate(i-1, j-1), Direction.UP))
				}
			]
		]
		output
	}
	
	static final Map<Integer,Set<Coordinate>> current_blizzards = newHashMap
	
	def static void main(String[] args) {
		
		// 1st computation
		PositionTimed.current_arrival = arrival
		var computation = new AStar(new PositionTimed(departure,0)).run
		var current_time = computation.minDistance
		println(current_time)
		
		// Second computation
		PositionTimed.current_arrival = departure
		computation = new AStar(new PositionTimed(arrival,current_time)).run
		current_time = current_time + computation.run.minDistance
		
		// Third computation
		PositionTimed.current_arrival = arrival
		computation = new AStar(new PositionTimed(departure,current_time)).run
		current_time = current_time + computation.run.minDistance
		println(current_time)
	}
	
	def static getBlizzardsAtTime(int t) {
		if (!current_blizzards.containsKey(t))
			current_blizzards.put(t, blizzards.map[getCurrentPosition(t)].toSet)
		current_blizzards.get(t)
	}
	
	static class PositionTimed implements State {
		
		static Coordinate current_arrival
		
		Coordinate position
		int time
		
		new (Coordinate _position, int _time) {
			position = _position
			time = _time
		}
		
		override isGoal() {
			position.equals(current_arrival)
		}
		
		override minToGoal() {
			position.manhattanDistanceTo(current_arrival)
		}
		
		override neighbours() {
			val squares = position.noDiagonalUnboundedNeighbours
			squares.add(position)
			squares.filter[
				it.equals(departure) ||
				it.equals(arrival) ||
				(it.x >= 0 && it.x < WALL_DOWN && it.y >= 0 && it.y < WALL_RIGHT && !getBlizzardsAtTime(time+1).contains(it))
			].map[new PositionTimed(it,time+1) -> 1]
		}
		
		override toString() {
			position.toString
		}
		
		override hashCode() {
			position.hashCode * time
		}
		
		override equals(Object other) {
			switch other {
				PositionTimed : other.position.equals(position) && other.time.equals(time)
				default : false
			}
		}
	}

	static class Blizzard {

		Coordinate initial
		Direction direction

		new(Coordinate _initial, Direction _direction) {
			initial = _initial
			direction = _direction
		}

		def getCurrentPosition(int t) {
			switch direction {
				case UP: new Coordinate((initial.x + WALL_DOWN - t % WALL_DOWN) % WALL_DOWN, initial.y)
				case DOWN: new Coordinate((initial.x + t % WALL_DOWN) % WALL_DOWN, initial.y)
				case RIGHT: new Coordinate(initial.x, (initial.y + t % WALL_RIGHT) % WALL_RIGHT)
				case LEFT: new Coordinate(initial.x, (initial.y + WALL_RIGHT - t % WALL_RIGHT) % WALL_RIGHT)
			}
		}

		override toString() {
			initial.toString
		}
	}
}
