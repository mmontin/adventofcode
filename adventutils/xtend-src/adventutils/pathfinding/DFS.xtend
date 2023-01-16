package adventutils.pathfinding

import java.util.Collection
import java.util.HashMap
import java.util.Map

class DFS {

	Map<State, Integer> min_distances
	Collection<Path> min_paths
	State initial

	new(State _initial) {
		initialize(_initial)
	}

	// This creates a new instance from the result of a AStar call
	new(AStar computation) {
		val min_path = computation.minPath
		val min_distance = computation.minDistance
		val distances = computation.valuations
		if (min_path.length > 1) {
			min_paths = newHashSet(new Path(min_path, min_distance))
			initial = min_path.head
			min_distances = new HashMap(distances)
		} else
			initialize(min_path.get(0))
	}

	def run() {
		new Path(initial).search(min_distances, min_paths)
		this
	}

	def initialize(State _initial) {
		min_distances = newHashMap
		min_paths = newHashSet
		initial = _initial
	}

	def all_min_paths() {
		min_paths
	}

	def min_distance() {
		min_paths.head.length
	}
}
