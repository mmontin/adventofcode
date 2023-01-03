package advent2018

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.Set

class Day3 {
	def static void main(String[] args) {
		
		val rectangles = new InputLoader(2018,3).inputs.map[new Rectangle(it)]
		val coordinates = rectangles.fold(newArrayList)[acc,v|
			acc.addAll(v.coordinates)
			acc
		]
		val groups = coordinates.groupBy[it].values
		println(groups.filter[it.size >= 2].size)
		
		val untouched = groups.filter[it.size == 1].map[toSet].reduce[u,v | u.addAll(v) ; u]
		
		var i = 0
		var changed = true
		while (i < rectangles.size && changed) {
			changed = rectangles.get(i).coordinates.retainAll(untouched)
			i ++
		}
		i --
		println(rectangles.get(i).name)
	}
	
	static class Rectangle {
		
		int name
		Set<Coordinate> coordinates
		
		new(String s) {
			val split1 = s.split(" @ ")
			name = Integer.parseInt(split1.get(0).replace("#",""))
			val split2 = split1.get(1).split(": ")
			val origin = new Coordinate(split2.get(0))
			val size = new Coordinate(split2.get(1).replace('x',','))
			coordinates = newHashSet ;
			(0..<size.x).forEach[i |
				(0..<size.y).forEach[j |
					coordinates.add(new Coordinate(origin.x + i, origin.y + j))
				]
			]
		}
	}
}
