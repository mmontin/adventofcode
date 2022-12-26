package advent2017

import java.util.List
import adventutils.input.InputLoader

class Day16 {

	static final List<String> moves = new InputLoader(2017, 16).inputs.get(0).split(",")
	static final String input = "abcdefghijklmnop"
	
	static StringBuffer initial

	def static init() {
		initial = new StringBuffer(input)
	}

	def static void main(String[] args) {
		
		init
		round
		println(initial)

		init
		var i = 0
		do {
			round 
			i ++
		} while (!initial.toString.equals(input))
		
		init ;
		(0..<1000000000%42).forEach[
			round
		]
		println(initial)
	}
	
	def static round() {
		
		moves.forEach [
			val first = it.substring(0,1)
			val others = it.substring(1,it.length).split("/")

			switch (first) {
				case "s": {
					val size = Integer.parseInt(others.get(0))
					val to_move = initial.substring(initial.length - size)
					initial.delete(initial.length - size, initial.length)
					initial.insert(0, to_move)
				}
				case "x": {
					val first_position = Integer.parseInt(others.get(0))
					val second_position = Integer.parseInt(others.get(1))
					val first_prog = initial.charAt(first_position)
					val second_prog = initial.charAt(second_position)
					initial.setCharAt(first_position, second_prog)
					initial.setCharAt(second_position, first_prog)
				}
				case "p": {
					val first_prog = others.get(0).charAt(0)
					val second_prog = others.get(1).charAt(0)
					val first_position = initial.indexOf(others.get(0))
					val second_position = initial.indexOf(others.get(1))
					initial.setCharAt(first_position, second_prog)
					initial.setCharAt(second_position, first_prog)					
				}
			}
		]
	}
}
