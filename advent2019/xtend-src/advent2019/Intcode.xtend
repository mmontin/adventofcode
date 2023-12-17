package advent2019

import adventutils.string.StringUtils
import java.util.ArrayList
import java.util.LinkedList
import java.util.List
import java.util.Map

class Intcode implements Runnable {

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

	List<Integer> first_opcodes

	public ListWrapper inputs
	public ListWrapper outputs
	List<Integer> opcodes
	public String name
	int pos

	new(List<Integer> opcodes_, ListWrapper inputs_, ListWrapper outputs_, String name_) {
		first_opcodes = opcodes_
		inputs = inputs_
		outputs = outputs_
		name = name_
		reset
	}

	new(List<Integer> opcodes_) {
		this(opcodes_, new ListWrapper(newArrayList), new ListWrapper(newArrayList), "")
	}

	def reset() {
		opcodes = new ArrayList(first_opcodes)
		pos = 0
	}

	override run() {
		var finished = false
		while (!finished) {
			println(name + " executing")
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
					synchronized (inputs) {
						if (inputs.empty) {
							println(name + " waiting")
							inputs.wait
						}
						if (inputs.halt)
							finished = true
						else
							opcodes.set(params.get(0).resolveI, inputs.poll)
					}
				case 4:
					synchronized (outputs) {
						outputs.add(params.get(0).resolve)
						println(name + " notifying")
						outputs.notify
					}
				case 5:
					if(params.get(0).resolve != 0) pos = params.get(1).resolve - (nb_params + 1)
				case 6:
					if(params.get(0).resolve == 0) pos = params.get(1).resolve - (nb_params + 1)
				case 7:
					opcodes.set(params.get(2).resolveI, params.get(0).resolve < params.get(1).resolve ? 1 : 0)
				case 8:
					opcodes.set(params.get(2).resolveI, params.get(0).resolve == params.get(1).resolve ? 1 : 0)
				case 99:
					finished = true
			}
			pos += nb_params + 1
		}
		synchronized (outputs) {
			println(name + " halting")
			outputs.halt = true
			outputs.notify
		}
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

	static class ListWrapper extends LinkedList<Integer> {

		public Integer lastProduced
		boolean halt

		new(List<Integer> list_) {
			super(list_)
			lastProduced = list_.last
			halt = false
		}
		
		override add(Integer i) {
			lastProduced = i
			super.add(i)
		}

		override toString() {
			halt + " ; " + super.toString
		}
	}
}
