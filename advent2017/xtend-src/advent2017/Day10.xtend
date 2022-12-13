package advent2017

import adventutils.input.InputLoader

class Day10 {

	static final int LIST_SIZE = 4

	static Link current_link = {
		var chain_head = new Link(0, null)
		var current = chain_head;
		for (i : 1 .. LIST_SIZE)
			current = new Link(i, current)
		current.updateNext(chain_head)
		chain_head
	}

	static int skip_size = 0

	def static void main(String[] args) {
		print
		new InputLoader(2017, 10).inputs.head.split(",").map[Integer.parseInt(it)].forEach [
			reverse(it)
			skip
			print
		]
		println(current_link.value * current_link.next.value)
	}

	def static print() {
		var current = current_link
		for (i : 0 .. LIST_SIZE) {
			print(current.value + ",")
			current = current.next
		}
		println()
	}

	def static reverse(int quantity) {
		if (quantity < LIST_SIZE) {
			val links = newLinkedList
			var my_current = current_link;
			for (i : 0 ..< quantity) {
				links.addFirst(my_current)
				my_current = my_current.next
			}
			var before = current_link.previous
			for (i : 0 ..< quantity) {
				before.updateNext(links.get(i))
				before = before.next
			}
			before.updateNext(my_current)
			current_link = my_current
		} else {
			
		}
	}

	def static void skip() {
		(0 ..< skip_size).forEach[current_link = current_link.next]
		skip_size++
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
