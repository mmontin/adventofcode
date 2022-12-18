package advent2022

import adventutils.geometry.Coordinate
import adventutils.geometry.Interval
import adventutils.geometry.Intervals
import adventutils.input.InputLoader
import java.math.BigInteger
import java.util.Map
import java.util.Set

class Day15 {

	static final Map<Coordinate, Integer> sensors = newHashMap
	static final Set<Coordinate> beacons = newHashSet

	def static void main(String[] args) {
		new InputLoader(2022, 15).inputs.forEach [
			val split = (it + ",").split(" ")
			val sensor = new Coordinate(split.get(2).fromString, split.get(3).fromString)
			val beacon = new Coordinate(split.get(8).fromString, split.get(9).fromString)
			sensors.put(sensor, sensor.manhattanDistanceTo(beacon))
			beacons.add(beacon)
		]

		var itvs = combineRanges(2000000)
		println(itvs.content.get(0).length)
		var j = 0
		while (itvs.content.size < 2)
			itvs = combineRanges(j++)
		
			
		val i = itvs.content.get(0).rightBound + 1
		println(BigInteger.valueOf(i).multiply(BigInteger.valueOf(4000000)).add(BigInteger.valueOf(j-1)))
	}

	def static Intervals combineRanges(int y) {
		val intervals = new Intervals
		sensors.entrySet.forEach[
			var distance_to_line = Math.abs(it.key.y - y)
			val remaining = it.value - distance_to_line
			if (remaining >= 0)
				intervals.addInterval(new Interval(it.key.x - remaining, it.key.x + remaining))
		]
		beacons.filter[it.y == y].forEach[intervals.addInterval(new Interval(it.x,it.x))]
		intervals
	}

	def static int fromString(String input) {
		Integer.parseInt(input.substring(2, input.length - 1))
	}
}
