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
		4 -> ("output" -> 1),
		5 -> ("jump-if-true" -> 2),
		6 -> ("jump-if-false" -> 2),
		7 -> ("less-then" -> 3),
		8 -> ("equal" -> 3)
	)
	public static final int inst_size = codes.values.map[value].max + 2

	List<Integer> opcodes
	int pos

	new(List<Integer> opcodes_) {
		reset(opcodes_)
	}
	
	def reset(List<Integer> opcodes_) {
		opcodes = opcodes_
		pos = 0
	}

	def process() {
		processWithInputs(newArrayList)
	}

	def processWithInputs(List<Integer> inputs) {
		var finished = false
		var outputs = newArrayList
		var index = 0
		while (!finished) {
			var current = StringUtils.padWith(opcodes.get(pos).toString, "0", inst_size)
			var opcode = Integer.parseInt(current.substring(inst_size - 2))
			var nb_params = codes.get(opcode).value
			val modes = StringUtils.reverse(current.substring(0, inst_size - 2))
			val params = (0 ..< nb_params).map [
				pos + it + 1 -> modes.substring(it, it + 1).equals("0")
			].toList
			switch (opcode) {
				case 1:
					opcodes.set(params.get(2).resolveI, params.get(0).resolve + params.get(1).resolve)
				case 2:
					opcodes.set(params.get(2).resolveI, params.get(0).resolve * params.get(1).resolve)
				case 3:
					opcodes.set(params.get(0).resolveI, inputs.get(index ++))
				case 4:
					outputs.add(params.get(0).resolve)
				case 5: 
					if (params.get(0).resolve != 0)  pos = params.get(1).resolve - (nb_params + 1)
				case 6:
					if (params.get(0).resolve == 0)  pos = params.get(1).resolve - (nb_params + 1)
				case 7:
					opcodes.set(params.get(2).resolveI, params.get(0).resolve < params.get(1).resolve ? 1 : 0)
				case 8:
					opcodes.set(params.get(2).resolveI, params.get(0).resolve == params.get(1).resolve ? 1 : 0)
				case 99:
					finished = true
			}
			pos += nb_params + 1
		}
		outputs
	}

	def private resolveI(Pair<Integer, Boolean> input) {
		resolve(input.key -> false)
	}

	def private resolve(Pair<Integer, Boolean> input) {
		val i = input.key
		val mode = input.value
		var res = opcodes.get(i)
		if(mode) res = opcodes.get(res)
		res
	}

	def result() {
		opcodes.get(0)
	}
}
