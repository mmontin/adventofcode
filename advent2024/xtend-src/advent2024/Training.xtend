package advent2024

import adventutils.collection.ListUtils
import java.util.List

class Training {

	def static void main(String[] args) {
		val input = newArrayList("he", "llo", " wor", "ld!")

		// Concaténer (en utilisant + et une boucle for) input et imprimer (println) le résultat. 
		var sentence = ''

		for (i : 0 .. input.size - 1) {
			sentence = sentence + input.get(i)
		}

		println(sentence)

		sentence = ''

		for (syllabe : input)
			sentence += syllabe

		println(sentence)

		println(input.fold('')[acc, el|acc + el])

		println(input.reduce[acc, el|acc + el])

		println(input.join)

		// Calculer en utilisant fold la somme des tailles des elements de input
		println(
			input.fold(0) [ acc, el |
				(acc + el.length)
			]
		)

		println(input.join.length)

		println(input.rev)

		println(input.rev2)

		println(input.rev.rev2.join)
	}

	def static List<String> rev(List<String> input) {
		val output = newArrayList

		for (i : input.size - 1 .. 0) {
			output.add(input.get(i))
		}

		output
	}

	def static List<String> rev2(List<String> input) {
		(input.size - 1 .. 0).fold(newArrayList) [ acc, el |
			ListUtils.cons(input.get(el), acc)
		// acc.add(input.get(el))
		// acc
		]
	}
}
