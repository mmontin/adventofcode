package advent2022

import adventutils.astar.State
import adventutils.input.InputLoader
import java.util.List
import java.util.Map
import adventutils.astar.AStar
import java.util.Set
import java.util.HashSet

class Day16 {

	static final Map<String, Integer> valves_flows = newHashMap
	static final Map<String, List<String>> valves_paths = newHashMap
	static final Map<String, Map<String, Integer>> final_valves_distances = newHashMap
	static final int max_duration = 30
	static final int learning_time = 4
	static int max_flow_per_unit

	def static initialize_valves() {
		new InputLoader(2022, 16).inputs.forEach [
			var split1 = it.split("; tunnels lead to valves ")
			if(split1.size == 1) split1 = it.split("; tunnel leads to valve ")
			val destinations = split1.get(1).split(", ").toList
			val valve = split1.get(0).split(" ").get(1)
			val flow = Integer.parseInt(split1.get(0).split("=").get(1))
			if(valve.equals("AA") || flow > 0) valves_flows.put(valve, flow)
			valves_paths.put(valve, destinations)
		]
	}

	static String current_final_location = ""

	def static update_valves() {
		// We compute the minimum distance between all the valves
		// that either are the first one (AA) or have a non-zero flow
		// This requires to call a very simple A* a bunch of times
		// For that, we use a state that consists of a String which 
		// are the locations where valves are. The final state will
		// change over these calls and is stored in current_final_location
		// We start by retrieving the name of all the relevant valves
		// In the process, we also add associated submaps into final_valves_distances
		// This will ensure that they are present later on and prevent a lot
		// of annoying related test cases
		val valves_to_consider = valves_flows.entrySet.map[final_valves_distances.put(key, newHashMap); key].toList

		// Then we populate the maps using A* between nodes
		// This should be instantaneous as the state space is very small
		for (i : 0 ..< valves_to_consider.size)
			for (j : i + 1 ..< valves_to_consider.size) {
				// We retrieve the source and targets for the A* algorithm
				val current_source = valves_to_consider.get(i)
				val current_target = valves_to_consider.get(j)
				// We set the current final destination to reach
				current_final_location = current_target
				// We compute the current shortest distance between the nodes
				val current_shortest_distance = new AStar(new StringState(current_source)).run.minDistance
				// We add two edges to the graph with those distances
				final_valves_distances.get(current_target).put(current_source, current_shortest_distance)
				final_valves_distances.get(current_source).put(current_target, current_shortest_distance)
			}
		valves_flows.remove("AA")
	}

	static class StringState implements State {

		String name

		new(String _name) {
			name = _name
		}

		override isGoal() {
			name.equals(current_final_location)
		}

		override minToGoal() {
			1
		}

		override neighbours() {
			valves_paths.get(name).map [ v |
				new StringState(v) as State -> 1
			]
		}

		override equals(Object other) {
			switch other {
				StringState: name.equals(other.name)
				default: false
			}
		}

		override hashCode() {
			name.hashCode
		}
	}

	def static void main(String[] args) {
		// We retrieve the information contained in the input
		initialize_valves
		// We initialize the maximum flow amount per unit of time
		max_flow_per_unit = valves_flows.values.fold(0)[acc, v|acc + v]
		// We create a better graph using A*
		update_valves
		// We have all the we need to tackle the exercise
		// For part 1, we run A* on the Tunnel state
		println(max_flow_per_unit * max_duration - new AStar(new Tunnel).run.minDistance)
		// For part 2, we run it on the TunnelEl state
		println(max_flow_per_unit * (max_duration - learning_time) - new AStar(new TunnelEl).run.minDistance)
		new AStar(new TunnelEl).run.minPath.forEach[println(it)]
	}

	static class Tunnel implements State {

		final int time
		final Set<String> open_valves
		final String position

		final int currentFlow
		final boolean _isGoal
		final int _hashCode
		final int _minToGoal

		new() {
			this(0, newHashSet, "AA")
		}

		new(int _time, Set<String> _open_valves, String _position) {
			time = _time
			open_valves = _open_valves
			position = _position

			currentFlow = computeCurrentFlow
			_isGoal = time == max_duration
			_hashCode = time + open_valves.hashCode + position.hashCode
			_minToGoal = computeMinToGoal
		}

		def computeCurrentFlow() {
			open_valves.fold(0)[acc, v|acc + valves_flows.get(v)]
		}

		override isGoal() {
			_isGoal
		}

		override minToGoal() {
			_minToGoal
		}

