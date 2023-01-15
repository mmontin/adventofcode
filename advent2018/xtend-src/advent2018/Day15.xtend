package advent2018

import adventutils.astar.AStar
import adventutils.astar.NotInitializedException
import adventutils.astar.State
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Collection
import java.util.List
import java.util.PriorityQueue
import java.util.Set

class Day15 {

	static final Set<Coordinate> available = newHashSet
	static final Set<Entity> elves = newHashSet
	static final Set<Entity> goblins = newHashSet

	def static void main(String[] args) {

		// Let's initialize the map and creatures
		val input = new InputLoader(2018, 15).inputs.map[toCharArray.map[toString]]
		(0 ..< input.size).forEach [ i |
			(0 ..< input.get(0).size).forEach [ j |
				switch (input.get(i).get(j)) {
					case ".": available.add(new Coordinate(i, j))
					case "G": goblins.add(new Entity(new Coordinate(i, j), elves))
					case "E": elves.add(new Entity(new Coordinate(i, j), goblins))
				}
			]
		]

		var rounds = 0
		var boolean hasEvolved = true
		while (!elves.isEmpty && hasEvolved) {
			if (rounds % 1000 == 0) {
				println(elves.size)
				println(goblins.size)
				println(rounds)
				println("-------------------------------")
			}
			val creatures = new PriorityQueue(elves)
			creatures.addAll(goblins)
			var current = creatures.poll
			hasEvolved = false
			do {
				hasEvolved = current.playTurn || hasEvolved
				current = creatures.poll
			} while (current !== null)
			if(hasEvolved) rounds++
		}
		println(rounds * (elves.fold(0)[acc, v|acc + v.hit_points] + goblins.fold(0)[acc, v|acc + v.hit_points]))
	}

	static class MyCoordinate extends Coordinate implements State {

		// A sorted set of goals to ponder distances
		List<Coordinate> goals

		new(int _x, int _y, Collection<Coordinate> _goals) {
			super(_x, _y)
			goals = _goals.sort.toList
		}

		override isGoal() {
			goals.contains(this)
		}

		override minToGoal() {
			(0 ..< goals.size).map[this.manhattanDistanceTo(goals.get(it)) * 100 + it].min
		}

		override neighbours() {
			this.noDiagonalUnboundedNeighbours.filter[available.contains(it)].map [
				new MyCoordinate(it.x, it.y, goals) as State -> 100 + (goals.contains(it) ? goals.indexOf(it) : 0)
			].toList
		}
	}

	static class Entity implements Comparable<Entity> {

		Set<Entity> others
		Coordinate position
		int hit_points

		new(Coordinate _position, Set<Entity> _others) {
			position = _position
			hit_points = 200
			others = _others
		}

		// Returns true if the target dies after taking damage
		def hit(Entity other) {
			other.hit_points -= 3
			other.hit_points <= 0
		}

		// Plays a turn, that is move and then attack if applicable
		// Returns true if an action was possible, false otherwise
		def playTurn() {
			try {
				val candidates = others.fold(newHashSet) [ acc, v |
					acc.addAll(v.position.noDiagonalUnboundedNeighbours.filter [
						available.contains(it) || it.equals(position)
					])
					acc
				]
				val engine = new AStar(new MyCoordinate(this.position.x, this.position.y, candidates))
				engine.run
				available.add(position)
				val next_position = (engine.minDistance == 0
					? engine.minPath.head
					: engine.minPath.get(1)) as Coordinate
				position = next_position
				available.remove(next_position)
				// Then we attack the first target in range
				// If it dies, it disappears and its square becomes available
				val target = others.filter [
					position.noDiagonalUnboundedNeighbours.contains(it.position)
				].sortBy[position].head
				if (target !== null && this.hit(target)) {
					others.remove(target)
					available.add(target.position)
				}
				true
			} catch (NotInitializedException nie)
				false
		}

		override compareTo(Entity other) {
			position.compareTo(other.position)
		}

		override toString() {
			position.toString
		}
	}
}
