package advent2021.puzzle18

import java.io.BufferedReader

class Singleton extends SNumber {
	
	protected int value
	
	new (BufferedReader br, Pair parent_) {
		super(parent_)
		var String number = ''
		var String character = ''
		do {
			number += character
			br.mark(1)
			character = br.read as char + ''
		} while (!',]'.contains(character))
		br.reset
		value = Integer::parseInt(number)
	}
	
	new (int v, Pair parent_) {
		super(parent_)
		value = v
	}
	
	def split() {
		if (parent !== null) {
			val div2 = value / 2
			parent.update(this,new Pair(div2, (value % 2 == 0) ? div2 : div2 + 1,parent))
		}
	}
	
	override toString() {
		value + ''
	}
	
	override findFirstToSplit() {
		value >= 10 ? this : null 
	}
	
	override findFirstToExplode() {
		null
	}
	
	override updateValue(boolean right, int value_) {
		value += value_
	}
	
	override magnitude() {
		value
	}
}