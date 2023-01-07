package advent2018

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day8 {

	static List<Integer> numbers = new ArrayList(new InputLoader(2018, 8).inputs.head.split(" ").map [
		Integer.parseInt(it)
	])

	def static void main(String[] args) {
		val root = parseNode
		println(root.totalValue)
		println(root.partialValue)
	}

	def static Node parseNode() {
		val nb_of_children = numbers.remove(0)
		val nb_of_metadata = numbers.remove(0)
		val next_node = new Node;
		(0 ..< nb_of_children).forEach[next_node.children.add(parseNode)]
		(0 ..< nb_of_metadata).forEach[next_node.metadata.add(numbers.remove(0))]
		next_node
	}

	static class Node {

		public final List<Integer> metadata
		public final List<Node> children

		new() {
			metadata = newArrayList
			children = newArrayList
		}

		def int totalValue() {
			children.fold(metadata.reduce[i, j|i + j])[acc, v|acc + v.totalValue]
		}

		def int partialValue() {
			children.size == 0
				? totalValue
				: metadata.fold(0) [ acc, v |
				acc + try
					children.get(v - 1).partialValue
				catch (IndexOutOfBoundsException ioobe)
					0
			]
		}
	}
}
