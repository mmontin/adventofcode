package advent2022

import adventutils.input.InputLoader

class Day3 {
	
	def static void main(String[] args) {
		
		val inputs = new InputLoader(2022,3).getInputs
		
		println(inputs.fold(0)[acc, e|
			val part1 = e.substring(0,e.length/2).toCharArray
			val part2 = e.substring(e.length/2).toCharArray
			acc + toValue(part1.filter[part2.contains(it)].head)
		])
		
		println(inputs.fold(newArrayList->0)[acc, e|
			acc.key.add(e.toCharArray)
			if (acc.key.size == 3) {
				val id = acc.key.get(0).filter[acc.key.get(1).contains(it)].filter[acc.key.get(2).contains(it)].head
				newArrayList->(acc.value + toValue(id))
			} else acc
		].value)
	}
	
	def static int toValue(char c) {
		var output = c as int - 96
		output < 0 ? output + 58 : output
	}
}