		def computeMinToGoal() {
			// This is the tricky part. The ideal path is if we could open one valve 
			// every 2 second (1 sec to go there and 1 sec to open), starting from
			// the more enticing to the less enticing, up until there's no more time
			// We thus start by gathering the closed valves and sort them from the 
			// the most enticing to the less ones (the 0 ones will appear on the right
			// which is the same as if we removed them from the list
			val remaining_valves = valves_flows.filter[k, v|!open_valves.contains(k)].entrySet.toList.sortBy[-value].map [
				value
			]

			// We compute how many of those valves could theoretically be open
			val number_of_possibly_open_valves = (max_duration - time) / 2

			// We collect the current flow, which will be the starting point of the computation
			var flow = currentFlow

			// We will collect the optimized flow per round, starting from 0
			var total_flow = 0

			// For each two minutes, we add the current_flow and the new flow with the most enticing valve open
			for (i : 0 ..< number_of_possibly_open_valves) {
				total_flow += max_flow_per_unit - flow
				val next_value = i >= remaining_valves.size ? 0 : remaining_valves.get(i)
				flow = flow + next_value
				total_flow += max_flow_per_unit - flow
			}

			// We return the ideal total flow
			total_flow
		}

		override neighbours() {
			// The neighbours consists in the accessible in the remaining time, and yet to be open 
			// valves with the duration it takes to get there + 1 minute to open the valve
			val output = valves_flows.keySet.filter[!open_valves.contains(it)].fold(newArrayList) [ acc, current_valve |
				val duration_journey_open = final_valves_distances.get(position).get(current_valve) + 1
				if (time + duration_journey_open < max_duration) {
					val new_open_valves = new HashSet(open_valves)
					new_open_valves.add(current_valve)
					acc.add(new Tunnel(
						time + duration_journey_open,
						new_open_valves,
						current_valve
					) as State -> (max_flow_per_unit - currentFlow) * duration_journey_open)
				}
				acc
			]
			// If there's not reachable valve, we can still wait until 30 minutes
			if (output.isEmpty) {
				val time_remaining = max_duration - time
				output.add(new Tunnel(
					max_duration,
					new HashSet(open_valves),
					position
				) as State -> (max_flow_per_unit - currentFlow) * time_remaining)
			}
			output
		}

		override boolean equals(Object other) {
			switch other {
				Tunnel: other.time == time && other.open_valves.equals(open_valves) && other.position.equals(position)
				default: false
			}
		}

		override int hashCode() {
			_hashCode
		}
	}

	static class TunnelEl implements State {

		final int time
		final Set<String> open_valves
		// Here we need to be smart and store the future position
		// as well as in how many time steps we will reach it
		// If it's 0, it means we are already there
		final Pair<String, Integer> my_position
		final Pair<String, Integer> el_position

		final int _hashCode
		final int _minToGoal
		final boolean _isGoal
		public final int currentFlow

		new() {
			this(learning_time, newHashSet, "AA" -> 0, "AA" -> 0)
		}

		new(int _time, Set<String> _open_valves, Pair<String, Integer> _my_position,
			Pair<String, Integer> _el_position) {
			open_valves = _open_valves

			my_position = _my_position
			el_position = _el_position

			time = _time

			_hashCode = makeHashCode
			_minToGoal = makeMinToGoal
			_isGoal = time == max_duration
			currentFlow = makeCurrentFlow
		}

		def makeCurrentFlow() {
			open_valves.fold(0)[acc, v|acc + valves_flows.get(v)]
		}

		def makeMinToGoal() {
			// Here we are going to proceed as before, with the exception
			// that the ideal path can now have the two most enticing valves
			// being open every 2 minutes
			val remaining_valves = valves_flows.filter[k, v|!open_valves.contains(k)].entrySet.toList.sortBy[-value].map [
				value
			].toList

			// We collect the current flow, which will be the starting point of the computation
			var flow = currentFlow

			// We will collect the optimized flow per round, starting from 0
			var cumulated_flow = 0

			// This will tell us whether to open valves or not
			var open_valves = true

			// For each two minutes, we add the current_flow and the new flow
			// with the two most enticing valve open
			for (i : time ..< max_duration) {
				cumulated_flow += flow
				if (open_valves) {
					val next_value_1 = remaining_valves.isEmpty ? 0 : remaining_valves.remove(0)
					val next_value_2 = remaining_valves.isEmpty ? 0 : remaining_valves.remove(0)
					flow = flow + next_value_1 + next_value_2
				}
				open_valves = !open_valves
			}

			// We return the ideal total flow
			(max_duration - time) * max_flow_per_unit - cumulated_flow
		}

		def makeHashCode() {
			time + open_valves.hashCode + my_position.hashCode + el_position.hashCode
		}

		override isGoal() {
			_isGoal
		}

		override minToGoal() {
			_minToGoal
		}

