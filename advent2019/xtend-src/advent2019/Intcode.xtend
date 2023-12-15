package advent2019

import adventutils.string.StringUtils
import java.util.List
import java.util.Map

class Intcode {

	public static final Map<Integer, Pair<String, Integer>> codes = newHashMap(
		99 -> ("halt" -> 0),
		1 -> ("add" -> 3),
		2 -> ("mult" -> 3),
		3 -> ("input" -> 1),
		4 -> ("output" -> 1)
	)
	public static final int inst_size = codes.values.map[value].max + 2

	List<Integer> opcodes
	int pos

	new(List<Integer> opcodes_) {
		opcodes = opcodes_
		pos = 0
	}

	def process() {
		while (!processCommand) {
		}
	}

	def processCommand() {
		var current = StringUtils.padWith(opcodes.get(pos).toString, "0", inst_size)
		var opcode = Integer.parseInt(current.substring(inst_size - 2))
		var nb_params = codes.get(opcode).value
		val modes = StringUtils.reverse(current.substring(0, inst_size - 2))
		val params = (0 ..< nb_params).map[
			resolveParameter(pos + it + 1, modes.substring(it,it+1).equals("0"))
		].toList
		println(params)
		var finished = false
		switch (opcode) {
			case 1:
				opcodes.set(params.get(2), params.get(0) + params.get(1))
			case 2:
				opcodes.set(params.get(2), params.get(0) * params.get(1))
			case 99:
				finished = true
		}
		pos += nb_params + 1
		println(opcodes)
		finished
	}

	def private resolveParameter(int i, boolean mode) {
		println("------------------------------")
		println("RESOLVING " + i + " " + mode)
		var res = opcodes.get(i)
		if(mode) res = opcodes.get(res)
		println(res)
		res
	}

	def result() {
		opcodes.get(0)
	}
}
