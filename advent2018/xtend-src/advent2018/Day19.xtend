package advent2018

import adventutils.input.InputLoader

class Day19 {

	def static void main(String[] args) {
		
		val inputs = new InputLoader(2018, 19).inputs
		val instructions = inputs.subList(1, inputs.size)
		val engine = new MiniLang(#[0, 0, 0, 0, 0, 0])

		while (engine.registry.get(2) >= 0 && engine.registry.get(2) < instructions.size) {
			engine.execute(instructions.get(engine.registry.get(2)))
			engine.registry.set(2, engine.registry.get(2) + 1)
		}

		println(engine.registry.get(0))

		// After reverse-engineering the compiled code, I realized that it computes
		// (very inefficiently) the sum of the divisors of a given target number
		// which is stored in registry 4 after the initialization phase.
		val target = 10551387
		println((1 .. target).fold(0) [ acc, el |
			acc + (target % el == 0 ? el : 0)
		])
	}
}
