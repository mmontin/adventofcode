package advent2021.puzzle24

import advent2021.puzzle24.Instruction

class Input extends Instruction {
	
	static int current_number = 0
	
	String variable
	int myNumber
	
	new(String s) {
		variable = s
		myNumber = current_number
		current_number ++
	}
	
	override toString() {
		variable + ' = input[' + myNumber + '] ;'
	}
}