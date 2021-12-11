package advent2015.puzzle24

import advent2015.Utils
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set

class Launcher {
	
	static Set<Set<Integer>> possible_subsets = newHashSet
	
	def static void main(String[] args) {
		val packages = Utils.getInputs(24).get(0).split(' ').reverse.map[Integer::parseInt(it)].toList
		println(packages)
		val critical_value = packages.fold(0)[x , y | x + y] / 3
		println(critical_value)
		compute(packages,critical_value,newHashSet)
		println(possible_subsets)
	}
	
	def static void compute(List<Integer> remaining_candidates, Integer remaining_weight, Set<Integer> packages_already_taken) {
		if (remaining_weight == 0)
			possible_subsets.add(packages_already_taken)
		else {
			val candidates_refined = new ArrayList(remaining_candidates)
			candidates_refined.removeIf[ x | x > remaining_weight ]
			val difference = candidates_refined.fold(0)[v, x|v + x] - remaining_weight
			if (difference == 0) {
				packages_already_taken.addAll(candidates_refined)
				possible_subsets.add(packages_already_taken)
			} else if (difference > 0) {
				val first = candidates_refined.get(0)
				candidates_refined.remove(0)
				val new_pat = new HashSet(packages_already_taken)
				new_pat.add(first)
				compute(candidates_refined, remaining_weight - first, new_pat)
				compute(candidates_refined, remaining_weight, new HashSet(packages_already_taken))
			}
		}
	}
}