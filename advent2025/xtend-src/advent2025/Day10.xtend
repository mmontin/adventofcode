package advent2025

import adventutils.collection.ListUtils
import adventutils.input.InputLoader
import adventutils.maths.Rational
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
					case ".": ListUtils.cons(false, acc)
					case "#": ListUtils.cons(true, acc)
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

	static class Equation {
		Set<Integer> variables
		Integer value

		new(Set<Integer> variables_, Integer value_) {
			variables = variables_
			value = value_
		}

		def reduceWith(Equation other) {
			if (variables.containsAll(other.variables)) {
				variables.removeAll(other.variables)
				value = value - other.value
				true
			} else
				false
		}

		def solved() {
			variables.size == 1
		}

		override toString() {
			variables.toString + " = " + value
		}

		def isEmpty() {
			variables.isEmpty
		}

		def getCoefficients(int max_variable) {
			val size = max_variable + 1
			val res = new ArrayList(size)
			(0 ..< size).forEach[i|res.add(variables.contains(i) ? Rational.ONE : Rational.ZERO)]
			res
		}

		override hashCode() {
			variables.hashCode + value.hashCode
		}

		override equals(Object other) {
			switch other {
				Equation: other.variables == variables && other.value == value
				default: false
			}
		}
	}

	static class Machine2 {
		// We maintain the invariant that these equations are not empty 
		// and cannot be reduced by one another
		Set<Equation> equations

		new(List<Integer> target_voltages, Set<HashSet<Integer>> available_buttons) {
			equations = newHashSet;
			(0 ..< target_voltages.size).forEach [ i |
				val new_equation = (0 ..< available_buttons.size).fold(newHashSet) [ s, j |
					if (available_buttons.get(j).contains(i))
						s.add(j)
					s
				]
				addEquation(new Equation(new_equation, target_voltages.get(i)))
			]
		}

		new(Set<Equation> equations_) {
			equations = new HashSet(equations_)
		}

		def void addEquation(Equation nEq) {
			if (!nEq.isEmpty) {
				val new_equations = newHashSet
				val new_equations_reduced = newHashSet
				val nEq_reduced = equations.fold(false) [ acc, eq |
					(eq.reduceWith(nEq) ? new_equations_reduced : new_equations).add(eq)
					acc || nEq.reduceWith(eq)
				]
				(nEq_reduced ? new_equations_reduced : new_equations).add(nEq)
				equations = new_equations
				new_equations_reduced.forEach[this.addEquation(it)]
			}
		}

		def int solve() {
			val model = new ExpressionsBasedModel
			val Variable[] variables = equations.fold(newHashSet) [ acc, el |
				acc.addAll(el.variables);
				acc
			].map[model.addVariable("x" + it).lower(0).integer(true).weight(1)].toList
			equations.forEach [ eq |
				val expression = model.addExpression.level(eq.value)
				eq.variables.forEach[v|expression.set(variables.get(v), 1)]
			]
			val result = model.minimise;
			(0 ..< variables.size).fold(0)[acc, i | acc + Math.round(result.get(i).doubleValue) as int]
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
