package advent2023

import adventutils.collection.BiMap
import adventutils.geometry.Coordinate
import adventutils.geometry.Rectangle
import adventutils.input.InputLoader
import java.util.List
import java.util.Map
import java.util.Set

class Day22 {
	def static void main(String[] args) {

		val counter = new Counter
		val bricks = new InputLoader(2023, 22).inputs.map[new Brick(counter.next + "", it)].sortBy[it.minZ]
		val scene = new Scene(bricks)
		println(scene.numberOfBreakableBricks)
		println(scene.totalNumberOfReactions)
	}

	static class Counter {
		int nb

		new() {
			nb = 0
		}

		def next() {
			nb++
			(nb + 64) as char
		}
	}

	static class Scene {

		Map<Coordinate, Pair<Integer, Brick>> max_ys
		BiMap<Brick, Brick> adjacency
		Set<Brick> all_bricks

		new(List<Brick> all_bricks_) {
			max_ys = newHashMap
			adjacency = new BiMap
			all_bricks = all_bricks_.toSet
			all_bricks_.forEach[add]
		}

		private def add(Brick b) {
			val xyFace = b.XYFace.allCoordinates
			val req = xyFace.map[max_ys.getOrDefault(it, 0 -> null)].groupBy[key].entrySet.maxBy[key]
			val height = req.key
			b.descend(height + 1)
			val newz = b.maxZ
			xyFace.forEach[max_ys.put(it, newz -> b)]
			if (height != 0)
				req.value.forEach[adjacency.put(it.value, b)]
		}

		def numberOfBreakableBricks() {
			all_bricks.filter [ brick |
				adjacency.left_right.getOrDefault(brick, newHashSet).forall[adjacency.right_left.get(it).size >= 2]
			].size
		}

		def totalNumberOfReactions() {
			all_bricks.fold(0)[acc,el|
				acc + chainReaction(el)
			]
		}

		private def chainReaction(Brick initial) {
			val other_adjacency = new BiMap(adjacency)
			var Set<Brick> toRemove = newHashSet(initial)
			var nb = -1
			do {
				nb += toRemove.size
				toRemove = toRemove.fold(newHashSet) [acc,el|
					acc.addAll(other_adjacency.rm(el))
					acc
				]
				toRemove = toRemove.filter[
					other_adjacency.right_left.get(it).empty
				].toSet
			} while (!toRemove.empty)		
			nb
		}
	}

	static class Brick {

		String name

		IntegerRange x
		IntegerRange y
		IntegerRange z

		new(String name_, String s) {

			name = name_

			val split = s.split("~")
			val left = split.get(0).split(",").map[Integer.parseInt(it)]
			val right = split.get(1).split(",").map[Integer.parseInt(it)]

			x = left.get(0) .. right.get(0)
			y = left.get(1) .. right.get(1)
			z = left.get(2) .. right.get(2)
		}

		def minZ() {
			z.start
		}

		def maxZ() {
			z.end
		}

		def descend(int tz) {
			z = tz .. (tz + z.end - z.start)
		}

		def XYFace() {
			new Rectangle(x.start, x.end, y.start, y.end)
		}

		override hashCode() {
			name.hashCode
		}

		override equals(Object other) {
			switch other {
				Brick: name.equals(other.name)
				default: false
			}
		}

		override toString() {
			name + " ; " + new Coordinate(x.start, x.end) + " ; " + new Coordinate(y.start, y.end) + " ; " +
				new Coordinate(z.start, z.end)
		}
	}
}
