package advent2022

import adventutils.input.InputLoader
import utils.Interval

class Day4 {
	def static void main(String[] args) {
		val inputs = new InputLoader(2022,4).getInputs
		
		print(inputs.fold(0->0)[acc, e|
			val s = e.split(",")
			val i1 = new Interval(s.get(0))
			val i2 = new Interval(s.get(1))
			if (i1.includedIn(i2) || i2.includedIn(i1)) acc.key+1->acc.value+1
			else if (i1.overlapsWith(i2)) acc.key->acc.value+1 
			else acc
		])
	}
}