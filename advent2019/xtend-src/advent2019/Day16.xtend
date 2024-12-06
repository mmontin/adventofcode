package advent2019

import adventutils.MemoryRunner
import adventutils.MemoryRunner2
import adventutils.geometry.Interval
import adventutils.input.InputLoader
import java.util.List

class Day16 {

	static final List<Integer> seed = new InputLoader(2019, 16).inputs.head.toCharArray.map[Integer.parseInt(it + "")]
	static final int size = seed.size
	static final int mega_size = size * 10_000
	static final int nb_of_phases = 100
	static int current_size = size

	def static void main(String[] args) {
		println((0..<8).map[computeRunner.call(nb_of_phases,it).toString].join)
		current_size = mega_size
		patternRunner.reset
		computeRunner.reset
		intervalRunner.reset
		val offset = Integer.parseInt(seed.take(7).map[toString].join)
		println((offset..<offset+8).map[computeRunner.call(nb_of_phases,it).toString].join)
	}

	static final MemoryRunner<Integer, Pair<List<Interval>, List<Interval>>> patternRunner = new MemoryRunner [ int pos |
		val full_interval = new Interval(0, current_size - 1)
		val positives = newArrayList
		var current_positives = new Interval(pos, 2 * pos)
		val negatives = newArrayList
		var current_negatives = new Interval(3 * pos + 2, 4 * pos + 2)
		while (current_positives.overlapsWith(full_interval)) {
			positives.add(current_positives.intersection(full_interval))
			if (current_negatives.overlapsWith(full_interval))
				negatives.add(current_negatives.intersection(full_interval))
			current_positives = current_positives.translate(4 * (1 + pos))
			current_negatives = current_negatives.translate(4 * (1 + pos))
		}
		positives -> negatives
	]

	static final MemoryRunner2<Integer, Interval, Integer> intervalRunner = new MemoryRunner2 [ int phase, Interval el |
		((el.leftBound as int) .. (el.rightBound as int)).fold(0) [ acc1, el1 |
			acc1 + computeRunner.call(phase, el1)
		]
	]

	static final MemoryRunner2<Integer, Integer, Integer> computeRunner = new MemoryRunner2 [ int phase, int pos |
		if (phase != 0) {
			val pat = patternRunner.call(pos)
			val positive = pat.key.fold(0)[acc, el|acc + intervalRunner.call(phase - 1, el)]
			val negative = pat.value.fold(0)[acc, el|acc + intervalRunner.call(phase - 1, el)]
			Math.abs((positive - negative) % 10)
		} else {
			seed.get(pos % size)
		}
	]
}
