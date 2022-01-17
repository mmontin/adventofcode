package advent2016.puzzle23

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List
import java.util.Map

class Launcher {
	
	public static List<Instruction> instructions = new ArrayList(new InputLoader(2016,23).getInputs[new Instruction(it)])
	public static Map<String,Integer> registers = newHashMap("a" -> 7, "b" -> 0, "c" -> 0, "d" -> 0)
	public static int position = 0
	
	def static void main(String[] args) {

		while (position < instructions.size) {
			instructions.get(position).execute
		}

		println(registers.get("a"))
	}
}