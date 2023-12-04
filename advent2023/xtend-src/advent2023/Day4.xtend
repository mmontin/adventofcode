package advent2023

import adventutils.input.InputLoader

class Day4 {
	def static void main(String[] args) {

		val numberOfWins = newArrayList
		val numberOfCards = newHashMap

		new InputLoader(2023, 4).inputs.forEach [ el |
			val split1 = el.split(" \\| ")
			val left = split1.get(0).split(": ")
			val winningNumbers = left.get(1).split(" ").toList.filter[!it.isBlank].map[Integer.parseInt(it)]
			val allNumbers = split1.get(1).split(" ").toList.filter[!it.isBlank].map[Integer.parseInt(it)]
			val currentWins = allNumbers.filter[x|winningNumbers.contains(x)].size
			numberOfWins.add(currentWins)
			val currentCard = numberOfWins.size
			val currentNumberOfCards = numberOfCards.merge(currentCard, 1)[x, y|x + y]
			if (currentWins > 0) 
				(currentCard + 1 .. currentCard + currentWins).forEach [
					numberOfCards.merge(it, currentNumberOfCards)[x, y|x + y]
				]
		]

		println(numberOfWins.fold(0)[acc, el|el == 0 ? acc : acc + Math.pow(2, el - 1) as int])
		println(numberOfCards.values.reduce[x, y|x + y])
	}
}
