package advent2018

import adventutils.pathfinding.AStar
import adventutils.pathfinding.NotInitializedException
import adventutils.pathfinding.State
import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Collection
import java.util.HashSet
import java.util.List
import java.util.Set

class Day15 {

	def static void main(String[] args) {

		val Set<Coordinate> available = newHashSet
		val Set<Entity> elves = newHashSet
		val Set<Entity> goblins = newHashSet

		// Let's initialize the map and creatures
		val input = new InputLoader(2018, 15).inputs.map[toCharArray.map[toString]]
		(0 ..< input.size).forEach [ i |
			(0 ..< input.get(0).size).forEach [ j |
				switch (input.get(i).get(j)) {
					case ".": available.add(new Coordinate(i, j))
					case "G": goblins.add(new Entity(new Coordinate(i, j), elves, available))
					case "E": elves.add(new Entity(new Coordinate(i, j), goblins, available))
				}
			]
		]

		var i = 0
		while (elves.size > 0 && goblins.size > 0) {
			println(i)
			print(available,elves,goblins)
			val allUnits = new HashSet(elves)
			allUnits.addAll(goblins)
			allUnits.sort.forEach[it.playTurn]
			i++
		}

		val remaining = elves.size == 0 ? goblins : elves
		println(remaining)
		println((i - 1) * remaining.fold(0)[acc, v|acc + v.hit_points])
	}
	
	def static print(Set<Coordinate> available, Set<Entity> elves, Set<Entity> goblins) {
		val all_coords = new HashSet(available)
		all_coords.addAll(elves.map[position])
		all_coords.addAll(goblins.map[position])
		val min_x = all_coords.minBy[x].x
		val max_x = all_coords.maxBy[x].x
		val min_y = all_coords.minBy[y].y
		val max_y = all_coords.maxBy[y].y
		println((min_x-1..max_x+1).fold("")[acc1,v1|
			acc1 + (min_y-1..max_y+1).fold("")[acc2,v2|
				acc2 + {
					val current = new Coordinate(v1,v2)
					if (elves.exists[it.position.equals(current)])
						"E"
					else if (goblins.exists[it.position.equals(current)])
						"G"
					else if (available.contains(current))
						"."
					else "#"
				}
			] + "\n"
		])
	}

	static class MyCoordinate extends Coordinate implements State {

		// A sorted set of goals to ponder distances
		List<Coordinate> goals

		// A collection of available spaces
		Collection<Coordinate> available

		new(Coordinate _other, Collection<Coordinate> _goals, Collection<Coordinate> _available) {
			this(_other.x, _other.y, _goals, _available)
		}

		new(int _x, int _y, Collection<Coordinate> _goals, Collection<Coordinate> _available) {
			super(_x, _y)
			goals = _goals.sort.toList
			available = _available
		}

		override isGoal() {
			goals.contains(this)
		}

		override minToGoal() {
			(0 ..< goals.size).map[this.manhattanDistanceTo(goals.get(it)) * 1000 + it].min
		}

		override neighbours() {
			this.noDiagonalUnboundedNeighbours.filter[available.contains(it)].map [
				new MyCoordinate(it, goals, available) as State -> 1000 + (goals.contains(it) ? goals.indexOf(it) : 0)
			]
		}
	}

	static class Entity implements Comparable<Entity> {

		Collection<Entity> others
		Collection<Coordinate> available
		Coordinate position
		int hit_points

		new(Coordinate _position, Collection<Entity> _others, Collection<Coordinate> _available) {
			position = _position
			available = _available
			hit_points = 200
			others = _others
		}

		// Returns true if I die after taking damage
		def getHit() {
			hit_points -= 3
			hit_points <= 0
		}

		// Returns true if an attack has been made
		def attack() {
			val neighbours = position.noDiagonalUnboundedNeighbours
			val target = others.filter[neighbours.contains(it.position)].sort.head
			if (target !== null && target.getHit) {
				println("is a kill from " + this.position + " to " + target.position)
				available.add(target.position)
				others.remove(target)
			}
		}

		// Return the possible target squares
		def candidates() {
			others.fold(newHashSet) [ acc, v |
				val current_neighbours = v.position.noDiagonalUnboundedNeighbours
				acc.addAll(current_neighbours.filter[available.contains(it) || it.equals(position)])
				acc
			]
		}

		// Returns true if this unit has moved
		def void move() {
			val currentCandidates = candidates
			if (currentCandidates.size != 0) {
				val engine = new AStar(new MyCoordinate(position, currentCandidates, available))
				try {
					val min_path = engine.run.minPath
					if (min_path.size > 1) {
						val next_position = min_path.get(1) as MyCoordinate
						available.add(position)
						available.remove(next_position)
						position = next_position
					}
				} catch (NotInitializedException nie) {
				}
			}
		}

		// Plays a turn, that is move and then attack if applicable
		// Returns true if an action was possible, false otherwise
		def playTurn() {
			move
			attack
		}

		override compareTo(Entity other) {
			position.compareTo(other.position)
		}

		override toString() {
			position.toString + " ; " + hit_points + "HP"
		}
	}
}
