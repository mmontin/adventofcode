package advent2018

import adventutils.input.InputLoader

// 0 a
// 1 b
// 2 c
// 3 d
// 4 e
// 5 f
// 0  c += 16
// 1  b = 1
// 2  d = 1
// 3  f = b * d
// 4  f = f == e ? 1 : 0
// 5  c += f
// 6  c ++
// 7  a += b
// 8  d ++
// 9  f = d > e ? 1 : 0
// 10 c += f
// 11 c = 2
// 12 b ++ 
// 13 f = b > e ? 1 : 0
// 14 c += f
// 15 c = 1
// 16 c *= c
// 17 e += 2
// 18 e *= e
// 19 e    e *= c
// 20 e *= 11
// 21 f += 6
// 22 f *= c
// 23 f += 19
// 24 e += f
// 25 c += a
// 26 c = 0
// 27 f = c
// 28 f *= c
// 29 f += c
// 30 f *= c
// 31 f *= 14
// 32 f *= c
// 33 e += f
// 34 a = 0
// 35 c = 0
class Day19 {

	def static void main(String[] args) {
		val inputs = new InputLoader(2018, 19).inputs

		val instructions = inputs.subList(1, inputs.size)

		val instructions_translated = #[
			"c += 16",
			"b = 1",
			"d = 1",
			"f = b * d",
			"f = f == e ? 1 : 0",
			"c += f",
			"c ++",
			"a += b",
			"d ++",
			"f = d > e ? 1 : 0",
			"c += f",
			"c = 2",
			"b ++ ",
			"f = b > e ? 1 : 0",
			"c += f",
			"c = 1",
			"c *= c",
			"e += 2",
			"e *= e",
			"e *= c",
			"e *= 11",
			"f += 6",
			"f *= c",
			"f += 19",
			"e += f",
			"c += a",
			"c = 0",
			"f = c",
			"f *= c",
			"f += c",
			"f *= c",
			"f *= 14",
			"f *= c",
			"e += f",
			"a = 0",
			"c = 0"
		]

		val engine = new MiniLang(#[0, 0, 0, 0, 0, 0])

		while (engine.registry.get(2) >= 0 && engine.registry.get(2) < instructions.size) {
			engine.execute(instructions.get(engine.registry.get(2)))
			engine.registry.set(2, engine.registry.get(2) + 1)
		}

		println(engine.registry.get(0))

		engine.reset(#[1, 0, 0, 0, 0, 0])

		for (i : 0 .. 100) {
			println(engine.registry + " ; " + instructions_translated.get(engine.registry.get(2)))
			engine.execute(instructions.get(engine.registry.get(2)))
			engine.registry.set(2, engine.registry.get(2) + 1)
		}

		println(engine.registry)
	}
}
