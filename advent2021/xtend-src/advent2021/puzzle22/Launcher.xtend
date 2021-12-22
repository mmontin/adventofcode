package advent2021.puzzle22

import advent2021.Utils
import java.math.BigInteger
import java.util.Set

class Launcher {

	def static void main(String[] args) {

		var Set<Cuboid> cuboids = newHashSet

		for (s : Utils.getInputs(22)) {
			val split = s.split(" ")
			val on = split.get(0).equals("on")
			val cuboid = new Cuboid(split.get(1))
			cuboids = cuboids.fold(newHashSet) [ set , c |
				set.addAll(c.subtract(cuboid))
				set
			]
			if(on) cuboids.add(cuboid)
		}
		println(cuboids.fold(BigInteger.ZERO)[v, c|v.add(c.size)])
	}
}
