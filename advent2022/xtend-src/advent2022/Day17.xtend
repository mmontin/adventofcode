package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.math.BigInteger
import java.util.List
import java.util.Set

import static advent2022.Day17.Rock.*

class Day17 {

	static final List<Direction> movements = new InputLoader(2022, 17).inputs.head.toCharArray.map [
		Dir.fromLeftRight(it + "")
	]
	static final int movements_size = movements.size

	static final int left_border = 0
	static final int right_border = 8

	static final Set<Coordinate> filled = newHashSet
	static int max_y = 0

	def static void main(String[] args) {

		initialize_simulation
		simulate(2022)
		println(max_y)
		initialize_simulation
		// This is commented out because it does not terminate but it shows a pattern used later on
//		println("Sweet spot = " + find_sweet_spot)
		val to_reach = new BigInteger("1000000000000")
		val first = BigInteger.valueOf(1724)
		val without_first = to_reach.subtract(first)
		val size_repeat = BigInteger.valueOf(1725)
		val remainder = without_first.mod(size_repeat)
		val divisor = without_first.divide(size_repeat)
		// Now that we computed all this value the total height of the tower after 10^12 blocks will
		// be the size of the tower after (1724 + remainder) step
		// plus divisor * the size of the tower after 1725 steps
		// Thus we need to simulated the size of the tower after (1724 + remainder) steps
		// and add divisor * 2630 to it
		simulate(1724+remainder.intValue)
		println(BigInteger.valueOf(max_y).add(divisor.multiply(BigInteger.valueOf(2630))))
	}
	
	def static find_sweet_spot() {
		var number_of_rocks = 0
		var current_movement = 0
		do {
			current_movement = simulation_step(current_movement)
			number_of_rocks ++
			if (current_movement == 0)
				println(number_of_rocks + " ; " + max_y)
		} while (!(number_of_rocks % 5 == 0 && current_movement == 0))
		number_of_rocks
	}

	static def initialize_simulation() {
		filled.clear
		max_y = 0
		Rock.current_rock = 0
	}

	// This creates a rock, and simulates its descent start from
	// the next_movement indice in the movements lists. This gives
	// back the next next_movement for further simulation steps
	static def simulation_step(int next_movement) {

		// The indice of the next movement to be applied
		var current_movement = next_movement
		// A new rock to be simulated
		var current_rock = Rock.next_rock
		// It just appeared so it has move from the rooftop
		var has_moved = true
		// We move it until it can no longer move
		while (has_moved) {
			// We start by pushing the rock according to the jet direction
			current_rock.move(movements.get(current_movement))
			// we update the next jet direction (circular within the list of movements)
			current_movement = (current_movement + 1) % movements_size
			// We attempt to move the rock downwards
			has_moved = current_rock.move(Direction.DOWN)
		}
		// Here the rock could not move down, so we cement it
		current_rock.cement
		// We return the next movement to be applied
		current_movement
	}

	// This simulates the fall of a certain number of rocks
	static def simulate(int number_of_rocks) {
		
		var current_movement = 0
		// 2022 rocks have to fall
		for (i : 0 ..< number_of_rocks)
			current_movement = simulation_step(current_movement)
	}

	static class Rock {

		static int current_rock = 0

		static def next_rock() {
			val output = new Rock(current_rock)
			current_rock = (current_rock + 1) % 5
			output
		}

		Set<Coordinate> shape

		new(int i) {
			val starting_y = max_y + 4
			val starting_x = 3
			shape = switch i {
				case 0: // the horizontal bar
					newHashSet(
						new Coordinate(starting_x, starting_y),
						new Coordinate(starting_x + 1, starting_y),
						new Coordinate(starting_x + 2, starting_y),
						new Coordinate(starting_x + 3, starting_y)
					)
				case 1: // the cross
					newHashSet(
						new Coordinate(starting_x, starting_y + 1),
						new Coordinate(starting_x + 1, starting_y + 1),
						new Coordinate(starting_x + 2, starting_y + 1),
						new Coordinate(starting_x + 1, starting_y),
						new Coordinate(starting_x + 1, starting_y + 2)
					)
				case 2: // the right L
					newHashSet(
						new Coordinate(starting_x, starting_y),
						new Coordinate(starting_x + 1, starting_y),
						new Coordinate(starting_x + 2, starting_y),
						new Coordinate(starting_x + 2, starting_y + 1),
						new Coordinate(starting_x + 2, starting_y + 2)
					)
				case 3: // the vertical bar
					newHashSet(
						new Coordinate(starting_x, starting_y),
						new Coordinate(starting_x, starting_y + 1),
						new Coordinate(starting_x, starting_y + 2),
						new Coordinate(starting_x, starting_y + 3)
					)
				default: // the square
					newHashSet(
						new Coordinate(starting_x, starting_y),
						new Coordinate(starting_x, starting_y + 1),
						new Coordinate(starting_x + 1, starting_y),
						new Coordinate(starting_x + 1, starting_y + 1)
					)
			}
		}

		def move(Direction d) {
			// We try to move in the direction and assess whether one of the new
			// blocks in the shape does conflict with one of the existing blocks,
			// or does go outside of the room
			val new_shape = shape.map[move(d)].toSet
			val intersects = new_shape.exists [
				filled.contains(it) || it.x <= left_border || it.x >= right_border || it.y <= 0
			]
			// If there's no intersection, it means the rock can actually move, and does
			if(!intersects) shape = new_shape
			// We return true if the rock has actually moved
			!intersects
		}

		def cement() {
			// We transform the current rock into blocks in the cave
			filled.addAll(shape)
			// We update the max height if necessary
			max_y = Math.max(max_y, shape.maxBy[y].y)
		}
	}
}
