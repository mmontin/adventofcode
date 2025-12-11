package adventutils

import java.util.List
import java.util.function.Function

class PatternRunner<S> {

	// Series of generated states, until a loop occurs
	List<S> states
	// Index of the first element in the list of states which begins the loop
	int beginning_of_cycle
	// Number of elements in the cycle, before it loops back to the first
	int cycle_length

	new(S initial_state, Function<S, S> fun) {
		states = newArrayList
		var current = initial_state
		var i = 0
		var pos = -1
		while (pos == -1) {
			states.add(current)
			current = fun.apply(current)
			i++
			pos = states.indexOf(current)
		}
		beginning_of_cycle = pos
		cycle_length = i - pos
	}

	def getBeginningOfCycle() {
		beginning_of_cycle
	}
	
	def getCycleLength() {
		cycle_length
	}

	def getStateAt(int rank) {
		states.get((rank - beginning_of_cycle) % cycle_length + beginning_of_cycle)
	}
}
