package advent2017

import java.util.Map
import adventutils.input.InputLoader

class Day8 {
	
	static final Map<String,Integer> registers = newHashMap
	static Integer max = 0
	
	def static void main(String[] args) {
		new InputLoader(2017,8).inputs.forEach[
			val split = it.split(" ")
			if (evaluateCondition(split.get(4), split.get(5), split.get(6))) {
				val currentValue = registers.getOrDefault(split.get(0),0)
				val toChange = Integer.parseInt(split.get(2))
				val newValue = currentValue + (split.get(1).equals("inc") ? toChange : -toChange)
				max = Math.max(max,newValue)
				registers.put(split.get(0),newValue)
			}
		]
		println(registers.values.max)
		print(max)
	}
	
	def static evaluateCondition(String reg, String symb, String value) {
		val right = Integer.parseInt(value)
		val left = registers.getOrDefault(reg,0)
		switch symb {
			case ">": left > right
			case "<": left < right
			case ">=": left >= right
			case "<=": left <= right
			case "==": left == right
			case "!=": left != right
		}
	}
}