package advent2021.puzzle24

import advent2021.puzzle24.Instruction

class Equality extends Instruction {
	
	String left
	String right
	
	new(String[] split) {
		left = split.get(1)
		right = split.get(2)
	}
	
	override toString() {
		left + ' = ( ' + left + ' == ' + right + ') ? 1 : 0 ;' 
	}
}