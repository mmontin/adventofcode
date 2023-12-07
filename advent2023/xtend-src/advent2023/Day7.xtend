package advent2023

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List

class Day7 {
	def static void main(String[] args) {
		val sorted = new ArrayList(new InputLoader(2023, 7).inputs.map [
			val split = it.split(" ")
			val hand = split.get(0).toCharArray.map[it + ""].toList
			val bet = Integer.parseInt(split.get(1))
			val spread = hand.spread(false);
			(spread -> hand) -> bet
		]).sortInplace[x, y|comparePair(x.key, y.key, false)]

		println((1 .. sorted.size).fold(0L) [ res, i |
			res + (i as long) * (sorted.get(i - 1).value as long)
		])

		val sorted2 = new ArrayList(new InputLoader(2023, 7).inputs.map [
			val split = it.split(" ")
			val hand = split.get(0).toCharArray.map[it + ""].toList
			val bet = Integer.parseInt(split.get(1))
			val spread = hand.spread(true);
			(spread -> hand) -> bet
		]).sortInplace[x, y|comparePair(x.key, y.key, true)]

		println((1 .. sorted2.size).fold(0L) [ res, i |
			res + (i as long) * (sorted2.get(i - 1).value as long)
		])
	}

	def static int toInt(HAND hand) {
		switch hand {
			case HIGH: 0
			case ONE: 1
			case TWO: 2
			case THREE: 3
			case FULL: 4
			case FOUR: 5
			case FIVE: 6
		}
	}

	def static int toInt(String s, boolean joker) {
		switch s {
			case "2": 0
			case "3": 1
			case "4": 2
			case "5": 3
			case "6": 4
			case "7": 5
			case "8": 6
			case "9": 7
			case "T": 8
			case "J": (joker ? -1 : 9)
			case "Q": 10
			case "K": 11
			default: 12
		}
	}

	def static int compare(HAND left, HAND right) {
		left.toInt.compareTo(right.toInt)
	}

	def static int compare(List<String> left, List<String> right, boolean joker) {
		val leftInts = left.map[toInt(joker)]
		val rightInts = right.map[toInt(joker)]
		var i = 0
		var output = 0
		while (output == 0) {
			output = leftInts.get(i).compareTo(rightInts.get(i))
			i++
		}
		output
	}

	def static int comparePair(Pair<HAND, List<String>> left, Pair<HAND, List<String>> right, boolean joker) {
		var res = left.key.compare(right.key)
		if (res == 0)
			res = left.value.compare(right.value, joker)
		res
	}

	def static HAND spread(List<String> l, boolean joker) {
		val groups = l.groupBy[it]
		if (joker) {
			val entry = groups.remove("J")
			if (groups.size > 0) {
				if (entry !== null) {
					val maxEntry = groups.entrySet.max [ x, y |
						var cmp = x.value.size.compareTo(y.value.size)
						if (cmp == 0)
							cmp = x.key.toInt(false).compareTo(y.key.toInt(false))
						cmp
					]
					maxEntry.value.addAll(entry)
				}
			} else
				groups.put("J", entry)
		}
		val vals = groups.values
		switch (vals.size) {
			case 1:
				HAND.FIVE
			case 2: {
				if (vals.get(0).size == 4 || vals.get(1).size == 4)
					HAND.FOUR
				else
					HAND.FULL
			}
			case 3: {
				if (vals.get(0).size == 3 || vals.get(1).size == 3 || vals.get(2).size == 3)
					HAND.THREE
				else
					HAND.TWO
			}
			case 4:
				HAND.ONE
			case 5:
				HAND.HIGH
		}
	}
}

enum HAND {
	FIVE,
	FOUR,
	FULL,
	THREE,
	TWO,
	ONE,
	HIGH
}
