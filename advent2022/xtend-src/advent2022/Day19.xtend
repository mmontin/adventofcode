package advent2022

class Day19 {
	
//	static final List<Blueprint> blueprints = new InputLoader(2022, 19).inputs.map[new Blueprint(it)]
//
//	// Arbitrary max_number to minimize the distance to
//	final static int MAX_GEODE = 1000
//	 static int MAX_TIME = 24
//
//	def static void main(String[] args) {
//		MAX_GEODE * MAX_TIME - new AStar(new RobotsState(blueprints.get(v-1))).run.minDistance
//		println((1..blueprints.size).fold(0)[acc,v|
//			acc + v * (MAX_GEODE * MAX_TIME - new AStar(new RobotsState(blueprints.get(v-1))).run.minDistance)
//		])
//	}
//	
//	static class Resources {
//
//		int ore
//		int clay
//		int obsidian
//		int geode
//
//		new() {
//			this(0, 0, 0, 0)
//		}
//
//		new(int _ore, int _clay, int _obsidian, int _geode) {
//			ore = _ore
//			clay = _clay
//			obsidian = _obsidian
//			geode = _geode
//		}
//
//		new(List<Integer> input) {
//			this(input.get(0), input.get(1), input.get(2), input.get(3))
//		}
//
//		new(Resources other) {
//			this(other.ore, other.clay, other.obsidian, other.geode)
//		}
//
//		def includedIn(Resources other) {
//			ore <= other.ore && clay <= other.clay && obsidian <= other.obsidian && geode <= other.geode
//		}
//
//		def add(Resources other) {
//			new Resources(ore + other.ore, clay + other.clay, obsidian + other.obsidian, geode + other.geode)
//		}
//		
//		def addRobot(String s) {
//			add(switch s {
//				case "ore" : new Resources(1,0,0,0)
//				case "clay" : new Resources(0,1,0,0)
//				case "obsidian" : new Resources(0,0,1,0)
//				default : new Resources(0,0,0,1)
//			})
//		}
//		
//		def get(String s) {
//			switch s {
//				case "ore" : ore
//				case "clay" : clay
//				case "obsidian" : obsidian
//				default : geode
//			}
//		}
//
//		def subtract(Resources other) {
//			new Resources(ore - other.ore, clay - other.clay, obsidian - other.obsidian, geode - other.geode)
//		}
//
//		def times(int n) {
//			new Resources(ore * n, clay * n, obsidian * n, geode * n)
//		}
//
//		override toString() {
//			"(" + ore + "," + clay + "," + obsidian + "," + geode + ")"
//		}
//
//		override hashCode() {
//			toString.hashCode
//		}
//
//		override equals(Object other) {
//			switch other {
//				Resources: other.clay == clay && other.ore == ore && other.obsidian == obsidian && other.geode == geode
//				default: false
//			}
//		}
//	}
//
//	static class Blueprint {
//
//		final Map<String, Resources> robots_costs
//
//		new(String line) {
//			robots_costs = newHashMap
//			val split1 = line.split(": ").get(1).split("\\. ").map[split(" ")]
//			robots_costs.put("ore", new Resources(Integer.parseInt(split1.get(0).get(4)), 0, 0, 0))
//			robots_costs.put("clay", new Resources(Integer.parseInt(split1.get(1).get(4)), 0, 0, 0))
//			val split2 = split1.get(2)
//			robots_costs.put("obsidian",
//				new Resources(Integer.parseInt(split2.get(4)), Integer.parseInt(split2.get(7)), 0, 0))
//			val split3 = split1.get(3)
//			robots_costs.put("geode",
//				new Resources(Integer.parseInt(split3.get(4)), 0, Integer.parseInt(split3.get(7)), 0))
//		}
//
//		override toString() {
//			robots_costs.toString
//		}
//
//		// This generates a map of the duration it would take, starting from an initial configuration
//		// of resources and a production, to be able to craft each of the robots type. 
//		// WHen the production of a certain kind of resource is 0, then the robot can never be crafted
//		// and does not appear in the resulting map.
//		def durationsToBuild(Resources initial, Resources production) {
//			val output = newHashMap
//			robots_costs.forEach [key,value|
//				if (!(value.ore != 0 && production.ore == 0) && 
//					!(value.clay != 0 && production.clay == 0) &&
//					!(value.obsidian != 0 && production.obsidian == 0)
//				) {
//					var i = 1
//					var current_resources = initial
//					while (!value.includedIn(current_resources)) {
//						current_resources = current_resources.add(production)
//						i ++
//					}
//					output.put(key,i)
//				}	
//			]
//			output
//		}
//		
//		def maxRequested(String s) {
//			robots_costs.values.fold(0)[acc,v |
//				Math.max(acc,switch s {
//					case "ore" : v.ore
//					case "clay" : v.clay
//					case "obsidian" : v.obsidian
//					default : 0
//				})
//			]
//		}
//	}
//
//	static class RobotsState implements State {
//
//		// Let's use Resources to keep track of the number of both the actual resources
//		// we possess, and the robots we possess for each type.
//		final Blueprint blueprint
//		final Resources robots
//		final Resources resources
//		final int time
//
//		final int _hashCode
//
//		new(Blueprint _blueprint) {
//			this(_blueprint, new Resources(1, 0, 0, 0), new Resources, 0)
//		}
//
//		new(Blueprint _blueprint, Resources _robots, Resources _resources, int _time) {
//			blueprint = _blueprint
//			robots = _robots
//			resources = _resources
//			time = _time
//
//			_hashCode = ("" + blueprint + robots + resources + time).hashCode
//		}
//
//		override isGoal() {
//			time == MAX_TIME
//		}
//
//		override minToGoal() {
//			// Best case scenario is we can craft a geode robot every minute starting now
//			val remaining_time = MAX_TIME - time ;
//			remaining_time * MAX_GEODE - (((remaining_time - 1) * (remaining_time - 2))/2 + remaining_time * robots.geode) 
//		}
//
//		override neighbours() {
//			val output = newArrayList
//			val remaining_duration = MAX_TIME - time
//			val durations = blueprint.durationsToBuild(resources, robots).filter[k,v|v < remaining_duration]
//			// If we can craft a geode robot now, we do it
//			if (durations.containsKey("geode") && durations.get("geode") == 0) 
//				durations.filter[k,v|k.equals("geode")]
//			// Otherwise we remove from the possibilities the robots that we have enough of
//			else 
//				durations.filter[k,v|k.equals("geode") || blueprint.maxRequested(k) > robots.get(k)]
//			if (durations.isEmpty) {
//				// Here there's not way to build any other robot in time
//				output.add(new RobotsState(
//					blueprint,
//					robots,
//					resources.add(robots.times(remaining_duration)),
//					MAX_TIME
//				) as State -> remaining_duration * (MAX_GEODE - robots.geode))
//			} else {
//				durations.forEach[k,v|
//					output.add(new RobotsState(
//						blueprint,
//						robots.addRobot(k),
//						resources.add(robots.times(v)).subtract(blueprint.robots_costs.get(k)),
//						time + v
//					) as State -> v * (MAX_GEODE - robots.geode))
//				]
//			}
//			output
//		}
//
//		override toString() {
//			"ROBOTS : " + robots + " ; RESOURCES : " + resources + " ; time : " + time
//		}
//
//		override hashCode() {
//			_hashCode
//		}
//
//		override equals(Object other) {
//			switch other {
//				RobotsState: other.time == time && other.resources.equals(resources) && other.robots.equals(robots)
//				default: false
//			}
//		}
//	}
}