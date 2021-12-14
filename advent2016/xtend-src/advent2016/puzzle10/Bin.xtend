package advent2016.puzzle10

import java.util.Set

class Bin {
	
	protected int number
	protected Set<Integer> chips
	
	new(int number_) {
		number = number_
		chips = newHashSet
	}
		
	def addChips(int chip_) {
		chips.add(chip_)
	}
	
	def firstChip() {
		chips.toList.get(0)
	}
	
	def contains(int chip_) {
		chips.contains(chip_)
	}
}