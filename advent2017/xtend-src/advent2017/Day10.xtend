package advent2017

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day10 {

	static final String input = new InputLoader(2017, 10).inputs.head
	static final int LIST_SIZE = 256

	static Link current_link = null
	static int skip_size
	static int moved

	def static init() {
		var chain_head = new Link(0, null)
		var current = chain_head;
		for (i : 1 ..< LIST_SIZE)
			current = new Link(i, current)
		current.updateNext(chain_head)
		current_link = chain_head
		skip_size = 0
		moved = 0
	}
	
	def static move(Link current_link, int moved) {
		var output = current_link
		for (i : 0 ..< moved)
			output = output.previous
		output
	}

	def static firstPart(List<Integer> input) {
		init
		input.round
		var toPrint = move(current_link, moved)
		toPrint.value * toPrint.next.value
	}

	def static knotHash(String input) {
		init
		val second_pass = new ArrayList(input.toCharArray.map[it as int])
		second_pass.addAll(newArrayList(17, 31, 73, 47, 23))
		(0 ..< 64).forEach[second_pass.round]
		var toPrint = move(current_link,moved)
		val numbers = newArrayList;
		for (i : 0 .. 15) {
			var result = toPrint.value
			for (j : 0 .. 14) {
				toPrint = toPrint.next
				result = result.bitwiseXor(toPrint.value)
			}
			toPrint = toPrint.next
			numbers.add(result)
		}
		numbers
	}

	def static void main(String[] args) {
		println(input.split(",").map[Integer.parseInt(it)].firstPart)
		println(input.knotHash.map[String.format("%02x", it)].join(""))
	}

	def static round(List<Integer> input) {
		input.forEach [
			current_link = current_link.reverse(it)
			moved += (it + skip_size) % LIST_SIZE
			current_link = current_link.skip(skip_size)
			skip_size = (skip_size + 1) % LIST_SIZE
		]
	}

	def static reverse(Link current_link, int quantity) {
		val links = newLinkedList
		var my_current = current_link;
		for (i : 0 ..< quantity) {
			links.addFirst(my_current)
			my_current = my_current.next
		}
		if (quantity < LIST_SIZE) {
			var before = current_link.previous
			for (i : 0 ..< quantity) {
				before.updateNext(links.get(i))
				before = before.next
			}
			before.updateNext(my_current)
			my_current
		} else {
			links.forEach [
				var tmp = it.previous
				it.previous = it.next
				it.next = tmp
			]
			links.head
		}
	}

	def static skip(Link current_link, int skip_size) {
		var new_link = current_link
		for (i : 0 ..< skip_size) {
			new_link = new_link.next
		}
		new_link
	}

	static class Link {

		public int value
		public Link next
		public Link previous

		new(int _value, Link _previous) {
			value = _value
			next = null
			if(_previous !== null) _previous.next = this
			previous = _previous
		}

		def updateNext(Link _next) {
			next = _next
			_next.previous = this
		}

		override String toString() {
			value.toString
		}
	}
}
