package advent2023

import adventutils.collection.CollectionUtils
import adventutils.input.InputLoader
import java.util.List

class Day9 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2023, 9).inputs.map[it.split(" ").map[Integer.parseInt(it)]]
		println(inputs.fold(0)[acc, el|acc + el.getNextValue])
		println(inputs.fold(0)[acc, el|acc + el.getPrevValue])
	}

	def static int getNextValue(List<Integer> l) {
		l.size == 0 ? 0 : getNextValue(l.getSubList) + l.last
	}
	
	def static int getPrevValue(List<Integer> l) {
		l.size == 0 ? 0 : l.head - getPrevValue(l.getSubList)
	}

	def static List<Integer> getSubList(List<Integer> l) {
		if (l.size > 1)
			(0 .. l.size - 2).fold(newArrayList) [ acc, el |
				CollectionUtils.cons(l.get(el + 1) - l.get(el), acc)
			]
		else
			newArrayList
	}
}
