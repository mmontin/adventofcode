package advent2018

import adventutils.input.InputLoader
import java.util.ArrayList

class Day2 {
	def static void main(String[] args) {
		
		val input = new InputLoader(2018, 2).inputs.map[toCharArray.map[toString]]
		val groups = input.map[groupBy[it]]
		val contains_two = groups.filter[it.values.exists[s | s.size == 2]].size
		val contains_three = groups.filter[it.values.exists[s | s.size == 3]].size
		println(contains_two * contains_three)
		
		var current_pos = 0
		var found = false
		while (!found) {
			val current_current_pos = current_pos
			val removed = input.map[
				val hm = new ArrayList(it)
				hm.remove(current_current_pos) ; hm.join
			].groupBy[it].values.findFirst[it.size == 2]
			if (removed !== null) {
				found = true
				println(removed.head)
			}
			current_pos ++
		}
	}
}
