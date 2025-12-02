package advent2018

import adventutils.geometry.Triplet
import adventutils.input.InputLoader

class Day23 {
	def static void main(String[] args) {
		val spheres = new InputLoader(2018, 23).inputs.map[new Sphere(it)]

		val max_radius = spheres.maxBy[radius]
		println(spheres.filter[it.distanceBetweenCenters(max_radius) <= max_radius.radius].size) 
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
		
		def inRange(Triplet t) {
			t.manhattanDistanceTo(center) <= radius
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

		override toString() {
			center + "[" + radius + "]"
		}
	}
}
