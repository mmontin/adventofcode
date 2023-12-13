package advent2023

import adventutils.geometry.CoordinateSet
import adventutils.input.InputLoader

class Day13 {
	def static void main(String[] args) {
		val br = new InputLoader(2023, 13).inputReader
		val tiles = newArrayList
		val current_tile = newArrayList
		while (br.ready) {
			val current_line = br.readLine()
			if (current_line.empty || !br.ready) {
				tiles.add(new CoordinateSet(current_tile))
				current_tile.clear
			} else
				current_tile.add(current_line)
		}
		println(tiles.fold(0->0)[acc, el|
			acc.key + process(el) -> acc.value + process2(el)
		])
	}

	def static processSym(CoordinateSet tile, boolean isLine, int i) {

		val min = isLine ? tile.minX : tile.minY
		val max = isLine ? tile.maxX : tile.maxY

		if (i - 1 < min || i > max)
			false
		else {
			var n = 1
			var ans = true
			while (i - n >= min && i + n - 1 <= max && ans) {
				val lines = (isLine
						? tile.line(i - n).map[y] -> tile.line(i + n - 1).map[y]
						: tile.column(i - n).map[x] -> tile.column(i + n - 1).map[x])
				ans = ans && lines.key.toSet.equals(lines.value.toSet)
				n++
			}
			ans
		}
	}
	
	def static processSym2(CoordinateSet tile, boolean isLine, int i) {

		val min = isLine ? tile.minX : tile.minY
		val max = isLine ? tile.maxX : tile.maxY

		if (i - 1 < min || i > max)
			false
		else {
			var n = 1
			var ans = true
			var smudged = false
			while (i - n >= min && i + n - 1 <= max && ans) {
				val lines = (isLine
						? tile.line(i - n).map[y].toSet -> tile.line(i + n - 1).map[y].toSet
						: tile.column(i - n).map[x].toSet -> tile.column(i + n - 1).map[x].toSet)
				if (lines.key.equals(lines.value))
					n++
				else if (Math.abs(lines.key.size - lines.value.size) != 1) 
					ans = false
				else if (smudged)
					ans = false
				else {
					val big_one = lines.key.size > lines.value.size ? lines.key : lines.value
					val small_one = big_one == lines.key ? lines.value : lines.key
					big_one.removeAll(small_one)
					if (big_one.size == 1) {
						smudged = true
						n ++
					}
					else
						ans = false
				}
			}
			ans && smudged
		}		
	}

	def static process(CoordinateSet tile) {
		val sym_line = (1 .. tile.maxX).findFirst[i|processSym(tile, true, i)]
		if (sym_line !== null)
			100 * sym_line
		else
			(1 .. tile.maxY).findFirst[j|processSym(tile, false, j)]
	}
	
	def static process2(CoordinateSet tile) {
		val sym_line = (1 .. tile.maxX).findFirst[i|processSym2(tile, true, i)]
		if (sym_line !== null)
			100 * sym_line
		else
			(1 .. tile.maxY).findFirst[j|processSym2(tile, false, j)]
	}
}
