package advent2021.puzzle8

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.Set

class Decoder {

	static final List<Set<Line>> numbers = newArrayList(
		newHashSet(Line.A, Line.B, Line.C, Line.E, Line.F, Line.G), 
		newHashSet(Line.C, Line.F),
		newHashSet(Line.A, Line.C, Line.D, Line.E, Line.G), 
		newHashSet(Line.A, Line.C, Line.D, Line.F, Line.G),
		newHashSet(Line.B, Line.C, Line.D, Line.F), 
		newHashSet(Line.A, Line.B, Line.D, Line.F, Line.G),
		newHashSet(Line.A, Line.B, Line.D, Line.E, Line.F, Line.G), 
		newHashSet(Line.A, Line.C, Line.F),
		newHashSet(Line.A, Line.B, Line.C, Line.D, Line.E, Line.F, Line.G),
		newHashSet(Line.A, Line.B, Line.C, Line.D, Line.F, Line.G))

	static final Map<Line, ArrayList<Integer>> map = listToMap(numbers)
	
	List<Set<Line>> data
	List<Set<Line>> goal
	Map<Line,ArrayList<Integer>> dataRev

	new(String line) {
		val split = line.split(" \\| ")
		data = newArrayList(split.get(0).split(" ").map[fromString])
		goal = newArrayList(split.get(1).split(" ").map[fromString])
		dataRev = listToMap(data)
	}

	def int decode1() {
		goal.map[length].fold(0) [ v, s |
			(s == 2 || s == 3 || s == 4 || s == 7) ? v + 1 : v
		]
	}

	def double decode2() {
		val decoded = new HashMap<Line,Set<Line>>
		
		map.entrySet.forEach[ e1 |
			dataRev.entrySet.forEach[ e2 | 
				if (e1.value.size == e2.value.size) decoded.merge(e1.key, newHashSet(e2.key))[ v , w |
					v.addAll(w)
					v
				]				
			]
		]
		
		newArrayList(2, 3, 4, 7).forEach[ i |
			numbers.filter[s | s.size == i].get(0).forEach[ e |
				decoded.get(e).retainAll(data.filter[s | s.size == i].get(0))
			]
		]
		
		val singletons = decoded.entrySet.fold(newHashSet)[ s , e |
			if (e.value.size == 1) s.addAll(e.value)
			s
		]
		decoded.values.filter[s | s.size > 1].forEach[s |
			s.removeAll(singletons)
		]
		
		val rev = decoded.entrySet.fold(new HashMap)[ m , e |
			m.put(e.value.get(0), e.key)
			m
		]

		var double ans = 0
		for (i : 0..<goal.size) {
			var rank = numbers.indexOf(goal.get(goal.size - 1 - i).map[
				line | rev.get(line)
			].toSet)
			ans += Math.pow(10,i) * rank
		}
		ans
	}

	def static Set<Line> fromString(String s) {
		newHashSet(s.toCharArray.map [ c |
			switch (c + '') {
				case 'a': Line.A
				case 'b': Line.B
				case 'c': Line.C
				case 'd': Line.D
				case 'e': Line.E
				case 'f': Line.F
				default: Line.G
			}
		])
	}

	def static listToMap(List<Set<Line>> list) {
		newHashSet(Line.A, Line.B, Line.C, Line.D, Line.E, Line.F, Line.G).fold(new HashMap) [ m, v |
			m.put(v, (0 ..< list.size).fold(new ArrayList) [ l, i |
				if(list.get(i).contains(v)) l.add(i)
				l
			])
			m
		]
	}
}
