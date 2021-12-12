package advent2021.puzzle12

import advent2021.Utils
import java.util.ArrayList
import java.util.List
import java.util.Map
import java.util.Set

class Launcher {
	
	static Map<String,Set<String>> graph = newHashMap
	static Set<List<String>> paths = newHashSet	
	
	def static void main(String[] args) {
		Utils.getInputs(12)[it.split("-")].forEach[
			graph.merge(it.get(0), newHashSet(it.get(1)))[v , w | v.addAll(w) v]
			graph.merge(it.get(1), newHashSet(it.get(0)))[v , w | v.addAll(w) v]
		]
		
		paths(newArrayList("start"),"start")
		println(paths.size)
		
		paths.clear
		paths(newArrayList,"start")
		println(paths.size)
	}
	
	def static void paths(List<String> visited, String current) {
		current.equals("end") ?	paths.add(visited) : {
			visited.add(current)
			graph.get(current).filter[
				!it.equals("start")
			].filter[
				Character.isUpperCase(it.charAt(0)) ||
				(!hasDuplicates(visited) || !visited.contains(it))
			].forEach[
				paths(new ArrayList(visited),it)
			]
		}
	}
	
	def static hasDuplicates(List<String> l) {
		val trim = l.filter[Character.isLowerCase(it.charAt(0))]
		trim.size != trim.toSet.size
	}
}