		override neighbours() {

			val remaining_duration = max_duration - time

			// Computing my neighbours. If my journey is not over then
			// I have to finish it. Otherwise, I can go to whichever else valve
			// is still to be opened as long as it is reachable within the
			// remaining duration.
			val my_neighbours = newArrayList
			if (my_position.value > 0)
				my_neighbours.add(my_position.key -> my_position.value)
			else
				my_neighbours.addAll(valves_flows.keySet.filter [
					!open_valves.contains(it) && !it.equals(el_position.key)
				].map [
					it -> final_valves_distances.get(my_position.key).get(it) + 1
				].filter[it.value < remaining_duration])

			// Computing the neighbours of the elephant in the exact same fashion
			val el_neighbours = newArrayList
			if (el_position.value > 0)
				el_neighbours.add(el_position.key -> el_position.value)
			else
				el_neighbours.addAll(valves_flows.keySet.filter [
					!open_valves.contains(it) && !it.equals(my_position.key)
				].map [
					it -> final_valves_distances.get(el_position.key).get(it) + 1
				].filter[it.value < remaining_duration])

			// Now its time to do some kind of a cartesian product between the two
			// The idea is to remove possibilities where both go to the same place,
			// to accumulate all possibilities otherwise, by taking into account the
			// shortest path that remains to be completed by one of the two peers.	
			val output = newArrayList
			my_neighbours.forEach [ my_next |
				el_neighbours.forEach [ el_next |
					if (!my_next.key.equals(el_next.key)) {
						val next_open_valves = new HashSet(open_valves)
						switch (diff : my_next.value - el_next.value) {
							// Here I arrive first
							case diff < 0: {
								next_open_valves.add(my_next.key)
								output.add(new TunnelEl(
									time + my_next.value,
									next_open_valves,
									my_next.key -> 0,
									el_next.key -> (el_next.value - my_next.value)
								) as State -> my_next.value * (max_flow_per_unit - currentFlow))
							}
							// Here the elephant arrives first
							case diff > 0: {
								next_open_valves.add(el_next.key)
								output.add(new TunnelEl(
									time + el_next.value,
									next_open_valves,
									my_next.key -> (my_next.value - el_next.value),
									el_next.key -> 0
								) as State -> el_next.value * (max_flow_per_unit - currentFlow))
							}
							// We both arrive at the same time
							default: {
								next_open_valves.add(my_next.key)
								next_open_valves.add(el_next.key)
								output.add(new TunnelEl(
									time + my_next.value,
									next_open_valves,
									my_next.key -> 0,
									el_next.key -> 0
								) as State -> my_next.value * (max_flow_per_unit - currentFlow))
							}
						}
					}
				]
			]
			// At that point, there should be neighbours unless for a few cases...
			if (output.isEmpty) {
				// First possible case is that there's no reachable open valve in time
				// The only remaining thing to do is to wait for time to end
				if (my_neighbours.size == 0 && el_neighbours.size == 0) {
					output.add(new TunnelEl(
						max_duration,
						new HashSet(open_valves),
						my_position.key -> my_position.value,
						el_position.key -> el_position.value
					) as State -> remaining_duration * (max_flow_per_unit - currentFlow))
				// second possible case is that only El can go somewhere
				} else if (my_neighbours.size == 0) {
					el_neighbours.forEach [ el_next |
						val next_open_valves = new HashSet(open_valves)
						next_open_valves.add(el_next.key)
						output.add(new TunnelEl(
							time + el_next.value,
							next_open_valves,
							my_position.key -> my_position.value,
							el_next.key -> 0
						) as State -> el_next.value * (max_flow_per_unit - currentFlow))
					]
				// third possible case is that only I can go somewhere
				} else if (el_neighbours.size == 0) {
					my_neighbours.forEach [ my_next |
						val next_open_valves = new HashSet(open_valves)
						next_open_valves.add(my_next.key)
						output.add(new TunnelEl(
							time + my_next.value,
							next_open_valves,
							my_next.key -> 0,
							el_position.key -> el_position.value
						) as State -> my_next.value * (max_flow_per_unit - currentFlow))
					]
				// Last case is when both can only go to a single spot which happens to be the same
				} else {
					val my_target = my_neighbours.get(0)
					val el_target = el_neighbours.get(0)
					if (my_target.value <= el_target.value) {
						val next_open_valves = new HashSet(open_valves)
						next_open_valves.add(my_target.key)
						output.add(new TunnelEl(
							time + my_target.value,
							next_open_valves,
							my_target.key->0,
							el_position.key->el_position.value
						) as State -> my_target.value * (max_flow_per_unit - currentFlow))
					} else {
						val next_open_valves = new HashSet(open_valves)
						next_open_valves.add(el_target.key)
						output.add(new TunnelEl(
							time + el_target.value,
							next_open_valves,
							my_position.key->my_position.value,
							el_target.key->0
						) as State -> el_target.value * (max_flow_per_unit - currentFlow))
					}

				}
			}
			output
		}

		override toString() {
			"t = " + (time - 4) + " ; Valves open = " + open_valves + " ; My position = " + my_position +
				" ; El position = " + el_position
		}

		override hashCode() {
			_hashCode
		}
	}
}
