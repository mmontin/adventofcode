package advent2021.puzzle19

import advent2021.Utils
import java.util.HashMap
import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.Set
import java.util.Map.Entry

class Launcher {

	def static void main(String[] args) {

		val data = newArrayList
		val inputReader = Utils.getInputReader(19)
		var String tmp_string
		var List<Vector> map
		while ((tmp_string = inputReader.readLine) !== null) {
			if (tmp_string.contains("scanner"))
				map = newArrayList
			else if(tmp_string.isEmpty) data.add(map) else map.add(new Vector(tmp_string))
		}

		val data_distances = data.fold(newArrayList) [ l, vectors |
			l.add(vectors.distances)
			l
		]

		val adjacency = (0 ..< data_distances.size).fold(newHashMap) [ m, i |
			(0 ..< data_distances.size).fold(m) [ m2, j |
				val newm = new HashMap(data_distances.get(i))
				newm.keySet.retainAll(data_distances.get(j).keySet)
				if (newm.size >= 66 && i != j)
					m2.merge(i,newHashSet(j))[r , s | r.addAll(s) ; r]
				m2
			]
		]

		println(adjacency)
	}

	def static collapse(List<Vector> vectors1, HashMap<Integer, Coordinate> dists1, List<Vector> vectors2,
		Map<Integer, Coordinate> dists2) {

		val dists1_dup = new HashMap(dists1)
		dists1_dup.keySet.retainAll(dists2.keySet)

		val mapping = newHashMap
		dists1_dup.entrySet.forEach [
			val coord1 = it.value
			val coord2 = dists2.get(it.key)
			mapping.merge(coord1.x, #{coord2.x, coord2.y})[s1, s2|val s3 = new HashSet(s2); s3.retainAll(s1); s3]
			mapping.merge(coord1.y, #{coord2.x, coord2.y})[s1, s2|val s3 = new HashSet(s2); s3.retainAll(s1); s3]
		]

		mapping.keySet.removeIf[mapping.get(it).size != 1]

		val e1 = mapping.entrySet.get(0)
		val v11 = vectors1.get(e1.key)
		val v21 = vectors2.get(e1.value.toList.get(0))

		var i = 1
		var Entry<Integer, Set<Integer>> e2
		var Vector v12
		var Vector v22
		var Vector v11tov12
		var Vector v21tov22
		do {
			e2 = mapping.entrySet.get(i++)
			v12 = vectors1.get(e2.key)
			v22 = vectors2.get(e2.value.toList.get(0))
			v11tov12 = v11.to(v12)
			v21tov22 = v21.to(v22)
		} while (v11tov12.containsZ || v11tov12.hasDuplicates || v21tov22.containsZ || v21tov22.hasDuplicates)

		val rotation = new Matrix(v21tov22, v11tov12)

		vectors2.forEach[it.multiplyBy(rotation)]

		val translation = v21.to(v11)
		vectors2.forEach[it.add(translation)]
	}

	def static distances(List<Vector> vectors) {
		(0 ..< vectors.size).fold(newHashMap) [ s, i |
			(i + 1 ..< vectors.size).fold(s) [ s1, j |
				s1.put(vectors.get(i).to(vectors.get(j)).size2, new Coordinate(i, j))
				s1
			]
		]
	}
}
