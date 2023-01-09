package advent2018

import adventutils.list.Link

class Day9 {

	static final int number_of_players = 400
	static final int last_marble_1 = 71864
	static final int last_marble_2 = last_marble_1 * 100

	def static void main(String[] args) {

		var current_marble = new Link(0, null)
		current_marble.updateNext(current_marble)
		var current_player = 0
		var scores = newHashMap

		for (i : 1 .. last_marble_2) {
			if(i == last_marble_1) println(scores.values.max)
			if (i % 23 == 0) {
				current_marble = current_marble.get(-8)
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
}
