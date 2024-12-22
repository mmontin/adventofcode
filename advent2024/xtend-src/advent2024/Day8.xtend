package advent2024

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day8 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2024, 8).inputs.map[it.toCharArray.map[it + ""]]
		val Map<String, List<Coordinate>> antennas = newHashMap
		val max_i = inputs.size - 1
		val max_j = inputs.get(0).size - 1;
		(0 .. max_i).forEach [ i |
			val line = inputs.get(i)
			(0 .. max_j).forEach [ j |
				val current_char = line.get(j)
				if (!current_char.equals(".")) {
					val current = new Coordinate(i, j)
					if (antennas.containsKey(current_char))
						antennas.get(current_char).add(current)
					else
						antennas.put(current_char, newArrayList(current))
				}
			]
		]

		val antinodes = antennas.values.fold(newHashSet) [ acc, sublist |
			val current_nb = sublist.size;
			(0 ..< current_nb).forEach [ i |
				(i + 1 ..< current_nb).forEach [ j |
					val a = sublist.get(i)
					val b = sublist.get(j)
					val c = a.subtract(b)
					acc.add(a.add(c))
					acc.add(b.subtract(c))
				]
			]
			acc
		].filter[it.includedIn(0,max_i,0,max_j)]

		val new_antinodes = antennas.values.fold(newHashSet) [ acc, sublist |
			acc.addAll(sublist)
			val current_nb = sublist.size;
			(0 ..< current_nb).forEach [ i |
				(i + 1 ..< current_nb).forEach [ j |
					val a = sublist.get(i)
					val b = sublist.get(j)
					val c = a.subtract(b)
					
					var next_a = a.add(c)
					while (next_a.includedIn(0,max_i,0,max_j)) {
						acc.add(next_a)
						next_a = next_a.add(c)
					}
						
					var next_b = b.subtract(c)
					while (next_b.includedIn(0,max_i,0,max_j)) {
						acc.add(next_b)
						next_b = next_b.subtract(c)
					}
				]
			]
			acc
		]

		println(antinodes.size)
		println(new_antinodes.size)
	}
}
