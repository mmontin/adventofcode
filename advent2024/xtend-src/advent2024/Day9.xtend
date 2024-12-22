package advent2024

import adventutils.geometry.Interval
import adventutils.input.InputLoader
import java.util.Optional

class Day9 {
	def static void main(String[] args) {
		val hard_drive = newArrayList
		val hard_drive_2 = newArrayList
		var current_position = 0
		var is_data = true
		var current_id = 0
		val inputs = new InputLoader(2024, 9).inputs.get(0).toCharArray.map[Integer.parseInt(it + "")]
		for (current_number : inputs) {
			val current_interval = new Interval(current_position, current_position + current_number - 1)
			current_position += current_number
			if (current_number > 0) {
				hard_drive.add(current_interval -> (is_data ? Optional.of(current_id) : Optional.empty))
				hard_drive_2.add(current_interval -> (is_data ? Optional.of(current_id++) : Optional.empty))
			}
			is_data = !is_data
		}

		while (hard_drive.exists[it.value.isEmpty]) {
			var last = hard_drive.last
			if (last.value.isEmpty)
				hard_drive.remove(last)
			else {
				val last_interval = last.key
				val last_interval_size = last_interval.length
				val last_value = last.value
				val first_empty = hard_drive.findFirst[it.value.isEmpty]
				val index_first_empty = hard_drive.indexOf(first_empty)
				val first_empty_size = first_empty.key.length

				if (first_empty_size > last_interval_size) {
					val difference = first_empty_size - last_interval_size
					val new_full_interval = new Interval(first_empty.key.leftBound,
						first_empty.key.rightBound - difference)
					val new_empty_interval = new Interval(first_empty.key.rightBound - difference + 1,
						first_empty.key.rightBound)
					hard_drive.set(index_first_empty, new_empty_interval -> Optional.empty)
					hard_drive.add(index_first_empty, new_full_interval -> last_value)
					hard_drive.remove(hard_drive.size - 1)
				} else if (first_empty_size == last_interval_size) {
					hard_drive.set(index_first_empty, first_empty.key -> last_value)
					hard_drive.remove(hard_drive.size - 1)
				} else {
					hard_drive.set(index_first_empty, first_empty.key -> last_value)
					hard_drive.set(hard_drive.size - 1,
						new Interval(last_interval.leftBound, last_interval.rightBound - first_empty_size - 1) ->
							last_value)
				}
			}
		}

		var i = hard_drive_2.size - 1
		while (i > 0) {
			var last = hard_drive_2.get(i)
			if (!last.value.isEmpty) {
				val last_interval = last.key
				val last_interval_size = last_interval.length
				val last_value = last.value
				val index_first_empty = (0 ..< i).findFirst [ j |
					val current_itv = hard_drive_2.get(j)
					current_itv.value.isEmpty && current_itv.key.length >= last_interval_size
				]
				if (index_first_empty !== null) {
					val first_empty = hard_drive_2.get(index_first_empty)
					val first_empty_size = first_empty.key.length
					val difference = first_empty_size - last_interval_size
					val new_full_interval = new Interval(first_empty.key.leftBound,
						first_empty.key.rightBound - difference)
					val new_empty_interval = new Interval(first_empty.key.rightBound - difference + 1,
						first_empty.key.rightBound)
					hard_drive_2.set(index_first_empty, new_empty_interval -> Optional.empty)
					hard_drive_2.add(index_first_empty, new_full_interval -> last_value)
					hard_drive_2.remove(i+1)
					i ++
				}
			}
			i --			
		}

		println(hard_drive.fold(0L) [ acc, el |
			val m = el.key.leftBound
			val n = el.key.rightBound
			val id = el.value.get
			acc + id * (((n * (n + 1)) - m * (m - 1)) / 2)
		])

		println(hard_drive_2.fold(0L) [ acc, el |
			val m = el.key.leftBound
			val n = el.key.rightBound
			if (el.value.isEmpty)
				acc
			else {
				val id = el.value.get
				acc + id * (((n * (n + 1)) - m * (m - 1)) / 2)
			}
		])
	}
}
