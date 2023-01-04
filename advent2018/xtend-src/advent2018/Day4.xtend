package advent2018

import java.text.SimpleDateFormat
import adventutils.input.InputLoader

class Day4 {
	def static void main(String[] args) {

        val my_parser = new SimpleDateFormat("[yyyy-MM-dd HH:mm]")

		val input = new InputLoader(2018,4).inputs.map[
			val split = it.split(" ")
			my_parser.parse(split.get(0).concat(" ").concat(split.get(1))) -> split.subList(2,split.size)
		].sortBy[key]
		
		val sleeping_time = newHashMap
		var int current_guard
		var int previous_time
		for (p : input) {
			switch (p.value.get(0)) {
				case "Guard" :
					current_guard = Integer.parseInt(p.value.get(1).replace("#",""))
				case "falls" :
					previous_time = p.key.minutes
				default : {
					val new_list = newArrayList 
					for (i : previous_time ..< p.key.minutes) new_list.add(i)
					sleeping_time.merge(current_guard, new_list)[o,n|o.addAll(n) ; o]
				}
					
			}
		}
		
		val more_sleep = sleeping_time.entrySet.maxBy[value.size]
		val id_more_sleep = more_sleep.key
		val max_minute_more_sleep = more_sleep.value.groupBy[it].entrySet.maxBy[value.size].key
		println(id_more_sleep * max_minute_more_sleep)
		
		val golden_entry = sleeping_time.entrySet.map[
			it.key -> it.value.groupBy[it].entrySet.maxBy[value.size]
		].maxBy[it.value.value.size]
		println(golden_entry.key * golden_entry.value.key)
	}
}