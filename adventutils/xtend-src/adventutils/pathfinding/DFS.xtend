package adventutils.pathfinding

import java.util.ArrayList
import java.util.Collection
import java.util.List
import java.util.Map

class DFS {

	Map<State, Integer> min_distances
	Collection<Path> min_paths
	State initial

	new(State _initial) {
		initialize(_initial)
	}

	def run() {
		new Path(initial).search(min_distances, min_paths)
	}

	def initialize(State _initial) {
		min_distances = newHashMap
		min_paths = newHashSet
		initial = _initial
	}

	def all_min_paths() {
		min_paths.map[path]
	}

	def min_distance() {
		min_paths.head.length
	}

	static class Path {

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

		def contains(State element) {
			path.contains(element)
		}

		// Returns a list of paths to explore sorted by how promising they are
		// The function updates a map of minimal distances from start to nodes
		// as well as a collection of minimal paths, assumed to be of the same 
		// size. The branching trims branches strictly longer that the min path
		// already found and those reaching states that have already been reached
		// with a shorter distance. If more trimming needs to be done, it needs
		// to be performed in the definition of neighbours in the state taht is used. 
		def branch(Map<State, Integer> min_distances, Collection<Path> min_paths) {

			// Retrieving the minimal current path length
			val min_path_length = min_paths.size == 0 ? Integer.MAX_VALUE : min_paths.head.length

			// Creature the future set of relevant paths
			val relevant_paths = newHashSet

			// Browsing through the sorted neighbours of the current state
			current.neighbours.sortBy[it.value + it.key.minToGoal].forEach [ next |

				// This is how much it costs to go from start to next
				val length_to_next = length + next.value

				// We only have to worry about anything if we are not beyond
				// the current maximum length and if we have not reached the next
				// state with a shortest path already.
				if (length_to_next <= min_path_length &&
					length_to_next <= min_distances.getOrDefault(next.key, Integer.MAX_VALUE)) {

					// We start by updating the min distance to next
					min_distances.put(next.key, length_to_next)

					// Then we branch on whether next is a goal or not.
					// First case is that next is a goal. In that case we might
					// have to clear the shortest paths and we will add the new 
					// path to them afterwards in all cases.
					if (next.key.isGoal) {
						if(length_to_next < min_path_length) min_paths.clear
						min_paths.add(new Path(this, next))
					// If next is not a goal, we just add the new path to the relevant paths
					} else
						relevant_paths.add(new Path(this, next))
				}
			]

			// We return the relevant paths
			relevant_paths
		}

		// The search branches and goes in depth first, starting with
		// the most promising nodes to maximize the chances of trimming many branches
		def void search(Map<State, Integer> min_distances, Collection<Path> min_paths) {
			branch(min_distances, min_paths).forEach [
				it.search(min_distances, min_paths)
			]
		}
	}
}
