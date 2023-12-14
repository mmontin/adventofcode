package advent2019

import java.util.List
import java.util.Map

class Intcode {

	static final Map<Integer, Pair<String, Integer>> codes = newHashMap(
		99 -> ("halt" -> 0),
		1 -> ("add" -> 3),
		2 -> ("mult" -> 3)
	)

	List<Integer> opcodes
	int pos

	new(List<Integer> opcodes_) {
		opcodes = opcodes_
		pos = 0
	}
	
//	def reset(List<Integer> opcodes_)
	
	def process() {
		var current = opcodes.get(pos)
		while (current != 99) {
			println("LOOOL")
			if (current == 1)
				executeAdd(pos + 1, true, pos + 2, true, pos + 3)
			else
				executeMult(pos + 1, true, pos + 2, true, pos + 3)
			current = opcodes.get(pos)
		}
	}

	def private getWithMod(int i, boolean mod_i) {
		var val_i = opcodes.get(i)
		if(mod_i) val_i = opcodes.get(val_i)
		val_i
	}

	def private executeAdd(int i, boolean mod_i, int j, boolean mod_j, int k) {
		val val_i = getWithMod(i, mod_i)
		var val_j = getWithMod(j, mod_j)
		opcodes.set(k, val_i + val_j)
		pos += 4
	}
	
	def private executeMult(int i, boolean mod_i, int j, boolean mod_j, int k) {
		val val_i = getWithMod(i, mod_i)
		var val_j = getWithMod(j, mod_j)
		opcodes.set(k, val_i * val_j)
		pos += 4
	}	
	
	def result() {
		opcodes.get(0)
	}
}
