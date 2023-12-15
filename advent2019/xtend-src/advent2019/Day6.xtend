package advent2019

import adventutils.input.InputLoader
import adventutils.collection.ListUtils
import adventutils.pathfinding.AStar
import adventutils.pathfinding.State
import java.util.HashSet
import java.util.List
import java.util.Set

class Day6 {

	def static void main(String[] args) {

		val List<Planet> orbits = newArrayList
		new InputLoader(2019, 6).inputs.forEach [
			val split = it.split("\\)")
			val child = ListUtils.getOrDefault(orbits, new Planet(split.get(1)))
			val parent = ListUtils.getOrDefault(orbits, new Planet(split.get(0)))
			parent.addChild(child)
		]

		val init = orbits.findFirst[it.name.equals("COM")]
		println(init.compute(0))

		val you = orbits.findFirst[it.name.equals("YOU")]
		println(new AStar(you).run.minDistance - 2)

	}

	def static int compute(Planet p, int seed) {
		p.children.fold(seed) [ acc, el |
			acc + compute(el, seed + 1)
		]
	}

	static class Planet implements State {

		String name
		Set<Planet> children
		Planet parent

		new(String name_) {
			name = name_
			children = newHashSet
			parent = null
		}

		def addChild(Planet child) {
			children.add(child)
			child.parent = this
		}

		override hashCode() {
			name.hashCode
		}

		override equals(Object other) {
			(other as Planet).name.equals(name)
		}

		override isGoal() {
			name.equals("SAN")
		}

		override minToGoal() {
			0
		}

		override neighbours() {
			val output = new HashSet(children)
			if (parent !== null)
				output.add(parent)
			output.map[it -> 1]
		}

	}
}
