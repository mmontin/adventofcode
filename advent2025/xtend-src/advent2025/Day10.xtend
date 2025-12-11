package advent2025

import adventutils.collection.CollectionUtils
import adventutils.input.InputLoader
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set
import org.ojalgo.optimisation.ExpressionsBasedModel
import org.ojalgo.optimisation.Variable

class Day10 {
	def static void main(String[] args) {
		val machines = new InputLoader(2025, 10).inputs.map [
			val split = it.split(" ")
			val target_state = split.get(0).toCharArray.map[it + ""].fold(newArrayList) [ acc, el |
				switch el {
					case ".": CollectionUtils.cons(false, acc)
					case "#": CollectionUtils.cons(true, acc)
					default: acc
				}
			]
			val available_buttons = split.subList(1, split.size - 1).map [
				it.toCharArray.map[it + ""].fold(newHashSet) [ acc, el |
					try {
						acc.add(Integer.parseInt(el))
						acc
					} catch (NumberFormatException _)
						acc
				]
			].toSet
			val target_voltages = split.last.substring(1, split.last.length - 1).split(",").map[Integer.parseInt(it)]
			new Machine1(target_state, available_buttons) -> new Machine2(target_voltages, available_buttons)
		]
		val res = machines.fold(0 -> 0) [ acc, el |
			val left = acc.key + new AStar(el.key).run.minDistance
			val right = acc.value + el.value.solve
			left -> right
		]
		println("Part 1: " + res.key)
		println("Part 2: " + res.value)
	}

	static class Machine2 {
		// We maintain the invariant that these equations are not empty 
		// and cannot be reduced by one another
		List<Pair<ArrayList<Integer>, Integer>> equations

		new(List<Integer> target_voltages, Set<HashSet<Integer>> available_buttons) {
			equations = (0 ..< target_voltages.size).fold(newArrayList) [ acc, i |
				val new_equation = (0 ..< available_buttons.size).fold(newArrayList) [ l, j |
					if(available_buttons.get(j).contains(i)) l.add(j)
					l
				]
				CollectionUtils.cons(new_equation -> target_voltages.get(i), acc)
			]
		}

		def int solve() {
			val model = new ExpressionsBasedModel
			val Variable[] variables = equations.fold(newHashSet) [ acc, el |
				CollectionUtils.consAll(el.key, acc)
			].map[model.addVariable.lower(0).integer(true).weight(1)].toList
			equations.forEach [ eq |
				val expression = model.addExpression.level(eq.value)
				eq.key.forEach[v|expression.set(variables.get(v), 1)]
			]
			val result = model.minimise;
			(0 ..< variables.size).fold(0)[acc, i|acc + Math.round(result.get(i).doubleValue) as int]
		}
	}

	static class Machine1 implements State {

		List<Boolean> target_state
		List<Boolean> current_state
		Set<HashSet<Integer>> available_buttons

		new(List<Boolean> target_state_, Set<HashSet<Integer>> available_buttons_) {
			target_state = target_state_
			current_state = new ArrayList(target_state.size)
			(1 .. target_state.size).forEach[current_state.add(false)]
			available_buttons = available_buttons_
		}

		new(Machine1 other, Set<Integer> button) {
			target_state = other.target_state
			current_state = new ArrayList(other.current_state)
			button.forEach[current_state.set(it, !current_state.get(it))]
			available_buttons = new HashSet(other.available_buttons)
			available_buttons.remove(button)
		}

		override isGoal() {
			target_state.equals(current_state)
		}

		override minToGoal() {
			1
		}

		override neighbours() {
			available_buttons.map[new Machine1(this, it) -> 1]
		}

		override hashCode() {
			current_state.hashCode
		}

		override equals(Object other) {
			switch other {
				Machine1: other.current_state == this.current_state
				default: false
			}
		}
	}
}
