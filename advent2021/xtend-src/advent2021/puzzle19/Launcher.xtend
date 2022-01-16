package advent2021.puzzle19

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashMap
import java.util.HashSet
import java.util.List
import java.util.Map

class Launcher {

	def static void main(String[] args) {

		val data = newArrayList
		val inputReader = new InputLoader(2021,19).getInputReader
		var String tmp_string
		var List<Vector> map
		while (!(tmp_string = inputReader.readLine).equals("#")) {
			if (tmp_string.contains("scanner"))
				map = newArrayList
			else if(tmp_string.isBlank) data.add(map) else map.add(new Vector(tmp_string))
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

		val processed_indices = newHashSet(0)
		adjacency.remove(0)
		val scanners_positions = newHashSet
		scanners_positions.add(new Vector(0,0,0))
		
		while (!adjacency.empty) {
			val entry = adjacency.entrySet.findFirst[
				val dup = new HashSet(it.value)
				dup.retainAll(processed_indices)
				!dup.isEmpty
			]
			entry.value.retainAll(processed_indices)
			val pivot = entry.value.last

			scanners_positions.add(collapse(data.get(pivot),data_distances.get(pivot),data.get(entry.key),data_distances.get(entry.key)))

			processed_indices.add(entry.key)
			adjacency.remove(entry.key)
		}
		
		val beacons = data.fold(newHashSet)[set , vectors |
			set.addAll(vectors)
			set
		].toList
		
		println("PART 1: " + beacons.size)
		
		val scanners = scanners_positions.toList
		
		var max_size = 0
		for (i : 0..<scanners.size)
			for (j : i+1..<scanners.size)
				max_size = Math.max(max_size,scanners.get(i).to(scanners.get(j)).sumAbs)
				
		println("PART 2: " + max_size)
	}

	def static collapse(List<Vector> vectors1, HashMap<Integer, Coordinate> dists1, List<Vector> vectors2, Map<Integer, Coordinate> dists2) {

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

		val	e2 = mapping.entrySet.get(1)
		val	v12 = vectors1.get(e2.key)
		val	v22 = vectors2.get(e2.value.toList.get(0))
		val	v11tov12 = v11.to(v12)
		val	v21tov22 = v21.to(v22)

		val rotation = new Matrix(v21tov22, v11tov12)

		vectors2.forEach[it.multiplyBy(rotation)]

		val translation = v21.to(v11)
		vectors2.forEach[it.add(translation)]

		translation
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
