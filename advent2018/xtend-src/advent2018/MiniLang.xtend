package advent2018

import java.util.ArrayList
import java.util.List
import java.util.Set

class MiniLang {

	static final public Set<String> instructions = newHashSet(
		"addr",
		"addi",
		"mulr",
		"muli",
		"borr",
		"bori",
		"banr",
		"bani",
		"setr",
		"seti",
		"gtir",
		"gtri",
		"gtrr",
		"eqir",
		"eqri",
		"eqrr"
	)

	protected List<Integer> registry

	new(List<Integer> _registry) {
		reset(_registry)
	}
	
	def reset(List<Integer> _registry) {
		registry = new ArrayList(_registry)
	}

	def execute(String instr) {
		val split = instr.split(" ")
		execute(split.get(0), Integer.parseInt(split.get(1)), Integer.parseInt(split.get(2)),
			Integer.parseInt(split.get(3)))
	}

	def execute(String instr, int a, int b, int c) {
		registry.set(c, switch instr {
			case "addr": registry.get(a) + registry.get(b)
			case "addi": registry.get(a) + b
			case "mulr": registry.get(a) * registry.get(b)
			case "muli": registry.get(a) * b
			case "borr": registry.get(a).bitwiseOr(registry.get(b))
			case "bori": registry.get(a).bitwiseOr(b)
			case "banr": registry.get(a).bitwiseAnd(registry.get(b))
			case "bani": registry.get(a).bitwiseAnd(b)
			case "setr": registry.get(a)
			case "seti": a
			case "gtir": a > registry.get(b) ? 1 : 0
			case "gtri": registry.get(a) > b ? 1 : 0
			case "gtrr": registry.get(a) > registry.get(b) ? 1 : 0
			case "eqir": a == registry.get(b) ? 1 : 0
			case "eqri": registry.get(a) == b ? 1 : 0
			case "eqrr": registry.get(a) == registry.get(b) ? 1 : 0
		})
	}
}
