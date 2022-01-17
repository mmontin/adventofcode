package advent2016.puzzle10

import adventutils.input.InputLoader
import java.util.HashMap

class Launcher {

	static HashMap<Integer, Bot> bots = newHashMap
	static HashMap<Integer, Bin> bins = newHashMap
	
	def static void main(String[] args) {

		new InputLoader(2016,10).getInputs.forEach [
			val split = it.split(" ")
			if (split.get(0).equals("value"))
				find_bot(split.get(5),"bot").addChips(Integer::parseInt(split.get(1)))
			else
				(find_bot(split.get(1),"bot") as Bot).putLowHigh(
						find_bot(split.get(6),split.get(5)),
						find_bot(split.get(11),split.get(10))
				)
		]

		var Bot current
		while((current = bots.values.findFirst[isFull]) !== null)
			current.giveAll
			
		println(bins.get(0).firstChip * bins.get(1).firstChip * bins.get(2).firstChip)
	}

	def static Bin find_bot(String s, String type) {
		val number = Integer::parseInt(s)
		if (type.equals("bot")) {
			if (!bots.containsKey(number))
				bots.put(number, new Bot(number))
			bots.get(number)
		} else {
			if (!bins.containsKey(number))
				bins.put(number, new Bin(number))
			bins.get(number)
		}
	}
}
