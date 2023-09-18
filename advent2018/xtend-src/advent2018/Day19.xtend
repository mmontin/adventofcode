package advent2018

import adventutils.input.InputLoader

class Day19 {
	
	def static void main(String[] args) {
		val inputs = new InputLoader(2018,19).inputs
		
		val pointerRegistry = Integer.parseInt(inputs.get(0).split(" ").get(1))
		val instructions = inputs.subList(1,inputs.size)
		val engine = new MiniLang(newArrayList(1,0,0,0,0,0))
		var currentInstruction = 0
		
		while (currentInstruction >= 0 && currentInstruction < instructions.size) {
			engine.registry.set(pointerRegistry,currentInstruction)
			engine.execute(instructions.get(currentInstruction))
			currentInstruction = engine.registry.get(pointerRegistry) + 1
		}
		
		println(engine.registry.get(0))
	}
}