package advent2022

import adventutils.astar.AStar
import adventutils.astar.State
import adventutils.input.InputLoader
import java.util.HashMap
import java.util.List
import java.util.Map

class Day19 {

	static final List<Blueprint> blueprints = new InputLoader(2022, 19).inputs.map[new Blueprint(it)]
	static int MAX_TIME
	static int MAX_PRODUCTION

	static def init_max(int minutes) {
		MAX_TIME = minutes
		MAX_PRODUCTION = sum(1, MAX_TIME - 1)
	}

	static Blueprint current_blueprint

	def static void main(String[] args) {

		val aStar = new AStar()

		init_max(24)
		println((0 ..< blueprints.size).fold(0) [ acc, v |
			current_blueprint = blueprints.get(v)
			aStar.initialize(new RobotState)
			acc + (MAX_PRODUCTION - aStar.run.minDistance) * (v + 1)
		])
		
		init_max(32)
		println((0..2).fold(1)[acc,v|
			current_blueprint = blueprints.get(v)
			aStar.initialize(new RobotState)
			acc * (MAX_PRODUCTION - aStar.run.minDistance)
		])
	}

	// The class represents either
	// * a quantity of resources, either possessed or owed
	// * a quantity of robots at disposal, as they are of the same names
	static class Resources {

		Map<String, Integer> content

		new() {
			content = newHashMap
		}

		new(List<Integer> input) {
			this()
			if(input.get(0) != 0) content.put("ore", input.get(0))
			if(input.get(1) != 0) content.put("clay", input.get(1))
			if(input.get(2) != 0) content.put("obsidian", input.get(2))
		}

		new(Map<String, Integer> other) {
			content = other
		}

		def contains(Resources other) {
			other.content.entrySet.fold(true) [ acc, e |
				acc && get(e.key) >= e.value
			]
		}

		def get(String s) {
			content.getOrDefault(s, 0)
		}

		def has(String s) {
			get(s) != 0
		}

		def lacks(String s) {
			!has(s)
		}

		// This subtract operation is only meant to be called
		// when this contains other
		def subtract(Resources other) {
			val output = new HashMap(content)
			other.content.forEach [ k, v |
				val new_val = output.get(k) - v
				new_val == 0 ? output.remove(k) : output.put(k, new_val)
			]
			new Resources(output)
		}

		def add(Resources other) {
			val output = new HashMap(content)
			other.content.forEach [ k, v |
				output.merge(k, v)[i, j|i + j]
			]
			new Resources(output)
		}

		def addRobot(String s) {
			val output = new HashMap(content)
			output.merge(s, 1)[i, j|i + j]
			new Resources(output)
		}

		def times(int n) {
			val output = newHashMap
			content.forEach[k, v|output.put(k, v * n)]
			new Resources(content)
		}

		override toString() {
			content.toString
		}

		override hashCode() {
			content.hashCode
		}

		override equals(Object other) {
			switch other {
				Resources: other.content.equals(content)
				default: false
			}
		}
	}

	static class Blueprint {

		final Map<String, Resources> robots_costs

		new(String line) {
			robots_costs = newHashMap
			val split1 = line.split(": ").get(1).split("\\. ").map[split(" ")]
			robots_costs.put("ore", new Resources(newHashMap("ore" -> Integer.parseInt(split1.get(0).get(4)))))
			robots_costs.put("clay", new Resources(newHashMap("ore" -> Integer.parseInt(split1.get(1).get(4)))))
			val split2 = split1.get(2)
			robots_costs.put("obsidian", new Resources(newHashMap("ore" -> Integer.parseInt(split2.get(4)),
				"clay" -> Integer.parseInt(split2.get(7)))))
			val split3 = split1.get(3)
			robots_costs.put("geode", new Resources(newHashMap("ore" -> Integer.parseInt(split3.get(4)),
				"obsidian" -> Integer.parseInt(split3.get(7)))))
		}

		override toString() {
			robots_costs.toString
		}

		// This generates a map of the duration it would take, starting from an initial configuration
		// of resources and a production, to be able to craft each of the robots type. 
		// When the production of a certain kind of resource is 0, then the robot can never be crafted
		// and does not appear in the resulting map. This also returns the resulting resource after
		// waiting enough time and eventually crafting the robot by paying its cost
		def durationsToBuild(Resources initial, Resources production) {
			val output = newHashMap
			robots_costs.forEach [ key, cost |
				if ((cost.lacks("ore") || production.has("ore")) && (cost.lacks("clay") || production.has("clay")) &&
					(cost.lacks("obsidian") || production.has("obsidian"))) {
					var i = 0
					var current_resources = initial
					while (!current_resources.contains(cost)) {
						current_resources = current_resources.add(production)
						i++
					}
					output.put(key, i -> current_resources.subtract(cost))
				}
			]
			output
		}

		def maxRequested(String s) {
			robots_costs.values.maxBy[it.get(s)].get(s)
		}
	}

	def static sum(int lower_bound, int upper_bound) {
		(upper_bound - lower_bound + 1) * (lower_bound + upper_bound) / 2
	}

	static class RobotState implements State {

		final Resources robots
		final Resources resources
		final int time

		final int _hashCode
		final boolean _isGoal
		final int _minToGoal

		new(Resources _robots, Resources _resources, int _time) {
			robots = _robots
			resources = _resources
			time = _time

			_hashCode = ("" + robots + resources + time).hashCode
			_isGoal = time == MAX_TIME
			_minToGoal = 0
		}

		new() {
			this(new Resources(newHashMap("ore" -> 1)), new Resources, 0)
		}

		override isGoal() {
			_isGoal
		}

		override minToGoal() {
			_minToGoal
		}

		override neighbours() {
			val output = newArrayList
			val remaining_duration = MAX_TIME - time
			var durations = current_blueprint.durationsToBuild(resources, robots).filter [ k, v |
				v.key < remaining_duration
			]

			// If we can craft a geode robot now, we do it
			if (durations.containsKey("geode") && durations.get("geode").key == 0)
				durations = durations.filter[k, v|k.equals("geode")]
			// Otherwise we remove from the possibilities the robots that we have enough of
			else 
				durations = durations.filter[k, v|k.equals("geode") || current_blueprint.maxRequested(k) > robots.get(k)]
				
			if (durations.isEmpty) {
				output.add(new RobotState(
					new Resources(robots.content),
					resources.add(robots.times(remaining_duration)),
					MAX_TIME
				) as State -> sum(1, MAX_TIME - (time + 1)))
			} else {
				durations.forEach [ k, v |
					if (k.equals("geode")) {
						val new_robots = new Resources(robots.content)
						val new_resources = v.value.add(new_robots)
						val new_time = time + v.key + 1
						output.add(
							new RobotState(new_robots, new_resources, new_time) as State ->
								sum(MAX_TIME - (new_time - 1), MAX_TIME - (time + 1))
						)
					} else {
						val new_robots = robots.addRobot(k)
						val new_resources = v.value.add(robots)
						val new_time = time + v.key + 1
						output.add(
							new RobotState(new_robots, new_resources, new_time) as State ->
								sum(MAX_TIME - new_time, MAX_TIME - (time + 1))
						)
					}
				]
			}
			output
		}

		override hashCode() {
			_hashCode
		}

		override equals(Object other) {
			switch (other) {
				RobotState: other.time == time && other.robots.equals(robots) && other.resources.equals(resources)
				default: false
			}
		}

		override toString() {
			"[[" + robots.toString + " ; " + resources.toString + " ; " + time + "]]"
		}
	}
}
