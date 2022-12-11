package advent2022

import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.List
import java.util.Optional
import java.util.HashMap
import java.util.HashSet

class Day11 {

	final static List<String> inputs = new InputLoader(2022, 11).inputs
	final static List<Monkey> monkeys = {
		val output = newArrayList;
		(0 .. 7).forEach [
			output.add(new Monkey(inputs.subList(it * 7 + 1, it * 7 + 6)))
		]
		output
	}
	final static ArrayList<ArrayList<HashMap<Integer, Long>>> congruences = {
		val output = newArrayList;
		(0 .. 7).forEach [ i |
			val newOne = newArrayList;
			output.add(newOne)
			val currentMonkey = monkeys.get(i)
			currentMonkey.items.forEach [ item |
				val newCongruences = newHashMap;
				newOne.add(newCongruences)
				monkeys.map[divisibility].forEach [ div |
					newCongruences.put(div, item % div)
				]
			]
		]
		println(output)
		output
	}

	def static void main(String[] args) {

		(0 ..< 20).forEach[monkeys.forEach[play]]
		var sorted = monkeys.sortBy[-inspected]
		println(sorted.get(0).inspected * sorted.get(1).inspected)

		monkeys.forEach[inspected = 0]
		(0 ..< 10000).forEach[monkeys.forEach[playSmart]]
		sorted = monkeys.sortBy[-inspected]
		println(sorted.get(0).inspected * sorted.get(1).inspected)
	}

	static class Monkey {

		List<Long> items
		boolean isMultiply
		Optional<Long> adjustment
		int divisibility
		int ifTrue
		int ifFalse

		long inspected

		new(List<String> strings) {

			items = new ArrayList(strings.get(0).split(": ").get(1).split(", ").map[Long.parseLong(it)])
			val split2 = strings.get(1).split(": ").get(1).split(" ")
			isMultiply = split2.get(3).equals("*")
			adjustment = try {
				Optional.of(Long.parseLong(split2.get(4)))
			} catch (NumberFormatException nfe) {
				Optional.empty
			}
			divisibility = Integer.parseInt(strings.get(2).split(": ").get(1).split(" ").get(2))
			ifTrue = Integer.parseInt(strings.get(3).split(": ").get(1).split(" ").get(3))
			ifFalse = Integer.parseInt(strings.get(4).split(": ").get(1).split(" ").get(3))
			inspected = 0
		}

		def play() {
			(0 ..< items.size).forEach [
				inspected++
				var long current_item = items.remove(0)
				val long toTamperWith = adjustment.present ? adjustment.get : current_item
				isMultiply ? current_item *= toTamperWith : current_item += toTamperWith
				current_item /= 3
				monkeys.get(current_item % divisibility == 0 ? ifTrue : ifFalse).items.add(current_item)
			]
		}

		def playSmart() {
			val myItems = congruences.get(monkeys.indexOf(this))
			(0 ..< myItems.size).forEach [
				inspected++
				val current_item = myItems.remove(0)
				new HashSet(current_item.entrySet).forEach [ entry |
					var toTamperWith = adjustment.present ? adjustment.get : entry.value
					var newValue = (isMultiply ? (entry.value * toTamperWith) : (entry.value + toTamperWith)) %
						entry.key
					current_item.put(entry.key, newValue)
				]
				congruences.get(current_item.get(divisibility) == 0 ? ifTrue : ifFalse).add(current_item)
			]
		}

		override String toString() {
			"Items " + items + "(" + inspected + ")\n"
		}
	}
}
