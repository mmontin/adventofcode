package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Map

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

	static final List<String> example = newArrayList("0", "2", "9", "A")
	static final List<ArrayList<String>> inputs = newArrayList("129A", "176A", "169A", "805A", "208A").map[new ArrayList(toCharArray.map[it + ""])]

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

	static final Map<Coordinate, String> pad_directionnel_map = {
		val res = newHashMap
		val pad_directionnel = #[" ^A", "<v>"].map[toCharArray.map[it + ""]]
		for (i : 0 .. pad_directionnel.size - 1)
			for (j : 0 .. pad_directionnel.get(0).size - 1)
				if (pad_directionnel.get(i).get(j) != " ")
					res.put(new Coordinate(i, j), pad_directionnel.get(i).get(j))
		res
	}
	static final Coordinate forbidden_pad_directionnel = new Coordinate(0, 0)

	def static void main(String[] args) {

		println(inputs.fold(0) [acc,el |
			val number = Integer.parseInt(el.subList(0,3).join)
			acc + number * el.treat_layered_code
		])
	}

	def static treat_layered_code(List<String> code) {
		val first_layers_inputs = code.treat_code(true)
		val first_layers_inputs_merged = first_layers_inputs.merge_possibilities
		
		var second_layer = first_layers_inputs_merged.map[treat_code(false)]
		val all_second_layer_merged = newArrayList
		second_layer.forEach[all_second_layer_merged.addAll(it.merge_possibilities)]

		val third_layer = all_second_layer_merged.map[treat_code(false)]
		val all_third_layer_merged = newArrayList
		third_layer.forEach[all_third_layer_merged.addAll(it.merge_possibilities)]

		all_third_layer_merged.minBy[size].size
	}

	def static ArrayList<ArrayList<String>> merge_possibilities(Iterable<ArrayList<ArrayList<String>>> input) {
		input.fold(newArrayList(newArrayList)) [ ArrayList<ArrayList<String>> acc, el |
			val res = newArrayList
			el.forEach [ l1 |
				acc.forEach [ l2 |
					val current = newArrayList
					current.addAll(l2)
					current.addAll(l1)
					res.add(current)
				]
			]
			res
		]
	}

	// Takes a code to be typed by a robot on a given pad (decided by is_numeric)
	// And gives back all possibles codes to type on a directional pad to obtain this code
	def static treat_code(List<String> code, boolean is_numeric) {
		// whenever we want to type a code, we always begin from letter "A"
		code.add(0, "A")
		// We store the coordinates where the various letters to be signed sit 
		val coordinates = code.map [ c |
			(is_numeric ? pad_numeric_map : pad_directionnel_map).entrySet.findFirst [
				it.value == c
			].key
		]
		// We generate all the paths between pairs of coordinates in the path,
		// trimming the paths going to forbidden squares. Then, at the end of each
		// of those paths, we add "A" to materialize the need to press the current key
		(0 .. coordinates.size - 2).map [
			val paths = treat_pair(coordinates.get(it), coordinates.get(it + 1)).replay_and_trim(
				coordinates.get(it),
				is_numeric ? forbidden_pad_numeric : forbidden_pad_directionnel
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
		//ListUtils.intertwine(x_moves, y_moves)
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
