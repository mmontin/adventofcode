package advent2016.puzzle9

import advent2016.Utils
import java.util.Map
import java.util.Set
import java.util.regex.Pattern

class Launcher {
	def static void main(String[] args) {

		var toProcess = Utils.getInputs(9).get(0)

		val pattern = Pattern.compile("\\([^\\)]*\\)")
		val matcher = pattern.matcher(toProcess)
		
		val Set<Integer> indexes_to_ignore = newHashSet
		val Map<Integer,Integer> multipliers = newHashMap
		
		while (matcher.find()) {

			val split = toProcess.substring(matcher.start, matcher.end).split("x")
			var length = Integer::parseInt(split.get(0).substring(1))
			
			(matcher.start..<matcher.end).forEach[
				indexes_to_ignore.add(it)
			]
			
			(matcher.end..<matcher.end+length).forEach[
				multipliers.merge(it,Integer::parseInt(split.get(1).substring(0,split.get(1).length-1)))[u , v | u * v]
			]
		}
		
		println((0..<toProcess.length).fold(0L)[sum , i |
			sum + (indexes_to_ignore.contains(i) ? 0 : multipliers.getOrDefault(i,1))
		])
	}
}