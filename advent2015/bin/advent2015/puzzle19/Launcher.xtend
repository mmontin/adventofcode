package advent2015.puzzle19

import advent2015.Utils
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set

class Launcher {
	
	static val Map<String, Set<String>> transformations = new HashMap

	def static void main(String[] args) {

		val inputs = Utils.getInputs(19)
		
		var Set<String> inputSet = new HashSet
		inputSet.add(inputs.get(0))

		inputs.remove(0)

		inputs.forEach [ l |
			val split = l.split(' => ')
			val left = split.get(0)
			val right = split.get(1)
			if (!transformations.containsKey(right))
				transformations.put(right, new HashSet)
			transformations.get(right).add(left)
		]
		
		inputSet = performSet(inputSet)
		inputSet = performSet(inputSet)
		inputSet = performSet(inputSet)
		println(inputSet.size)	
	}
	
	def static performSet(Set<String> samples) {
		val Set<String> output = new HashSet
		transformations.entrySet.forEach[e |
			val left = e.key
			e.value.forEach[ right |
				samples.forEach[s | output.addAll(perform(s, left, right))]
			]
		]
		output
	}
	
	def static perform(String sample, String left, String right) {
		val Set<String> outputs = new HashSet
		var startingIndex = 0
		while (startingIndex < sample.length) {
			var pos = sample.indexOf(left, startingIndex)
			if (pos == -1)
				startingIndex = sample.length
			else {
				outputs.add(sample.substring(0, pos) + right + sample.substring(pos + left.length))
				startingIndex += left.length
			}
		}
		outputs
	}
}