package advent2020.puzzle20

import adventutils.geometry.Coordinate
import adventutils.geometry.Direction
import adventutils.input.InputLoader
import java.util.HashSet
import java.util.List
import java.util.Set

class Day20 {

	static final int size = 10
	static Tile current_tile = null

	def static void main(String[] args) {
		val input = new InputLoader(2020, 20).inputs
		val nb_of_tiles = (input.size + 1) / 12
		val square_side = Math.sqrt(nb_of_tiles) as int
		val all_tiles = (0 ..< nb_of_tiles).fold(newArrayList) [ acc, i |
			val number = Integer.parseInt(input.get(i * 12).split(" ").get(1).split(":").get(0))
			val current = input.subList(i * 12 + 1, i * 12 + 11).map[toCharArray.map[toString]]
			acc.addAll(Tile.allVariants(number, current))
			acc
		]

		// Let's start by finding the upper left corner.
		val upper_left = all_tiles.findFirst [
			val rb = it.getBorder(Direction.RIGHT)
			val db = it.getBorder(Direction.DOWN)
			val ub = it.getBorder(Direction.UP)
			val lb = it.getBorder(Direction.LEFT)
			val name = it.number
			val dup = new HashSet(all_tiles)
			val rmatch = dup.findFirst[it.matchesSomewhereWithOtherName(rb, name)]
			val dmatch = dup.findFirst[it.matchesSomewhereWithOtherName(db, name)]
			val umatch = dup.findFirst[it.matchesSomewhereWithOtherName(ub, name)]
			val lmatch = dup.findFirst[it.matchesSomewhereWithOtherName(lb, name)]
			rmatch !== null && dmatch !== null && umatch === null && lmatch === null
		]

		// Let's create a map of tiles, which will in turn be the final image
		val image = newHashMap(new Coordinate(0, 0) -> upper_left)

		// Let's remove the tile from the remaining tiles
		all_tiles.removeIf[it.number == upper_left.number]

		// Let's iterate the process for the first row
		current_tile = upper_left
		for (j : 1 .. square_side - 1) {
			current_tile = all_tiles.findFirst [
				it.matchesThereButWithOtherName(current_tile.getBorder(Direction.RIGHT), Direction.LEFT,
					current_tile.number)
			]
			image.put(new Coordinate(0, j), current_tile)
			all_tiles.removeIf[it.number == current_tile.number]
		}

		// Let's iterate the process for the remaining rows
		for (i : 1 .. square_side - 1) {
			current_tile = image.get(new Coordinate(i - 1, 0))
			current_tile = all_tiles.findFirst [
				it.matchesThereButWithOtherName(current_tile.getBorder(Direction.DOWN), Direction.UP,
					current_tile.number)
			]
			image.put(new Coordinate(i, 0), current_tile)
			all_tiles.removeIf[it.number == current_tile.number]
			for (j : 1 .. square_side - 1) {
				current_tile = all_tiles.findFirst [
					it.matchesThereButWithOtherName(current_tile.getBorder(Direction.RIGHT), Direction.LEFT,
						current_tile.number)
				]
				image.put(new Coordinate(i, j), current_tile)
				all_tiles.removeIf[it.number == current_tile.number]
			}
		}

		// This is the answer for Q1
		println(
			image.get(new Coordinate(0, 0)).number * image.get(new Coordinate(0, square_side - 1)).number *
				image.get(new Coordinate(square_side - 1, 0)).number *
				image.get(new Coordinate(square_side - 1, square_side - 1)).number
		)

		// Let's now trim the components of the image
		image.values.forEach[trim]

		// Let's now reindex all the coordinates into a fully fleshed image
		val final_image = image.entrySet.fold(newHashSet) [ acc, v |
			val toAddX = v.key.x * 8 - 1
			val toAddY = v.key.y * 8 - 1
			v.value.content.forEach[acc.add(it.addX(toAddX).addY(toAddY))]
			acc
		]

		// Let's manually define the sea monster
		val sea_monster = newHashSet(
			new Coordinate(0, 18),
			new Coordinate(1, 0),
			new Coordinate(1, 5),
			new Coordinate(1, 6),
			new Coordinate(1, 11),
			new Coordinate(1, 12),
			new Coordinate(1, 17),
			new Coordinate(1, 18),
			new Coordinate(1, 19),
			new Coordinate(2, 1),
			new Coordinate(2, 4),
			new Coordinate(2, 7),
			new Coordinate(2, 10),
			new Coordinate(2, 13),
			new Coordinate(2, 16)
		)

		val monster_width = 19
		val monster_depth = 3

		val full_size = 8 * 12

		// Once more we need to generate variants of the image ...
		val variants = Tile.allVariants(0L, final_image, full_size)

		// We find the variant that has sea monsters in it
		val oriented_image = variants.findFirst [ im |
			(0 .. full_size - monster_depth).findFirst [ i |
				(0 .. full_size - monster_width).findFirst [ j |
					im.content.containsAll(sea_monster.map[new Coordinate(it.x + i, it.y + j)].toSet)
				] !== null
			] !== null
		]

		// Now we need to collect all the coordinates belonging to sea monsters
		val sea_monsters_coordinate = newHashSet
		for (i : 0 .. full_size - monster_depth) {
			for (j : 0 .. full_size - monster_width) {
				val current_sea_monster = sea_monster.map[new Coordinate(it.x + i, it.y + j)].toSet
				if (oriented_image.content.containsAll(current_sea_monster))
					sea_monsters_coordinate.addAll(current_sea_monster)
			}
		}

		// Finally, to answer Q2, we print the number of elements that are not part of sea monsters
		println(oriented_image.content.size - sea_monsters_coordinate.size)
	}

