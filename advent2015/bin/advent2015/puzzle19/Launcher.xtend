package advent2015.puzzle19

import adventutils.input.InputLoader
import java.util.HashMap
import java.util.List
import java.util.Map

class Launcher {

	static Map<String, String> transformations = new HashMap
	static List<String> patterns

	def static void main(String[] args) {

		val inputs = new InputLoader(2015,19).getInputs

		var String molecule = inputs.get(0)

		inputs.remove(0)

		inputs.forEach [
			val split = it.split(' => ')
			transformations.put(split.get(1), split.get(0))
		]

		patterns = transformations.keySet.toList.sortBy[it.length].reverse

		var result = 0

		while (!molecule.equals('e')) {
			val mols = molecule
			val pat = patterns.findFirst[mols.contains(it)]
			if (pat !== null) {
				molecule = molecule.replaceAll(pat, transformations.get(pat))
				result += mols.split(pat, -1).size - 1
			}
		}

		println(result)
	}
}
