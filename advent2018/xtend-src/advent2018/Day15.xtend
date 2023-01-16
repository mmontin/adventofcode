package advent2018

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.DFS
import adventutils.pathfinding.State
import java.util.Collection
import java.util.HashSet
import java.util.Set
import adventutils.pathfinding.NotInitializedException

class Day15 {
	
	static final Set<Coordinate> available = newHashSet
	static final Set<Entity> elves = newHashSet
	static final Set<Entity> goblins = newHashSet

	def static void init(int elves_attack) {
		
		available.clear
		elves.clear
		goblins.clear
		
		// Let's initialize the map and creatures
		val input = new InputLoader(2018, 15).inputs.map[toCharArray.map[toString]]
		(0 ..< input.size).forEach [ i |
			(0 ..< input.get(0).size).forEach [ j |
				switch (input.get(i).get(j)) {
					case ".": available.add(new Coordinate(i, j))
					case "G": goblins.add(new Entity(new Coordinate(i, j), elves))
					case "E": elves.add(new Entity(new Coordinate(i, j), goblins, elves_attack))
				}
			]
		]
	}

	def static void main(String[] args) {
		
		init(3)
		var i = fight
		val remaining = elves.size == 0 ? goblins : elves
		println((i - 1) * remaining.fold(0)[acc, v|acc + v.hit_points])
		
		var min_attack = 4
		var max_attack = 100
		while (max_attack != min_attack) {
			var current_attack = min_attack + (max_attack - min_attack) / 2
			init(current_attack)
			val elves_number = elves.size
			i = fight
			if (elves_number > elves.size) min_attack = current_attack+1
			else max_attack = current_attack
		}
		
		init(max_attack)
		i = fight
		println((i-1) * elves.fold(0)[acc, v|acc + v.hit_points])
	}

	def static fight() {
		var i = 0
		while (elves.size > 0 && goblins.size > 0) {
			val allUnits = new HashSet(elves)
			allUnits.addAll(goblins)
			allUnits.sortBy[position].forEach [
				if (goblins.contains(it) || elves.contains(it))
					it.playTurn
			]
			i++
		}
		i
	}

	def static print() {
		val all_coords = new HashSet(available)
		all_coords.addAll(elves.map[position])
		all_coords.addAll(goblins.map[position])
		val min_x = all_coords.minBy[x].x
		val max_x = all_coords.maxBy[x].x
		val min_y = all_coords.minBy[y].y
		val max_y = all_coords.maxBy[y].y
		println((min_x - 1 .. max_x + 1).fold("") [ acc1, v1 |
			acc1 + (min_y - 1 .. max_y + 1).fold("") [ acc2, v2 |
				acc2 + {
					val current = new Coordinate(v1, v2)
					if (elves.exists[it.position.equals(current)])
						"E"
					else if (goblins.exists[it.position.equals(current)])
						"G"
					else if (available.contains(current))
						"."
					else
						"#"
				}
			] + "\n"
		])
	}

	static class MyCoordinate extends Coordinate implements State {

		Collection<Coordinate> goals

		new(Coordinate _other, Collection<Coordinate> _goals) {
			this(_other.x, _other.y, _goals)
		}

		new(int _x, int _y, Collection<Coordinate> _goals) {
			super(_x, _y)
			goals = _goals
		}

		override isGoal() {
			goals.contains(this)
		}

		override minToGoal() {
			goals.map[manhattanDistanceTo(this)].min
		}

		override neighbours() {
			this.noDiagonalUnboundedNeighbours.filter[available.contains(it)].map [
				new MyCoordinate(it, goals) as State -> 1
			]
		}
	}

	static class Entity implements Comparable<Entity> {

		Collection<Entity> others
		Coordinate position
		int attack_value
		int hit_points

		new(Coordinate _position, Collection<Entity> _others, int _attack_value) {
			position = _position
			hit_points = 200
			others = _others
			attack_value = _attack_value
		}

		new(Coordinate _position, Collection<Entity> _others) {
			this(_position, _others, 3)
		}

		// Returns true if I die after taking damage
		def getHit(int dmg) {
			hit_points -= dmg
			hit_points <= 0
		}

		// Returns true if an attack has been made
		def attack() {
			val neighbours = position.noDiagonalUnboundedNeighbours
			val target = others.filter[neighbours.contains(it.position)].sort.head
			if (target !== null && target.getHit(attack_value)) {
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
				try {
					val aStarEngine = new AStar(new MyCoordinate(position, currentCandidates))
					aStarEngine.run
					val DFSEngine = new DFS(aStarEngine)
					DFSEngine.run
					// Let's retrieve all the minimal paths
					val min_paths = DFSEngine.all_min_paths
					if (min_paths.size > 0) {
						// Let's retrieve the path that interests us
						val min_path = min_paths.size == 1
								? min_paths.head.path
								: min_paths.groupBy[it.last].entrySet.sortBy[it.key as MyCoordinate].head.value.map [
								path
							].sortBy[it.get(1) as MyCoordinate].head
						if (min_path.size > 1) {
							val next_position = min_path.get(1) as MyCoordinate
							available.add(position)
							available.remove(next_position)
							position = next_position
						}
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
			if (hit_points == other.hit_points)
				position.compareTo(other.position)
			else
				hit_points.compareTo(other.hit_points)
		}

		override toString() {
			position.toString + " ; " + hit_points + "HP"
		}
	}
}