	static class Tile {

		final public long number
		final public Set<Coordinate> content

		new(long _number, Set<Coordinate> _content) {
			number = _number
			content = _content
		}

		def getBorder(Direction d) {
			switch d {
				case UP:
					(0 .. size - 1).fold("")[acc, i|acc + (content.contains(new Coordinate(0, i)) ? "#" : ".")]
				case DOWN:
					(0 .. size - 1).fold("") [ acc, i |
						acc + (content.contains(new Coordinate(size - 1, i)) ? "#" : ".")
					]
				case LEFT:
					(0 .. size - 1).fold("")[acc, i|acc + (content.contains(new Coordinate(i, 0)) ? "#" : ".")]
				case RIGHT:
					(0 .. size - 1).fold("") [ acc, i |
						acc + (content.contains(new Coordinate(i, size - 1)) ? "#" : ".")
					]
			}
		}

		def matchesSomewhereWithOtherName(String border, long _number) {
			matchesThereButWithOtherName(border, Direction.UP, _number) ||
				matchesThereButWithOtherName(border, Direction.DOWN, _number) ||
				matchesThereButWithOtherName(border, Direction.LEFT, _number) ||
				matchesThereButWithOtherName(border, Direction.RIGHT, _number)
		}

		def matchesThereButWithOtherName(String border, Direction d, long _number) {
			number != _number && getBorder(d).equals(border)
		}

		def static allVariants(long _number, Set<Coordinate> input, int _size) {

			val list_content = newArrayList;
			(0 .. 7).forEach[list_content.add(newHashSet)]

			for (i : 0 .. _size - 1) {
				for (j : 0 .. _size - 1) {
					if (input.contains(new Coordinate(i, j)))
						list_content.get(0).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(i, _size - 1 - j)))
						list_content.get(1).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(_size - 1 - i, _size - 1 - j)))
						list_content.get(2).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(_size - 1 - i, j)))
						list_content.get(3).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(j, i)))
						list_content.get(4).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(_size - 1 - j, i)))
						list_content.get(5).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(_size - 1 - j, _size - 1 - i)))
						list_content.get(6).add(new Coordinate(i, j))
					if (input.contains(new Coordinate(j, _size - 1 - i)))
						list_content.get(7).add(new Coordinate(i, j))
				}
			}

			list_content.map[new Tile(_number, it)]
		}

		def static allVariants(long _number, List<List<String>> input) {

			val list_content = newArrayList;
			(0 .. 7).forEach[list_content.add(newHashSet)]

			for (i : 0 .. size - 1) {
				for (j : 0 .. size - 1) {
					if (input.get(i).get(j).equals("#"))
						list_content.get(0).add(new Coordinate(i, j))
					if (input.get(i).get(size - 1 - j).equals("#"))
						list_content.get(1).add(new Coordinate(i, j))
					if (input.get(size - 1 - i).get(size - 1 - j).equals("#"))
						list_content.get(2).add(new Coordinate(i, j))
					if (input.get(size - 1 - i).get(j).equals("#"))
						list_content.get(3).add(new Coordinate(i, j))
					if (input.get(j).get(i).equals("#"))
						list_content.get(4).add(new Coordinate(i, j))
					if (input.get(size - 1 - j).get(i).equals("#"))
						list_content.get(5).add(new Coordinate(i, j))
					if (input.get(size - 1 - j).get(size - 1 - i).equals("#"))
						list_content.get(6).add(new Coordinate(i, j))
					if (input.get(j).get(size - 1 - i).equals("#"))
						list_content.get(7).add(new Coordinate(i, j))
				}
			}

			list_content.map[new Tile(_number, it)]
		}

		def trim() {
			content.removeIf [
				it.x == 0 || it.y == 0 || it.x == size - 1 || it.y == size - 1
			]
		}

		override toString() {
			var output = "Size " + number + "\n"
			for (i : 0 .. number as int - 1) {
				for (j : 0 .. number as int - 1) {
					output += content.contains(new Coordinate(i, j)) ? "#" : "."
				}
				output = output + "\n"
			}
			output
		}
	}
}
