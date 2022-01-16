package advent2021

import java.util.List

abstract class State {
	
	def abstract boolean isGoal()
	def abstract int minToGoal()
	def abstract List<Pair<State,Integer>> neighbours()
	override abstract boolean equals(Object other)
	override abstract int hashCode()
}