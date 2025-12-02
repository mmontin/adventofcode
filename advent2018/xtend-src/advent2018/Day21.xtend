package advent2018

import adventutils.input.InputLoader

class Day21 {

	def static void main(String[] args) {

		val inputs = new InputLoader(2018, 21).inputs
		val instructions = inputs.subList(1, inputs.size)
		val engine = new MiniLang(#[0, 0, 0, 0, 0, 0])
		
		val possible_values = newHashSet
		var repeated = false
		var Integer last_added = null

		// Unoptimized (takes 12 minutes to run)
		while (engine.registry.get(1) >= 0 && engine.registry.get(1) < instructions.size && !repeated) {
			if (engine.registry.get(1) == 28) {
				val current_value = engine.registry.get(4)
				if (possible_values.isEmpty) println(current_value)
				if (possible_values.contains(current_value))
					repeated = true
				else {
					last_added = current_value
					possible_values.add(current_value)
				}	
			}
			engine.execute(instructions.get(engine.registry.get(1)))
			engine.registry.set(1, engine.registry.get(1) + 1)
		}

		println(last_added)
	}
}
