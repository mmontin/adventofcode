package advent2018

import adventutils.geometry.Interval
import adventutils.geometry.Triplet
import adventutils.input.InputLoader
import java.util.List
import java.util.Set

class Day23 {
	def static void main(String[] args) {
		val spheres = new InputLoader(2018, 23).inputs.map[new Sphere(it)]

		val max_radius = spheres.maxBy[radius]
		println(spheres.filter[it.distanceBetweenCenters(max_radius) <= max_radius.radius].size)

		val intersections = newHashSet

		for (i : 0 ..< spheres.size) {
			val sphere_i = spheres.get(i)
			for (j : i + 1 ..< spheres.size) {
				val sphere_j = spheres.get(j)
				if (sphere_i.intersectsWith(sphere_j))
					intersections.add(sphere_i -> sphere_j)
			}
		}

		val List<Equivalence> equivalence_classes = intersections.fold(newArrayList) [ acc, intersection |
			if (!acc.exists[Equivalence eq|eq.add(intersection)])
				acc.add(new Equivalence(intersection))
			acc
		]
		
		val right_class = equivalence_classes.maxBy[elements.size]
		println(right_class.elements.minBy[radius].radius)
		println(right_class.approx)
		
		println(equivalence_classes.map[elements.size])
	}

	static class Sphere {
		Triplet center
		int radius

		new(String s) {
			val split = s.split("pos=<|>, r=")
			center = new Triplet(split.get(1))
			radius = Integer.parseInt(split.get(2))
		}

		def distanceBetweenCenters(Sphere other) {
			center.manhattanDistanceTo(other.center)
		}

		def intersectsWith(Sphere other) {
			distanceBetweenCenters(other) <= radius + other.radius
		}

		override hashCode() {
			center.hashCode * radius.hashCode
		}

		override equals(Object other) {
			switch other {
				Sphere: other.center.equals(center) && other.radius == radius
				default: false
			}
		}
	}

	static class Equivalence {
		Set<Sphere> elements

		new(Pair<Sphere, Sphere> pair) {
			elements = newHashSet(pair.key, pair.value)
		}

		def add(Sphere sphere) {
			elements.contains(sphere) || {
				val belongs = elements.forall[sphere.intersectsWith(it)]
				if(belongs) elements.add(sphere)
				belongs
			}
		}

		def add(Pair<Sphere, Sphere> pair) {
			add(pair.key) && add(pair.value)
		}
		
		def approx() {
			val itv_x = elements.map[new Interval(center.x - radius, center.x + radius)].reduce[it1, it2 | it1.intersection(it2)]
			val itv_y = elements.map[new Interval(center.y - radius, center.y + radius)].reduce[it1, it2 | it1.intersection(it2)]
			val itv_z = elements.map[new Interval(center.z - radius, center.z + radius)].reduce[it1, it2 | it1.intersection(it2)]
			#[itv_x, itv_y, itv_z]
		}
	}
}
