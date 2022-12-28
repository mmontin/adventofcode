package advent2017

import adventutils.input.InputLoader
import java.util.List

class Day20 {
	
	static final List<String> input = new InputLoader(2017,20).inputs
	
	def static void main(String[] args) {
		val accs = input.map[
			var last_part = it.split("a=<").get(1)
			last_part = last_part.substring(0,last_part.length-1)
			val splitty = last_part.split(",")
			val a = Math.abs(Integer.parseInt(splitty.get(0)))
			val b = Math.abs(Integer.parseInt(splitty.get(1)))
			val c = Math.abs(Integer.parseInt(splitty.get(2)))
			a + b + c
		]
		println(accs.lastIndexOf(accs.min))
	}
}