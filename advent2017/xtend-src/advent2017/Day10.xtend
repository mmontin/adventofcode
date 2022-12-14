package advent2017

import adventutils.input.InputLoader
import java.util.ArrayList

class Day10 {

	static final int LIST_SIZE = 256

	static Link current_link = null 
	
	def static init() {
		var chain_head = new Link(0, null)
		var current = chain_head;
		for (i : 1 ..< LIST_SIZE)
			current = new Link(i, current)
		current.updateNext(chain_head)
		current_link = chain_head
	}

	static int skip_size = 0
	static int moved = 0

	def static void main(String[] args) {
		
		var input = new InputLoader(2017,10).inputs.head
		
		init
		input.split(",").map[Integer.parseInt(it)].forEach [
			reverse(it)
			moved += (it + skip_size)% LIST_SIZE
			skip
		]
		var toPrint = current_link
		for (i : 0 ..< moved)
			toPrint = toPrint.previous
		println(toPrint.value * toPrint.next.value)
		
		init
		val second_pass = new ArrayList(input.toCharArray.map[it as int])
		second_pass.addAll(newArrayList(17,31,73,47,23))
		skip_size = 0
		moved = 0
		(0..<64).forEach[
			second_pass.forEach[
				reverse(it)
				moved += (it + skip_size)% LIST_SIZE
				skip
			]
		]
		toPrint = current_link
		for (i : 0 ..< moved)
			toPrint = toPrint.previous
		val numbers = newArrayList ;
		for (i : 0..15) {
			var result = toPrint.value
			for (j : 0..14) {
				toPrint = toPrint.next
				result = result.bitwiseXor(toPrint.value)
			}
			toPrint = toPrint.next
			numbers.add(result)
		}
		print(numbers.map[Integer.toHexString(it)].join(""))
	}

	def static print() {
		var current = current_link
		for (i : 0 ..< LIST_SIZE) {
			print(current.value + ",")
			current = current.next
		}
		println()
	}

	def static reverse(int quantity) {
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
			current_link = my_current
		} else {
			links.forEach [
				var tmp = it.previous
				it.previous = it.next
				it.next = tmp
			]
			current_link = links.head
		}
	}

	def static void skip() {
		(0 ..< skip_size).forEach[current_link = current_link.next]
		skip_size = (skip_size + 1) % LIST_SIZE
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
