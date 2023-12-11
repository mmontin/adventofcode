package advent2021.puzzle23

import adventutils.pathfinding.State
import adventutils.geometry.Coordinate
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set

class AmphipodState implements State {

	static int roomSize = 4

	static final Map<Integer,Integer> numberToEnergy = newHashMap(
		2 -> 1, 4 -> 10, 6 -> 100, 8 -> 1000)
		
	static final Coordinate hallway0 = new Coordinate(0, 0)
	static final Coordinate hallway1 = new Coordinate(0, 1)
	static final Coordinate hallway3 = new Coordinate(0, 3)
	static final Coordinate hallway5 = new Coordinate(0, 5)
	static final Coordinate hallway7 = new Coordinate(0, 7)
	static final Coordinate hallway9 = new Coordinate(0, 9)
	static final Coordinate hallway10 = new Coordinate(0, 10)
	
	static final Coordinate room12 = new Coordinate(1, 2)
	static final Coordinate room22 = new Coordinate(2, 2)
	static final Coordinate room14 = new Coordinate(1, 4)
	static final Coordinate room24 = new Coordinate(2, 4)
	static final Coordinate room16 = new Coordinate(1, 6)
	static final Coordinate room26 = new Coordinate(2, 6)
	static final Coordinate room18 = new Coordinate(1, 8)
	static final Coordinate room28 = new Coordinate(2, 8)

	static final Coordinate room32 = new Coordinate(3, 2)
	static final Coordinate room42 = new Coordinate(4, 2)
	static final Coordinate room34 = new Coordinate(3, 4)
	static final Coordinate room44 = new Coordinate(4, 4)
	static final Coordinate room36 = new Coordinate(3, 6)
	static final Coordinate room46 = new Coordinate(4, 6)
	static final Coordinate room38 = new Coordinate(3, 8)
	static final Coordinate room48 = new Coordinate(4, 8)
	
	static final Coordinate cantStop2 = new Coordinate(0, 2)
	static final Coordinate cantStop4 = new Coordinate(0, 4)
	static final Coordinate cantStop6 = new Coordinate(0, 6)
	static final Coordinate cantStop8 = new Coordinate(0, 8)
	
	static final Set<Coordinate> hallway = newHashSet(
		hallway0, hallway1, hallway3, hallway5, hallway7, hallway9,hallway10)
 
	static final Set<Coordinate> rooms = {
		val output = newHashSet(
		room12, room22, room14, room24, room16, room26, room18, room28)
		if (roomSize == 4)
			output.addAll(newHashSet(room32, room42, room34, room44, room36, room46, room38, room48))
		output	
	}
	
	static final Set<Coordinate> cantStop = newHashSet(
		cantStop2, cantStop4, cantStop6, cantStop8)

	static final Set<Coordinate> all = {
		val output = new HashSet(hallway)
		output.addAll(rooms)
		output.addAll(cantStop)
		output
	}
	
	static final Map<Coordinate,Integer> init = (roomSize == 2) ?
		newHashMap(room12 -> 6, room22 -> 8, room14 -> 2, room24 -> 6,	room16 -> 4, room26 -> 2, room18 -> 8, room28 -> 4) :
		newHashMap(room12 -> 6, room42 -> 8, room14 -> 2, room44 -> 6,	room16 -> 4, room46 -> 2, room18 -> 8, room48 -> 4,
			room22 -> 8, room32 -> 8, room24 -> 6, room34 -> 4,	room26 -> 4, room36 -> 2, room28 -> 2, room38 -> 6
		)
	
	def static int distance(Coordinate c1, Coordinate c2) {
		if (rooms.contains(c1) && rooms.contains(c2) && c1.y != c2.y)
			c1.x + c2.x + Math.abs(c1.y - c2.y)
		else
			c1.manhattanDistanceTo(c2)	
	}

	final Map<Coordinate, Integer> amphipods
	final int code
	final int energyToNormalize
	final boolean isFinal
	final int minBound

	new() {
		this(new HashMap(init))
	}
	
