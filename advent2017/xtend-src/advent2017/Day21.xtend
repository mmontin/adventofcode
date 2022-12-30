package advent2017

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader
import java.util.HashSet
import java.util.Map
import java.util.Set

class Day21 {

	static final Map<StringTile, SetTile> mappings = newHashMap
	static final SetTile starting_tile = new SetTile(".#./..#/###")

	def static void main(String[] args) {
		new InputLoader(2017, 21).inputs.forEach [
			val split = it.split(" => ")
			mappings.put(new StringTile(split.get(0)), new SetTile(split.get(1)))
		]

		var current = starting_tile
		for (i : 0 .. 4) {
			val output = newHashSet
			val splitted = current.split
			val next_size = splitted.values.head.size + 1
			splitted.forEach [ k, v |
				var next_tile = mappings.get(mappings.keySet.findFirst[it.contains(v)])
				output.addAll(next_tile.content.map [
					new Coordinate(it.x + next_size * k.x, it.y + next_size * k.y)
				])
			]
			current = new SetTile(output, next_size * Math.sqrt(splitted.size) as int)
		}
		println(current.content.size)
		
		for (i : 0 .. 12) {
			println(i)
			val output = newHashSet
			val splitted = current.split
			val next_size = splitted.values.head.size + 1
			splitted.forEach [ k, v |
				var next_tile = mappings.get(mappings.keySet.findFirst[it.contains(v)])
				output.addAll(next_tile.content.map [
					new Coordinate(it.x + next_size * k.x, it.y + next_size * k.y)
				])
			]
			current = new SetTile(output, next_size * Math.sqrt(splitted.size) as int)
		}
		println(current.content.size)
	}

	static class SetTile {

		final Set<Coordinate> content
		final int size

		new(String s) {
			content = newHashSet
			val split = s.split("/").map[toCharArray.map[toString]]
			size = split.size
			for (i : 0 .. size - 1) {
				for (j : 0 .. size - 1) {
					if (split.get(i).get(j).equals("#"))
						content.add(new Coordinate(i, j))
				}
			}
		}

		new(Set<Coordinate> _content, int _size) {
			content = _content
			size = _size
		}

		def split() {
			val output = newHashMap
			if (size % 2 == 0 && size > 2) {
				val nb = size / 2
				for (i : 0 .. nb - 1) {
					for (j : 0 .. nb - 1) {
						output.put(new Coordinate(i, j), new SetTile(content.filter [
							(it.x == 2 * i || it.x == 2 * i + 1) && (it.y == 2 * j || it.y == 2 * j + 1)
						].map[new Coordinate(it.x - 2 * i, it.y - 2 * j)].toSet, 2))
					}
				}
			} else if (size % 3 == 0 && size > 3) {
				val nb = size / 3
				for (i : 0 .. nb - 1) {
					for (j : 0 .. nb - 1) {
						output.put(new Coordinate(i, j), new SetTile(content.filter [
							it.x >= 3 * i && it.x <= 3 * i + 2 && it.y >= 3 * j && it.y <= 3 * j + 2
						].map[new Coordinate(it.x - 3 * i, it.y - 3 * j)].toSet, 3))
					}
				}
			} else
				output.put(new Coordinate(0, 0), new SetTile(content.map[new Coordinate(it)].toSet, size))
			output
		}

		override toString() {
			var output = "Size " + size + "\n"
			for (i : 0 .. size - 1) {
				for (j : 0 .. size - 1) {
					output += content.contains(new Coordinate(i, j)) ? "#" : "."
				}
				output = output + "\n"
			}
			output
		}
	}

	static class StringTile {

		HashSet<Coordinate> original
		Set<HashSet<Coordinate>> content
		int size

		new(String s) {
			content = newHashSet;
			val content_list = newArrayList
			original = newHashSet;
			content_list.add(original)
			(0 .. 6).forEach[content_list.add(newHashSet)]

			val split = s.split("/").map[toCharArray.map[toString]]
			size = split.size
			for (i : 0 .. size - 1) {
				for (j : 0 .. size - 1) {
					if (split.get(i).get(j).equals("#"))
						content_list.get(0).add(new Coordinate(i, j))
					if (split.get(i).get(size - 1 - j).equals("#"))
						content_list.get(1).add(new Coordinate(i, j))
					if (split.get(size - 1 - i).get(size - 1 - j).equals("#"))
						content_list.get(2).add(new Coordinate(i, j))
					if (split.get(size - 1 - i).get(j).equals("#"))
						content_list.get(3).add(new Coordinate(i, j))
					if (split.get(j).get(i).equals("#"))
						content_list.get(4).add(new Coordinate(i, j))
					if (split.get(size - 1 - j).get(i).equals("#"))
						content_list.get(5).add(new Coordinate(i, j))
					if (split.get(size - 1 - j).get(size - 1 - i).equals("#"))
						content_list.get(6).add(new Coordinate(i, j))
					if (split.get(j).get(size - 1 - i).equals("#"))
						content_list.get(7).add(new Coordinate(i, j))
				}
			}

			content.addAll(content_list)
		}

		def getOriginal() {
			original
		}

		override hashCode() {
			content.hashCode
		}

		def contains(SetTile other) {
			other.size == size && content.contains(other.content)
		}

		override equals(Object other) {
			switch other {
				StringTile: other.content.equals(content) && other.size == size
				default: false
			}
		}
		
		override toString() {
			new SetTile(original,size).toString
		}
	}
}
