package advent2023

import java.util.List

class Day6 {
	
	static final List<Pair<Long,Long>> races = newArrayList(34L->204L,90L->1713L,89L->1210L,86L->1780L)
	static final List<Pair<Long,Long>> race2 = newArrayList(34908986L->204171312101780L)
	
	def static void main(String[] args) {
		println(races.fold(1)[acc,el|
			val nb = possibilities(el.key)
			acc * nb.filter[it>el.value].size
		])
		println(race2.fold(1)[acc,el|
			val nb = possibilities(el.key)
			acc * nb.filter[it>el.value].size
		])
	}
	
	def static possibilities(long time) {
		(0..time as int).fold(newArrayList)[acc,el|
			acc.add((time - el) * el)
			acc
		]
	}
}