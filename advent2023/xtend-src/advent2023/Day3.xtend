package advent2023

import adventutils.input.InputLoader
import java.util.List
import java.util.regex.Pattern

class Day3 {

	static final List<String> grid = new InputLoader(2023, 3).inputs
	static final int maxX = grid.size
	static final int maxY = grid.get(0).length
	static final Pattern number = Pattern.compile("\\d+")

	def static void main(String[] args) {

		// Adding some padding to symmetrize the process
		val emptyLine = ".".repeat(maxY)
		grid.add(emptyLine)
		grid.add(0, emptyLine)

		var sum = 0

		for (i : 1 .. maxX) {
			val matcher = number.matcher(grid.get(i))
			while (matcher.find()) {
				val matched = matcher.group
				val prev = matcher.start - 1
				val end = matcher.end
				if (hasSymbol(prev, end, grid.get(i - 1)) || 
					hasSymbol(prev, end, grid.get(i + 1)) ||
					isSymbol(prev, grid.get(i)) || 
					isSymbol(end, grid.get(i))) 
					sum += Integer.parseInt(matched)
				
			}
		}

		println(sum)
	}

	def static boolean hasSymbol(int i, int j, String s) {
		(i .. j).fold(false) [ acc, e |
			acc || isSymbol(e, s)
		]
	}

	def static boolean isSymbol(int i, String s) {
		switch i {
			case i < 0: false
			case i >= s.length: false
			default: isSymbol(s.charAt(i))
		}
	}

	def static boolean isSymbol(Character c) {
		val cAsInt = c as int
		switch cAsInt {
			case (cAsInt >= 49 && cAsInt <= 57): false
			case 46: false
			default: true
		}
	}
}
