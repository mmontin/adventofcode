package advent2015.puzzle24

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Set

class Launcher {

	static Set<Set<Integer>> possible_subsets = newHashSet
	static int min_size = Integer::MAX_VALUE

	def static void main(String[] args) {
		val packages = new InputLoader(2015,24).getInputs.get(0).split(' ').reverse.map[Integer::parseInt(it)].toList
		compute(packages, packages.fold(0)[x, y|x + y] / 4, newHashSet)
		println(possible_subsets.fold(Long::MAX_VALUE)[min, s|Math.min(min, s.fold(Long.valueOf(1))[v, e|v * e])])
	}

	def static update(Set<Integer> packages) {
		possible_subsets.add(packages)
		min_size = possible_subsets.fold(Integer::MAX_VALUE)[min, s|Math.min(min, s.size)]
		possible_subsets.removeIf[it.size > min_size]
	}

	def static void compute(List<Integer> remaining_candidates, Integer remaining_weight, Set<Integer> packages_already_taken) {
		if (packages_already_taken.size <= min_size) {
			if (remaining_weight == 0)
				update(packages_already_taken)
			else {
				val candidates_refined = new ArrayList(remaining_candidates)
				candidates_refined.removeIf[x|x > remaining_weight]
				val difference = candidates_refined.fold(0)[v, x|v + x] - remaining_weight
				if (difference == 0) {
					packages_already_taken.addAll(candidates_refined)
					update(packages_already_taken)
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
}
