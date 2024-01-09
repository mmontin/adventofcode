package advent2020.puzzle25

import adventutils.input.InputLoader
import java.util.List

class Launcher {
	
	static final List<String> input = new InputLoader(2020,25).inputs	
	
	static final long DIVISOR = 20201227
	static final long DEVICES_SUBJECT_NUMBER = 7
	static final long CARD_PUBKEY = Long.parseLong(input.get(0))
	static final long DOOR_PUBKEY = Long.parseLong(input.get(1))
	
	
	def static void main(String[] args) {

		val card_loop_size = findLoopSize(DEVICES_SUBJECT_NUMBER, CARD_PUBKEY)
		
		println(transform(DOOR_PUBKEY, card_loop_size))
	}
	
	def static transform(long subject_number, int loop_size) {
		var current = 1L
		for (i: 0..<loop_size) 
			current = transformStep(current,subject_number)
		current
	}
	
	def static transformStep(long current, long subject_number) {
		var output = current
		output = output * subject_number
		output % DIVISOR
	}
	
	def static findLoopSize(long subject_number, long expected_result) {
		var current = 1L
		var loop_size = 0
		while (current != expected_result) {
			current = transformStep(current,subject_number)
			loop_size ++
		} 	
		loop_size
	}
}