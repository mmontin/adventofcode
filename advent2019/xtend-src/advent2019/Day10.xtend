package advent2019

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashSet

class Day10 {
	def static void main(String[] args) {
		
		val asteroids = newArrayList
		new InputLoader(2019, 10).chars.fold(0) [ i, el |
			el.fold(0) [j,s|
				if (s.equals("#")) asteroids.add(new Coordinate(i,j))
				j+1
			]
			i+1
		]
		
		val asteroids_set = new HashSet(asteroids)
		
		val visible = newHashMap
		
		val nb_of_asteroids = asteroids.size
		for (i : 0..<nb_of_asteroids) {
			for (j : i+1..<nb_of_asteroids) {
				val first = asteroids.get(i)
				val second = asteroids.get(j)
				val vect = second.diff(first)
				var current = first.add(vect)
				while (!asteroids_set.contains(current)) 
					current = current.add(vect)
				
				visible.merge(first,newHashSet(current))[x,y|x.addAll(y) ; x]
				visible.merge(current,newHashSet(first))[x,y|x.addAll(y) ; x]
			}
		}
		
		val best_spot = visible.entrySet.maxBy[value.size]
		println(best_spot.value.size)
		println(best_spot.key)
		println(best_spot.value.map[
			val vector = it.diff(best_spot.key)
			it -> Math.acos(-vector.x/vector.length)].sortBy[value])


	}
}
