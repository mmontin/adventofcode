package advent2023

import adventutils.input.InputLoader
import java.util.Set
import adventutils.string.StringUtils

class Day1 {

	static final Set<Pair<String, String>> numbers = newHashSet(
		"1" -> "one",
		"2" -> "two",
		"3" -> "three",
		"4" -> "four",
		"5" -> "five",
		"6" -> "six",
		"7" -> "seven",
		"8" -> "eight",
		"9" -> "nine"
	)

	static final Set<Pair<String, String>> srebmun = numbers.map[x|x.key -> StringUtils.reverse(x.value)].
		toSet

	def static void main(String[] args) {
		println(new InputLoader(2023, 1).inputs.fold(0->0)[e,v|
			val revV = StringUtils.reverse(v)
			val left = e.key + Integer.parseInt(findFirst(v,false,numbers) + findFirst(revV,false,srebmun))
			val right = e.value + Integer.parseInt(findFirst(v,true,numbers) + findFirst(revV,true,srebmun))
			left -> right
		])
	}

	def static findFirst(String s, boolean withLetters, Set<Pair<String, String>> candidates) {
		var i = 0
		var String res = null
		while (res === null) {
			val currentString = s.substring(i)
			val element = candidates.findFirst [ x |
				currentString.startsWith(x.key) || (withLetters && currentString.startsWith(x.value))
			]
			if (element !== null) res = element.key
			i++
		}
		res
	}
}
