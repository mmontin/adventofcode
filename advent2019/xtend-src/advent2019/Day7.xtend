package advent2019

import advent2019.Intcode.ListWrapper
import adventutils.collection.ListUtils
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day7 implements Runnable {

	def static void main(String[] args) {

		val opcodes = new InputLoader(2019, 7).inputs.get(0).split(",").map[Integer.parseInt(it)]

//		val inputs = newArrayList
//		val outputs = newArrayList
//		val decoder = new Intcode(opcodes, new ListWrapper(inputs), new ListWrapper(outputs), "")
//
//		println(ListUtils.permute(newArrayList(0, 1, 2, 3, 4)).map [
//			it.fold(0) [ acc, el |
//				inputs.add(el)
//				inputs.add(acc)
//				decoder.run
//				decoder.reset
//				val res = outputs.last
//				inputs.clear
//				outputs.clear
//				res
//			]
//		].max)
		val launchers = ListUtils.permute(newArrayList(5, 6, 7, 8, 9)).map [
			new Day7(opcodes, it)
		]

		val threads = launchers.map[new Thread(it)]

		threads.forEach [
			start
		]
		threads.forEach[join]

		println(launchers.map[answer].max)
	}

	List<ListWrapper> outputs
	List<Intcode> decoders

	new(List<Integer> opcodes, List<Integer> permut) {
		outputs = new ArrayList(permut.map[new ListWrapper(newArrayList(it))])
		outputs.get(0).add(0)
		decoders = new ArrayList((0 .. 4).map [
			new Intcode(
				opcodes,
				outputs.get(it),
				outputs.get((it + 1) % 5),
				permut.get(it).toString
			)
		].toList)
	}

	override run() {
		val threads = decoders.map[new Thread(it)]
		threads.forEach[start]
		threads.get(4).join
	}

	def int getAnswer() {
		outputs.get(0).lastProduced
	}
}
