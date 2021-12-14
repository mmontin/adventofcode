package advent2016.puzzle10

class Bot extends Bin {
	
	Bin low
	Bin high
	
	new(int number_) {
		super(number_)
	}

	def putLowHigh(Bin low_, Bin high_) {
		this.low = low_
		this.high = high_
	}
	
	def isFull() {
		chips.size >= 2
	}
	
	def giveAll() {
		val lowest = chips.min
		val highest = chips.max
		if (lowest == 17 && highest == 61)
			println(number)
		low.addChips(lowest)
		high.addChips(highest)
		chips.clear
	}
	
	override equals(Object o) {
		number == (o as Bot).number
	}
	
	override hashCode() {
		number
	}
}