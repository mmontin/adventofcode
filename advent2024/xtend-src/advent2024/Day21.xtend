package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.Set

class Day21 {

//+---+---+---+
//| 7 | 8 | 9 |
//+---+---+---+
//| 4 | 5 | 6 |
//+---+---+---+
//| 1 | 2 | 3 |
//+---+---+---+
//    | 0 | A |
//    +---+---+
//
//    +---+---+
//    | ^ | A |
//+---+---+---+
//| < | v | > |
//+---+---+---+
	static final List<String> example = newArrayList("A", "0", "2", "9", "A")
	static final List<ArrayList<String>> examples = newArrayList("A029A", "A980A", "A179A", "A456A", "A379A").map [
		new ArrayList(toCharArray.map[it + ""])
	]
	static final List<ArrayList<String>> inputs = newArrayList("A129A", "A176A", "A169A", "A805A", "A208A").map [
		new ArrayList(toCharArray.map[it + ""])
	]

	static final Map<Coordinate, String> pad_numeric_map = {
		val res = newHashMap
		val pad_numeric = #["789", "456", "123", " 0A"].map[toCharArray.map[it + ""]]
		for (i : 0 .. pad_numeric.size - 1)
			for (j : 0 .. pad_numeric.get(0).size - 1)
				if (pad_numeric.get(i).get(j) != " ")
					res.put(new Coordinate(i, j), pad_numeric.get(i).get(j))
		res
	}
	static final Coordinate forbidden_pad_numeric = new Coordinate(3, 0)

	static final Map<Coordinate, String> pad_directional_map = {
		val res = newHashMap
		val pad_directional = #[" ^A", "<v>"].map[toCharArray.map[it + ""]]
		for (i : 0 .. pad_directional.size - 1)
			for (j : 0 .. pad_directional.get(0).size - 1)
				if (pad_directional.get(i).get(j) != " ")
					res.put(new Coordinate(i, j), pad_directional.get(i).get(j))
		res
	}
	static final Set<Coordinate> pad_keys = pad_directional_map.keySet

	static final Coordinate forbidden_pad_directional = new Coordinate(0, 0)

	static final Set<String> chunks = {
		val res = newHashSet
		for (c1 : pad_keys) {
			for (c2 : pad_keys) {
				val x = treat_code(
					newArrayList(
						pad_directional_map.get(c1) + "",
						pad_directional_map.get(c2) + ""
					),
					false
				).map[it.head.join].head
				res.add(x)
			}
		}
		res
	}

	def static void main(String[] args) {
		println(inputs.fold(0L) [ acc, el |
			acc + compute(el, 1) * Integer.parseInt(el.subList(1, el.size - 1).join)
		])
		
		println(inputs.fold(0L) [ acc, el |
			acc + compute(el, 24) * Integer.parseInt(el.subList(1, el.size - 1).join)
		])
	}

	def static compute(List<String> code, int occurrences) {

		val first_layer_codes = code.treat_code(true).fold(newArrayList(newArrayList("A"))) [ acc, el |
			val res = newArrayList
			acc.forEach [ ac |
				el.forEach [ e |
					val tmp = newArrayList
					tmp.addAll(ac)
					tmp.addAll(e)
					res.add(tmp)
				]
			]
			res
		]

		first_layer_codes.map [ first_layer_code |

			val first_layer_treated = first_layer_code.treat_code(false).map [
				it.findFirst[chunks.contains(it.join)]
			].map[join]

			var layer_map = first_layer_treated.fold(newHashMap)[acc, el|acc.merge(el, 1L)[x, y|x + y]; acc]

			for (i : 1 .. occurrences)
				layer_map = transform_chunk(layer_map)

			layer_map.entrySet.fold(0L) [ acc, el |
				acc + el.key.length * el.value
			]
		].min
	}

	def static transform_chunk(Map<String, Long> layer_map) {
		layer_map.entrySet.fold(newHashMap) [ acc, el |
			val code = new ArrayList(el.key.toCharArray.map[it + ""])
			code.add(0, "A")
			code.treat_code(false).map[it.findFirst[chunks.contains(it.join)]].map[join].forEach [
				acc.merge(it, el.value)[x, y|x + y]
			]
			acc
		]
	}

	// Takes a code to be typed by a robot on a given pad (decided by is_numeric)
	// And gives back all possibles codes to type on a directional pad to obtain this code
	def static treat_code(List<String> code, boolean is_numeric) {
		// We store the coordinates where the various letters to be signed sit 
		val coordinates = code.map [ c |
			(is_numeric ? pad_numeric_map : pad_directional_map).entrySet.findFirst [
				it.value == c
			].key
		]
		// We generate all the paths between pairs of coordinates in the path,
		// trimming the paths going to forbidden squares. Then, at the end of each
		// of those paths, we add "A" to materialize the need to press the current key
		(0 .. coordinates.size - 2).map [
			val paths = treat_pair(coordinates.get(it), coordinates.get(it + 1)).replay_and_trim(
				coordinates.get(it),
				is_numeric ? forbidden_pad_numeric : forbidden_pad_directional
			)
			val ans = newArrayList
			paths.forEach [
				val current = new ArrayList(it)
				current.add("A")
				ans.add(current)
			]
			ans
		]
	}

	// Takes 2 coordinates and returns the set off all possibles directs 
	// paths from the former to the latter within the rectangle they create 
	def static treat_pair(Coordinate c1, Coordinate c2) {
		val x_moves = switch (diff_x : c2.x - c1.x) {
			case 0: newArrayList
			case diff_x < 0: (1 .. -diff_x).map[Direction.UP].toList
			default: (1 .. diff_x).map[Direction.DOWN].toList
		}
		val y_moves = switch (diff_y : c2.y - c1.y) {
			case 0: newArrayList
			case diff_y < 0: (1 .. -diff_y).map[Direction.LEFT].toList
			default: (1 .. diff_y).map[Direction.RIGHT].toList
		}
		val res = newHashSet
		val poss1 = newArrayList
		val poss2 = newArrayList
		poss1.addAll(x_moves)
		poss1.addAll(y_moves)
		poss2.addAll(y_moves)
		poss2.addAll(x_moves)
		res.add(poss1)
		res.add(poss2)
		res
	// ListUtils.intertwine(x_moves, y_moves)
	}

	// Takes a set of possibles paths, replay them from a given source coordinate, 
	// and trims the paths that cross a forbidden coordinate. Transforms the 
	// directions into arrows (> < v ^) in the process.
	def static replay_and_trim(HashSet<ArrayList<Direction>> dirs, Coordinate source, Coordinate forbidden) {
		dirs.filter [ list |
			var current = source
			var i = 0
			while (i < list.size && current != forbidden)
				current = current.otherMove(list.get(i++))
			current != forbidden
		].map[it.map[Dir.directionToStringArrows(it)]]
	}
}
