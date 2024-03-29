package advent2016.puzzle6

import adventutils.input.InputLoader
import java.util.HashMap

class Launcher {
	def static void main(String[] args) {
		var ans1 = ""
		var ans2 = ""
		
		val input = new InputLoader(2016,6).getInputs[it.toCharArray]
		for (j : 0..<input.get(0).size) {
			val map = new HashMap<Character,Integer>
			for (i : 0..<input.size) map.merge(input.get(i).get(j),1)[u , v | u + v]
			val ansTmp = map.entrySet.sortBy[it.value]
			ans1 += ansTmp.last.key
			ans2 += ansTmp.get(0).key
		}
		
		println(ans1)
		println(ans2)
	}
}