	new(HashMap<Coordinate, Integer> amphipods_) {
		amphipods = amphipods_
		energyToNormalize = normalize
		code = amphipods.entrySet.fold(0)[v, e|v + e.key.hashCode * e.value]
		isFinal = amphipods.entrySet.fold(true)[v, e|v && isPlaced(e.key, e.value)]
		// The minimal distance to the goal is given by the direct energy consumption of all amphipods
		// from their current place to their goal spot, when they are not already placed
		val used = newHashSet
		minBound = amphipods.entrySet.filter[!isPlaced(it.key, it.value)].fold(0) [ v, c |
			val value = c.value
			val to = rooms.filter[it.y == value &&
				(!amphipods.containsKey(it) || !isPlaced(it,amphipods.get(it))) && 
				!used.contains(it)
			].sortBy[-x].get(0)
			used.add(to)
			// println(c + " goes to " + to + " using " + (distance(c.key,to) * numberToEnergy.get(value)) + " energy")
			v + distance(c.key, to) * numberToEnergy.get(value)
		]
	}
	
	def getEnergy() {
		energyToNormalize
	}
	
	// Checks whether the amphipod at position c is placed correctly, that is, it is in its room at the last place
	// or the spots behind it are placed as well.
	def private boolean isPlaced(Coordinate c, Integer value) {
		switch(c.x) {
			case 0 : false
			case roomSize : value.equals(c.y)
			default : (c.x+1..roomSize).fold(value.equals(c.y))[v , i |
				v && value.equals(amphipods.get(new Coordinate(i,c.y)))
			]
		}
	}
	
	// A function for testing purposes, displaying if the amphipods are placed or not
	def status() {
		amphipods.entrySet.forEach[println(it + " : " + isPlaced(it.key, it.value))]
		amphipods.keySet.forEach[println(reachableSpots(it))]
	}
	
	// Here we assume setc is a set of empty spots, which we enlarge with all its neighbours
	// using newOnes, which contains a subset of setc that has not been explored yet
	// We return the set of the newly added coordinates
	def private emptyNeighboursOfSet(Set<Coordinate> setc, Set<Coordinate> newOnes) {
		val output = newHashSet
		newOnes.forEach[
			val filteredNeighbours = it.noDiagonalUnboundedNeighbours.filter[c | all.contains(c) && !amphipods.containsKey(c) && !setc.contains(c)].toSet
			setc.addAll(filteredNeighbours)
			output.addAll(filteredNeighbours)
		]
		output
	}
	
	// Reachable spots from a given position c
	def private reachableSpots(Coordinate c) {
		var newOnes = newHashSet(c)
		val output = newHashSet()
		while (!newOnes.isEmpty) newOnes = emptyNeighboursOfSet(output,newOnes)
		output.removeAll(cantStop)
		output
	}
	
	// This function moves all amphipods for which there exists an available correct spot
	// It returns the energy used for this normalization
	def int normalize() {
		var Pair<Coordinate,Coordinate> c
		var totalEnergy = 0
		do {
			c = amphipods.entrySet.filter[!isPlaced(it.key,it.value)].map[e |
				new Pair(e.key,reachableSpots(e.key).findFirst[isPlaced(it,e.value)])
			].findFirst[it.value !== null]
			if (c !== null) {
				val value = amphipods.remove(c.key)
				// println("moving " + c.key + " with value " + value + " to " + c.value)
				totalEnergy += distance(c.key, c.value) * numberToEnergy.get(value)
				amphipods.put(c.value, value)
			}
		} while (c !== null)
		// println(totalEnergy)
		totalEnergy
	}

	override isGoal() {
		isFinal
	}

	override minToGoal() {
		minBound
	}

	override neighbours() {
		val output = newHashMap
		amphipods.entrySet.filter[rooms.contains(it.key)].forEach[ e |
			val from = e.key
			val value = e.value
			from.reachableSpots.filter[hallway.contains(it)].forEach[ to |
				val newMap = new HashMap(amphipods)
				newMap.put(to,newMap.remove(from))
				val newState = new AmphipodState(newMap)
				val energy = distance(from,to) * numberToEnergy.get(value) + newState.energyToNormalize
				output.merge(newState,energy)[u , v | Math.min(u,v)]
			]
		]
		output.entrySet.map[it.key -> it.value]
	}

	override equals(Object other) {
		amphipods.equals((other as AmphipodState).amphipods)
	}

	override hashCode() {
		code
	}
}
