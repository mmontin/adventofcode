package advent2016.puzzle24

import adventutils.astar.State
import adventutils.geometry.Coordinate
import java.util.HashSet
import java.util.Set

class OverState implements State {
	
	Coordinate currentPosition
	Set<Coordinate> toVisit
	int code
	
	new(Coordinate currentPosition_, Set<Coordinate> toVisit_) {
		currentPosition = currentPosition_
		toVisit = toVisit_
		code = currentPosition.hashCode * toVisit.hashCode
	}
	
	override isGoal() {
		toVisit.isEmpty && currentPosition.equals(Launcher.initial)
	}
	
	override minToGoal() {
		currentPosition.manhattanDistanceTo(Launcher.initial)
	}
	
	override neighbours() {
		if (toVisit.equals(newHashSet(Launcher.initial)))
			newArrayList(new Pair(new OverState(Launcher.initial,newHashSet) as State,Launcher.distances.get(newHashSet(currentPosition,Launcher.initial))))
		else
			toVisit.filter[!equals(Launcher.initial)].map[
				val newToVisit = new HashSet(toVisit)
				newToVisit.remove(it)
				new Pair(new OverState(it,newToVisit) as State, Launcher.distances.get(newHashSet(it,currentPosition)))
			].toList
	}
	
	override hashCode() {
		code
	}
	
	override equals(Object other) {
		val o = other as OverState
		currentPosition.equals(o.currentPosition) && toVisit.equals(o.toVisit) 
	}
}