package advent2018

import java.util.Map

class Day9 {

	static final int number_of_players = 400
	static final int last_marble_1 = 71864
	static final int last_marble_2 = last_marble_1 * 100

	def static void main(String[] args) {

		var current_marble = new Link(0, null)
		current_marble.updateNext(current_marble)
		var current_player = 0
		var Map<Integer,Long> scores = newHashMap

		for (i : 1 .. last_marble_2) {
			if (i == last_marble_1) println(scores.values.max)
			if (i % 23 == 0) {
				for (j : 0..7) current_marble = current_marble.previous
				scores.merge(current_player, i as long + current_marble.removeRight)[u, v|u + v]
				current_marble = current_marble.next
			} else {
				current_marble = current_marble.next
				current_marble.insertRight(new Link(i, null))
				current_marble = current_marble.next
			}
			current_player++
			current_player %= number_of_players
		}
		
		println(scores.values.max)
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

		def insertRight(Link to_insert) {
			var prev = next
			updateNext(to_insert)
			to_insert.updateNext(prev)
		}
		
		def removeRight() {
			val new_right = next.next
			val output = next.value
			updateNext(new_right)
			output
		}

		override String toString() {
			value.toString
		}
	}
}
