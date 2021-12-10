package advent2021.puzzle9

import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.Set

class Area {
	
	Map<Coordinates,Integer> map
	
	new(List<List<Integer>> input) {
		map = newHashMap ;
		(0..input.size-1).forEach[i |
			(0..input.get(0).size-1).forEach[ j |
				map.put(new Coordinates(i,j), input.get(i).get(j))
			]
		]
	}
	
	def neighbours(Coordinates c) {
		c.neighbours.filter[map.containsKey(it)]
	}
	
	def lowPoints() {
		map.entrySet.fold(newHashSet)[v , e |
			if (isLowPoint(e.key)) v.add(e.key)
			v
		]
	}
	
	def isLowPoint(Coordinates c) {
		neighbours(c).fold(true)[b , v | b && map.get(v) > map.get(c) ]
	}
	
	def get(Coordinates c) {
		map.get(c)
	}
	
	def Set<Coordinates> floodUp(Set<Coordinates> coords) {
		coords.fold(new HashSet(coords))[s , cs |
			s.addAll(neighbours(cs))
			s
		].filter[get(it) != 9].toSet
	}
	
	def floodUpToMaximum(Coordinates c) {
		var Set<Coordinates> input = newHashSet(c)
		var previousSize = 1
		var size = 0
		while (size != previousSize) {
			previousSize = input.size
			input = floodUp(input)
			size = input.size
		}
		size
	}
}