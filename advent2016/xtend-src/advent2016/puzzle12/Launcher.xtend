package advent2016.puzzle12

import advent2016.Utils
import java.util.List
import java.util.Map

class Launcher {

	static final Map<String, Integer> registers = newHashMap("a" -> 0, "b" -> 0, "c" -> 1, "d" -> 0)
	static final List<String> input = Utils.getInputs(12)

	def static void main(String[] args) {
		var pos = 0
		while (pos < input.size) {
			val split = input.get(pos).split(" ")
			if (split.length == 2) {
				registers.replace(split.get(1), registers.get(split.get(1)) + (split.get(0).equals("inc") ? 1 : -1))
				pos++
			} else {
				var int value
				try 
					value = Integer::parseInt(split.get(1))
				catch (NumberFormatException nfe)
					value = registers.get(split.get(1))
				if (split.get(0).equals("cpy")) {
					registers.replace(split.get(2),value)
					pos++
				} else {
					if (value != 0)
						pos += Integer.parseInt(split.get(2))
					else
						pos ++
				}
			}
		}
		println(registers.get("a"))
	}
}
