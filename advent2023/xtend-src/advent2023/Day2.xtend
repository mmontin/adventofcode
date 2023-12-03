package advent2023

import adventutils.input.InputLoader
import java.util.List

class Day2 {

	static final int maxRed = 12
	static final int maxGreen = 13
	static final int maxBlue = 14

	def static void main(String[] args) {
		println(new InputLoader(2023, 2).inputs.fold(0->0) [ v, e |
			val split1 = e.split(": ")
			val id = Integer.parseInt(split1.get(0).split("Game ").get(1))
			val split2 = split1.get(1).split("; ")
			val finalSplit = split2.map[x|x.split(", ")]
			val left = v.key + (finalSplit.fold(true)[res,game |
				res && gamePossible(game)
			] ? id : 0) 
			val joined = finalSplit.fold(newArrayList)[l, el | l.addAll(el) ; l]
			val right = v.value + gamePower(joined)
			left -> right
		])
	}
	
	def static gamePower(List<String> inputs) {
		var minBlue = 0
		var minRed = 0
		var minGreen = 0
		for (data : inputs) {
			val lastSplit = data.split(" ")
			val quantity = Integer.parseInt(lastSplit.get(0))
			switch (lastSplit.get(1)) {
				case "blue": if (quantity > minBlue) minBlue = quantity
				case "red": if (quantity > minRed) minRed = quantity
				case "green": if (quantity > minGreen) minGreen = quantity
			}
		}
		minBlue * minRed * minGreen
	}

	def static gamePossible(List<String> inputs) {
		var blue = 0
		var red = 0
		var green = 0
		for (data : inputs) {
			val lastSplit = data.split(" ")
			val quantity = Integer.parseInt(lastSplit.get(0))
			switch (lastSplit.get(1)) {
				case "blue": blue += quantity
				case "red": red += quantity
				case "green": green += quantity
			}
		}
		blue <= maxBlue && red <= maxRed && green <= maxGreen
	}
}
