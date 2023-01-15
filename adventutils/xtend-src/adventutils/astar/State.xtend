package adventutils.astar

interface State {
	
	// Is this state final
	def boolean isGoal()
	
	// Minimal estimation to go from this state to any goal state
	def int minToGoal()
	
	// Possible states that can be reached from this state, along with their distances
	def Iterable<Pair<State ,Integer>> neighbours()
	
	override boolean equals(Object other)
	override int hashCode()
}