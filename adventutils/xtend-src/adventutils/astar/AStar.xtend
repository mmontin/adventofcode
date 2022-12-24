package adventutils.astar

import java.util.Map
import java.util.PriorityQueue
import org.eclipse.xtext.xbase.lib.Functions.Function2

class AStar {

	PriorityQueue<State> toVisit
	Map<State, Integer> gScore
	Map<State, Integer> fScore
	Map<State, State> previous
	Function2<Integer, Integer, Boolean> compare
	State current

	new() {
		current = null
	}

	new(State initial_, boolean isMin) {
		initialize(initial_, isMin)
	}

	new(State initial) {
		this(initial, true)
	}

	def initialize(State initial_, boolean isMin) {
		toVisit = new PriorityQueue<State> [ e1, e2 |
			isMin ? Integer::compare(fScore.get(e1), fScore.get(e2)) : Integer::compare(fScore.get(e2), fScore.get(e1))
		]
		compare = isMin ? [p, q|p < q] : [p, q|q < p]
		current = initial_
		gScore = newHashMap
		gScore.put(current, 0)
		fScore = newHashMap
		fScore.put(current, current.minToGoal)
		previous = newHashMap
	}

	def private step() {
		current.neighbours.forEach [
			val state = it.key
			val newGScore = gScore.get(current) + it.value
			val currentScore = gScore.get(state)
			if (currentScore === null || compare.apply(newGScore, currentScore)) {
				previous.put(state, current)
				toVisit.remove(state)
				gScore.put(state, newGScore)
				fScore.put(state, newGScore + state.minToGoal)
				toVisit.add(state)
			}
		]
		toVisit.poll
	}

	def minPath() {
		checkInitialize
		val path = newArrayList(current)
		var tmp = current
		while (previous.containsKey(tmp)) {
			tmp = previous.get(tmp)
			path.add(tmp)
		}
		path.reverse
	}

	def getMinDistance() {
		checkInitialize
		gScore.get(current)
	}

	def run() {
		checkInitialize
		while (!current.isGoal) {
			current = step()
			checkInitialize
		}
		this
	}

	private def checkInitialize() {
		if(current === null) throw new NotInitializedException
	}
}
