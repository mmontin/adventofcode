package advent2021.puzzle19

import advent2021.Utils
import java.util.HashMap
import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.Set

class Launcher {
	
	def static void main(String[] args) {
		
		val data = newArrayList
		val inputReader = Utils.getInputReader(19)
		var String tmp_string
		var List<Vector> map
		while((tmp_string = inputReader.readLine)!==null) {
			if (tmp_string.contains("scanner")) map = newArrayList
			else if (tmp_string.isEmpty) data.add(map)
			else map.add(new Vector(tmp_string))
		}
		
		map = data.get(0)
		data.remove(0)
		
		while (data.size != 1) {
			val dist1 = map.distances
			var max = 0
			var index = 0
			var Map<Integer,Coordinate> dist2
			var Set<Integer> inters
			for (i : 0..<data.size) {
				val dist_tmp = data.get(i).distances
				val dist_dup = new HashSet(dist1.keySet)
				dist_dup.retainAll(dist_tmp.keySet)
				if (dist_dup.size > max) {
					max = dist_dup.size
					index = i
					dist2 = dist_tmp
					inters = dist_dup
				}
			}
			dist1.keySet.retainAll(inters)
			dist2.keySet.retainAll(inters)
			val y = map.size + data.get(index).size
			map = collapse(map,dist1,data.get(index),dist2)
			println(y - map.size)
			println('----------------')
			data.remove(index)
		}
		
		println(map.size)
	}
	
	def static collapse(List<Vector> vectors1, HashMap<Integer,Coordinate> dists1, List<Vector> vectors2, Map<Integer,Coordinate> dists2) {
		val mapping = newHashMap
		dists1.entrySet.forEach[
			val coord1 = it.value
			val coord2 = dists2.get(it.key)
			mapping.merge(coord1.x,#{coord2.x,coord2.y})[s1 , s2 | val s3 = new HashSet(s2) ; s3.retainAll(s1) ; s3]
			mapping.merge(coord1.y,#{coord2.x,coord2.y})[s1 , s2 | val s3 = new HashSet(s2) ; s3.retainAll(s1) ; s3]
		]
		
		val e1 = mapping.entrySet.get(0)
		val e2 = mapping.entrySet.get(1)
		
		val v11 = vectors1.get(e1.key)
		val v12 = vectors1.get(e2.key)
		
		val v11tov12 = v11.to(v12)
		
		val v21 = vectors2.get(e1.value.toList.get(0))
		val v22 = vectors2.get(e2.value.toList.get(0))
		
		val v21tov22 = v21.to(v22)

		val transformation = new Matrix(v21tov22,v11tov12)

		vectors2.forEach[it.multiplyBy(transformation)]

		val translation = v21.to(v11)
		
		vectors2.forEach[it.add(translation)]

		val output = new HashSet(vectors1)
		output.addAll(vectors2)

		output.toList
	}
	
	def static distances(List<Vector> vectors) {
		(0..<vectors.size).fold(newHashMap)[s , i |
			(i+1..<vectors.size).fold(s)[s1 , j |
				s1.put(vectors.get(i).to(vectors.get(j)).size2,new Coordinate(i,j))
				s1
			]
		]
	}
}