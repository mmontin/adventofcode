package advent2018

import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Day12 {

	static final List<String> input = new InputLoader(2018, 12).inputs
	static Set<Integer> current_state = input.get(0).split("initial state: ").get(1).toCharArray.map[toString].
		fold(newHashSet -> 0) [ acc, v |
			if(v.equals("#")) acc.key.add(acc.value)
			acc.key -> acc.value + 1
		].key
	static final Set<String> transformations = input.subList(2, input.size).fold(newHashSet) [ acc, v |
		val split = v.split(" => ")
		if (split.get(1).equals("#")) acc.add(split.get(0))
		acc
	]

	def static void main(String[] args) {
		(0..19).forEach[step]
		println(current_state.reduce[x,y|x+y])
		
		var previous_value = stringValue
		step
		var current_value = stringValue
		var i = 21
		while (!current_value.equals(previous_value)) {
			step
			previous_value = current_value
			current_value = stringValue
			i++
		}
		// At this point, i contains the first stable indice
		var i_min = current_state.min
		step
		var next_min = current_state.min
		var diff = next_min - i_min
		// The answer is the current sum plus whatever shifting has
		// been done in the remaining steps * the number of states
		var current_sum = current_state.reduce[x,y|x+y]
		println(current_sum as long + diff * (50000000000L - (i+1)) * current_state.size)
	}
	
	def static step() {
		current_state = (current_state.min-2..current_state.max+2).fold(newHashSet)[acc,v|
			if (transformations.contains(reconstruct(v))) acc.add(v)
			acc 
		]
	}
	
	def static reconstruct(int i) {
		(i-2..i+2).fold("")[acc,k|
			acc + (current_state.contains(k) ? "#" : ".")
		]
	}
	
	def static stringValue() {
		(current_state.min..current_state.max).fold("")[acc,v|
			acc + (current_state.contains(v) ? "#" : ".")
		]
	}
}
