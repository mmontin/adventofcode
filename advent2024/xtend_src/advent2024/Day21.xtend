package advent2024

import adventutils.geometry.Coordinate
import adventutils.geometry.Dir
import adventutils.geometry.Direction
import java.util.ArrayList
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

	static final List<String> example = newArrayList("0", "2", "9" , "A")
	static final List<List<String>> inputs = #["129A", "176A", "169A", "805A", "208A"].map[toCharArray.map[it + ""]]

	static final Map<Coordinate, String> pad_numeric_map = {
		val res = newHashMap
		val pad_numeric = #["789", "456", "123", " 0A"].map[toCharArray.map[it + ""]]
		for (i : 0 .. pad_numeric.size - 1)
			for (j : 0 .. pad_numeric.get(0).size - 1)
				if (pad_numeric.get(i).get(j) != " ")
					res.put(new Coordinate(i, j), pad_numeric.get(i).get(j))
		res
	}
	static final Coordinate init_pad_numeric = new Coordinate(3,2)

	static final Map<Coordinate, String> pad_directionnel_map = {
		val res = newHashMap
		val pad_directionnel = #[" ^A", "<v>"].map[toCharArray.map[it + ""]]
		for (i : 0 .. pad_directionnel.size - 1)
			for (j : 0 .. pad_directionnel.get(0).size - 1)
				if (pad_directionnel.get(i).get(j) != " ")
					res.put(new Coordinate(i, j), pad_directionnel.get(i).get(j))
		res
	}
	static final Coordinate init_pad_directionnel = new Coordinate(0,2)

	def static void main(String[] args) {
		
		println(example)
		val coordinates = example.treat_code(true)
		for (i : 0 .. coordinates.size-2) {
			val treated = treat_pair(coordinates.get(i),coordinates.get(i+1))
			val replayed = treated.replay_and_trim(coordinates.get(i),true)
			val ans = newArrayList
			replayed.forEach[
				val current = new ArrayList(it)
				current.add("A")
				ans.add(current)
			]
			ans.forEach[println(it.treat_code(false))]
		}
			
			
//		inputs.forEach[code | 
//			println("code " + code)
//			val coordinates = code.treat_code
//			for (i : 0 .. coordinates.size-2)
//				println(treat_pair(coordinates.get(i),coordinates.get(i+1)).replay_and_trim(coordinates.get(i),true))
//		]
	}

	def static treat_code(List<String> code, boolean is_numeric) {
		code.add(0,"A")
		code.map[c|(is_numeric ? pad_numeric_map : pad_directionnel_map).entrySet.findFirst[it.value == c].key]
	}

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
		combine(x_moves, y_moves)
	}

	def static replay_and_trim(Set<List<Direction>> dirs, Coordinate source, boolean is_numeric) {
		val forbidden = new Coordinate(is_numeric ? 3 : 0, 0)
		dirs.filter [ list |
			var current = source
			var i = 0
			while (i < list.size && current != forbidden)
				current = current.otherMove(list.get(i++))
			current != forbidden
		].map[it.map[Dir.directionToStringArrows(it)]]
	}

	def static <T> Set<List<T>> combine(List<T> l1, List<T> l2) {
		if (l1.isEmpty)
			newHashSet(l2)
		else if (l2.isEmpty)
			newHashSet(l1)
		else {
			val head1 = l1.head
			val tail1 = l1.tail.toList
			val head2 = l2.head
			val tail2 = l2.tail.toList
			val res = newHashSet
			res.addAll(combine(tail1, l2).map[it.add(0, head1); it])
			res.addAll(combine(l1, tail2).map[it.add(0, head2); it])
			res
		}
	}
}
