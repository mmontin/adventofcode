package advent2017

import adventutils.input.InputLoader
import java.util.List
import java.util.Map
import java.util.Stack

class Day18 {

	static final List<List<String>> commands = new InputLoader(2017, 18).inputs.map[it.split(" ").toList]

	def static void main(String[] args) {

		val registers = newHashMap
		val sent = new Stack<Long>
		var position = 0
		var finished = false
		do {
			val output = executeThisCommand(commands.get(position), registers, position, sent)
			finished = output.key
			position = output.value
		} while (!finished)
		println(sent.peek)

		val registersZero = newHashMap
		val registersOne = newHashMap("p" -> 1L)
		var List<Long> zeroSends = newArrayList
		var List<Long> oneSends = newArrayList
		var positionZero = 0
		var positionOne = 1
		var idleZero = false
		var idleOne = false
		var nbSentByOne = 0
		do {
			val resZero = executeThisDifferently(commands.get(positionZero), registersZero, positionZero, zeroSends, oneSends)
			idleZero = resZero == positionZero
			positionZero = resZero
			
			val currentSize = oneSends.size
			val resOne = executeThisDifferently(commands.get(positionOne), registersOne, positionOne, oneSends, zeroSends)
			if (oneSends.size > currentSize) nbSentByOne ++
			idleOne = resOne == positionOne
			positionOne = resOne
		} while (!idleZero || !idleOne)
		
		println(nbSentByOne)
	}

	def static executeThisCommand(List<String> l, Map<String, Long> registers, Integer position, Stack<Long> sent) {
		var finished = false
		var int new_position = position
		switch (l.get(0)) {
			case "snd":
				sent.push(registers.getOrDefault(l.get(1), 0L))
			case "set":
				registers.put(l.get(1), registers.getMeAValue(l.get(2)))
			case "add":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) + registers.getMeAValue(l.get(2)))
			case "mul":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) * registers.getMeAValue(l.get(2)))
			case "mod":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) % registers.getMeAValue(l.get(2)))
			case "rcv":
				if(sent.peek != 0) finished = true
			default:
				if(registers.getMeAValue(l.get(1)) > 0) new_position += (registers.getMeAValue(l.get(2)) - 1) as int
		}
		finished -> new_position + 1
	}

	def static executeThisDifferently(List<String> l, Map<String, Long> registers, Integer position, List<Long> sends, List<Long> receives) {
		var int new_position = position
		switch (l.get(0)) {
			case "snd":
				sends.add(registers.getOrDefault(l.get(1), 0L))
			case "set":
				registers.put(l.get(1), registers.getMeAValue(l.get(2)))
			case "add":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) + registers.getMeAValue(l.get(2)))
			case "mul":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) * registers.getMeAValue(l.get(2)))
			case "mod":
				registers.put(l.get(1), registers.getMeAValue(l.get(1)) % registers.getMeAValue(l.get(2)))
			case "rcv":
				receives.size == 0 ? new_position-- : registers.put(l.get(1), receives.remove(0))
			default:
				if(registers.getMeAValue(l.get(1)) > 0) new_position += (registers.getMeAValue(l.get(2)) - 1) as int
		}
		new_position + 1
	}

	def static getMeAValue(Map<String, Long> registers, String s) {
		try
			Long.parseLong(s)
		catch (NumberFormatException nfe)
			registers.containsKey(s)
				? registers.get(s)
				: {
				registers.put(s, 0L)
				0L
			}
	}
}
