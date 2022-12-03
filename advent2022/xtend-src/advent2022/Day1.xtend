package advent2022

import adventutils.input.InputLoader

class Day1 {
	
	def static void main(String[] args) {

		val input = new InputLoader(2022,1).inputs

		// This solves Q1 by browsing through the whole list and accumulating the calories elf by elf 
		// while keeping the largest in mind directly
		println(input.fold(0 -> 0)[acc, s|
			if (s.empty) 
				0 -> Math.max(acc.key, acc.value)
			else 
				acc.key + Integer.parseInt(s) -> acc.value
		].value)
		
		// The second one is a bit trickier because the three main elves need to be counted
		// The idea is to keep track of the sum for each elf
		println(input.fold(0 -> newArrayList)[acc, s|
			if (s.empty) {
				val nlist = acc.value
				nlist.add(acc.key)
				0 -> nlist
			} else
				acc.key + Integer.parseInt(s) -> acc.value
		].value.sort.reverse.subList(0,3).reduce[x,y| x + y])
	}
}