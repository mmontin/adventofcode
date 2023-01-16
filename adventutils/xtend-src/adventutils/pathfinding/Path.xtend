package adventutils.pathfinding

import java.util.ArrayList
import java.util.Collection
import java.util.List
import java.util.Map

class Path {

	List<State> path
	State current
	int length

	new(State initial) {
		path = newArrayList(initial)
		current = initial
		length = 0
	}

	// Here we assume that the new neighbour is not in the path
	new(Path current_path, Pair<State, Integer> neighbour) {
		path = new ArrayList(current_path.path)
		current = neighbour.key
		path.add(current)
		length = current_path.length + neighbour.value
	}
	
	new (List<State> a_path, Integer distance) {
		path = new ArrayList(a_path)
		current = path.last
		length = distance
	}

	def last() {
		current
	}

	def getPath() {
		path
	}
	
	def getLength() {
		length
	}
	
	override toString() {
		path.toString
	}

	// Returns a list of paths to explore sorted by how promising they are
	// The function updates a map of minimal distances from start to nodes
	// as well as a collection of minimal paths, assumed to be of the same 
	// size. The branching trims branches strictly longer that the min path
	// already found and those reaching states that have already been reached
	// with a shorter distance. If more trimming needs to be done, it needs
	// to be performed in the definition of neighbours in the state taht is used. 
	def void branch(Map<State, Integer> min_distances, Collection<Path> min_paths) {

		// Retrieving the minimal current path length
		val min_path_length = min_paths.size == 0 ? Integer.MAX_VALUE : min_paths.head.length

		// Browsing through the sorted neighbours of the current state
		current.neighbours.sortBy[it.value + it.key.minToGoal].forEach [ next |

			// This is how much it costs to go from start to next
			val length_to_next = length + next.value

			/* The search is only worth pursuing if all these conditions hold:
			 * - The next step does not make us go beyond the current best path
			 * - We have not reached the next state with a better score yet
			 */
			// We only have to worry about anything if we are not beyond
			// the current maximum length and if we have not reached the next
			// state with a shortest path already.
			if (length_to_next + next.key.minToGoal <= min_path_length &&
				length_to_next <= min_distances.getOrDefault(next.key, Integer.MAX_VALUE)) {

				new Path(this, next).search(min_distances, min_paths)
			}
		]
	}

	// The search branches and goes in depth first, starting with
	// the most promising nodes to maximize the chances of trimming many branches
	// Note that if we enter this function, it necessarily means we are worth
	// exploring and are better than the already visited paths
	def void search(Map<State, Integer> min_distances, Collection<Path> min_paths) {

		// We start by updating the min distance to next
		min_distances.put(this.current, length)

		// If we are at a goal, we might need to clear the shortests paths
		// and then we add ourserves to the min paths.
		if (current.isGoal) {
			if (length < (min_paths.size == 0 ? Integer.MAX_VALUE : min_paths.head.length))
				min_paths.clear
			min_paths.add(this)
		// Otherwise, we branch	
		} else
			this.branch(min_distances, min_paths)
	}

}
