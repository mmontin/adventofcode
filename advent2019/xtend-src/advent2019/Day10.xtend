package advent2019

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashSet

class Day10 {

	def static void main(String[] args) {

		val asteroids = newArrayList
		new InputLoader(2019, 10).chars.fold(0) [ i, el |
			el.fold(0) [ j, s |
				if(s.equals("#")) asteroids.add(new Coordinate(j, -i))
				j + 1
			]
			i + 1
		]
		val asteroids_set = new HashSet(asteroids)

		val visible = newHashMap

		val nb_of_asteroids = asteroids.size
		for (i : 0 ..< nb_of_asteroids) {
			for (j : i + 1 ..< nb_of_asteroids) {
				val first = asteroids.get(i)
				val second = asteroids.get(j)
				val vect = second.subtract(first).reduce
				var current = first.add(vect)
				while (!asteroids_set.contains(current)) {
					current = current.add(vect)
				}

				visible.merge(first, newHashSet(current))[x, y|x.addAll(y); x]
				visible.merge(current, newHashSet(first))[x, y|x.addAll(y); x]
			}
		}

		val best_spot = visible.entrySet.maxBy[value.size]
		val best_location = best_spot.key

		val visible_from_best_location = best_spot.value.map [
			it.subtract(best_location)
		].sort

		println(visible_from_best_location.size)
	    println(visible_from_best_location.sortInplace[c1,c2|c1.compare(c2)])
		println(visible_from_best_location.sortInplace[x,y|x.compare(y)].get(199).add(best_location).symByY(0))
	}

	static def compare(Coordinate c1, Coordinate c2) {
		val quartile1 = c1.quartile
		val quartile2 = c2.quartile
		if (quartile1 != quartile2)
			quartile1.compareTo(quartile2)
		else {
			val angle1 = Math.atan(Math.abs(c1.x as double / c1.y as double))
			val angle2 = Math.atan(Math.abs(c2.x as double / c2.y as double))
			switch (quartile1) {
				case 1: c1.y.compareTo(c2.y)
				case 3: c1.x.compareTo(c1.y)
				case 5: c2.y.compareTo(c2.y)
				case 7: c2.x.compareTo(c1.x)
				case 2: angle1.compareTo(angle2)
				case 4: angle2.compareTo(angle1)
				case 6: angle1.compareTo(angle2)
				default: angle2.compareTo(angle1)
			}
		}
	}

	def static quartile(Coordinate c) {
		switch (c) {
			case c.y == 0 && c.x > 0: 3
			case c.y == 0: 7
			case c.x == 0 && c.y > 0: 1
			case c.x == 0: 5
			case c.x > 0 && c.y > 0: 2
			case c.x > 0: 4
			case c.x < 0 && c.y < 0: 6
			default: 8
		}
	}
}
