package advent2023

import adventutils.geometry.Interval
import adventutils.input.InputLoader
import java.util.List
import java.util.Optional

class Day5 {

	def static void main(String[] args) {

		val maps = newArrayList

		val ir = new InputLoader(2023, 5).inputReader
		val seeds = ir.readLine.split(": ").get(1).split(" ").map[Long.parseLong(it)].toList
		var List<List<Long>> currentMap

		while (ir.ready) {
			var currentLine = ir.readLine
			if (currentLine.isBlank) {
				currentMap = newArrayList
				maps.add(currentMap)
			} else {
				val numbers = currentLine.split(" ")
				if (numbers.size == 3)
					currentMap.add(numbers.map[Long.parseLong(it)].toList)
			}
		}

		println(seeds.map [ seed |
			maps.fold(seed) [ res, l |
				dest(res, l)
			]
		].min)

		val seedIntervals = newArrayList;
		(0 ..< seeds.size / 2).forEach [
			val start = seeds.get(it * 2)
			val end = start + seeds.get(it * 2 + 1)
			seedIntervals.add(new Interval(start, end))
		]

		val List<List<Pair<Interval, Long>>> mapIntervals = maps.map [ entries |
			val allIntervals = entries.map [ entry |
				new Interval(entry.get(1), entry.get(1) + entry.get(2)) -> entry.get(0) - entry.get(1)
			].sortBy [
				it.key.leftBound
			].fold(-1L -> newArrayList) [ acc, itvPair |
				val lastBound = acc.key
				val output = acc.value
				val newItv = new Interval(lastBound + 1, itvPair.key.leftBound - 1)
				if(!newItv.empty) output.add(newItv -> 0L)
				output.add(itvPair)
				itvPair.key.rightBound -> output
			]

			val output = allIntervals.value
			val lastInterval = new Interval(allIntervals.key + 1, Long.MAX_VALUE)
			output.add(lastInterval -> 0L)
			output
		]
		
		println(mapIntervals.fold(seedIntervals)[acc,v|
			splitMore(acc,v)
		].minBy[it.leftBound].leftBound)
	}
	
	def static splitMore(List<Interval> itvs, List<Pair<Interval, Long>> entries) {
		itvs.fold(newArrayList)[acc,itv|
			acc.addAll(split(itv,entries))
			acc
		]
	}
	
	def static split(Interval itv, List<Pair<Interval, Long>> entries) {
		entries.fold(newArrayList)[acc,otherItv|
			val intersect = itv.intersection(otherItv.key)
			if (!intersect.empty)
				acc.add(new Interval(intersect.leftBound + otherItv.value, intersect.rightBound + otherItv.value))
			acc
		]
	}

	def static Long dest(Long source, List<List<Long>> entries) {
		val output = entries.findFirst[destination(source, it).present]
		output === null ? source : destination(source, output).get
	}

	def static Optional<Long> destination(Long source, List<Long> entry) {
		val entrySource = entry.get(1)
		val entryDestination = entry.get(0)
		val entryRange = entry.get(2)
		val difference = source - entrySource
		difference >= 0 && difference < entryRange ? Optional.of(entryDestination + difference) : Optional.empty
	}
}
