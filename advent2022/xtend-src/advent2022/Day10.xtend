package advent2022

import adventutils.input.InputLoader

class Day10 {
	def static void main(String[] args) {
		
		val instructions = newArrayList
		new InputLoader(2022, 10).inputs.forEach [ e |
			val split = e.split(" ")
			split.get(0).equals("noop") ? instructions.add(0) : instructions.addAll(
				newArrayList(0, Integer.parseInt(split.get(1))))
		]
		
		val register_values = newArrayList(1)
		(0 ..< 220).forEach [
			register_values.add(register_values.get(it) + instructions.get(it))
		]
		
		println((0..5).fold(0)[acc,v|
			val index = 19 + v*40
			acc + (index+1) * register_values.get(index)
		])
		
		val screen = newArrayList ;
		(0..5).forEach[i|
			screen.add(newArrayList)
			(0..39).forEach[j|
				val reg = register_values.get(Math.min(register_values.size-1,i*40+j))
				if (j == reg || j == reg-1 || j == reg+1)
					screen.get(i).add("#")
				else screen.get(i).add(".")				
			]
		]
		
		screen.forEach[line|
			line.forEach[chara|print(chara)]
			println
		]
	}
}
