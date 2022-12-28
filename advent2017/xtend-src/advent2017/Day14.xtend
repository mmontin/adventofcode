package advent2017

import adventutils.geometry.Coordinate
import java.util.List
import java.util.Set

class Day14 {

	static final String input = "oundnydw"

	def static void main(String[] args) {

		val List<String> lines = newArrayList;

		(0 .. 127).forEach [
			val current = input + "-" + it
			val current_hash = Day10.knotHash(current).map [
				String.format("%8s", Integer.toBinaryString(it)).replaceAll(" ", ".").replaceAll("0", ".").
					replaceAll("1", "#")
			].join("")
			lines.add(current_hash)
		]

		println(lines.join("").toCharArray.filter[it.toString.equals("#")].size)

		val filled = newHashSet;
		val Set<Set<Coordinate>> regions = newHashSet;
		(0 .. 127).forEach [ i |
			val current = lines.get(i)
			(0 .. 127).forEach [ j |
				if(current.charAt(j).toString.equals("#")) filled.add(new Coordinate(i, j))
			]
		]
		filled.forEach [ spot |
			regions.add(regions.filter[spot.noDiagonalUnboundedNeighbours.fold(false)[acc, v|acc || it.contains(v)]].
				toSet.fold(newHashSet(spot)) [ acc, v |
					regions.remove(v)
					acc.addAll(v)
					acc
				])
		]

		println(regions.size)
	}
}
