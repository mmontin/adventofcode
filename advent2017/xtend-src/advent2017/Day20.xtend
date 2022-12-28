package advent2017

import adventutils.input.InputLoader
import java.util.List
import adventutils.geometry.Triplet
import java.util.HashSet

class Day20 {

	static final List<String> input = new InputLoader(2017, 20).inputs

	def static void main(String[] args) {

		val accs = input.map [
			var last_part = it.split("a=<").get(1)
			last_part = last_part.substring(0, last_part.length - 1)
			val splitty = last_part.split(",")
			val a = Math.abs(Integer.parseInt(splitty.get(0)))
			val b = Math.abs(Integer.parseInt(splitty.get(1)))
			val c = Math.abs(Integer.parseInt(splitty.get(2)))
			a + b + c
		]
		println(accs.lastIndexOf(accs.min))

		var particles = newHashSet
		particles.addAll(input.map[new Particle(it)])
		for (i : 0 .. 38) {
			particles.forEach[it.update]
			particles = new HashSet(particles.groupBy[position].values.filter[it.size == 1].reduce[p, q|p.addAll(q); p])
		}
		println(particles.size)
	}

	static class Particle {

		Triplet position
		Triplet velocity
		Triplet acceleration

		new(String line) {
			val split1 = line.split("<")
			position = new Triplet(split1.get(1).split(">").get(0))
			velocity = new Triplet(split1.get(2).split(">").get(0))
			acceleration = new Triplet(split1.get(3).split(">").get(0))
		}

		def update() {
			velocity = velocity.add(acceleration)
			position = position.add(velocity)
		}

		override hashCode() {
			position.hashCode
		}

		override equals(Object other) {
			switch (other) {
				Particle: other.position.equals(position)
				default: false
			}
		}
	}
}
