package advent2021.puzzle9

import advent2021.Utils

class Launcher {

	def static void main(String[] args) {

		val Area m = new Area(Utils.getInputs(9).fold(newArrayList)[ l , v |
			l.add(v.toCharArray.toList.map[Integer::parseInt(it + '')])
			l
		])
		
		println(m.lowPoints.fold(0)[v , e | v + 1 + m.get(e)])
		
		val basins = m.lowPoints.fold(newArrayList)[l , c |
			l.add(m.floodUpToMaximum(c))
			l
		].sort.reverse
		
		println(basins.get(0) * basins.get(1) * basins.get(2))
	}
}