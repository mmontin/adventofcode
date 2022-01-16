package advent2021.puzzle7

import adventutils.input.InputLoader

class Launcher {
	
	def static void main(String[] args) {
		
		val input = new InputLoader(2021,7).getInputs.get(0).split(",").map[x | Integer::parseInt(x)].sort

		println((input.get(0)..input.get(input.size-1)).fold(Integer::MAX_VALUE)[ min , k | 
			Math.min(min , input.fold(0)[v , e | v + Math.abs(e - k)])])
			
		println((input.get(0)..input.get(input.size-1)).fold(Integer::MAX_VALUE)[ min , k | 
			Math.min(min , input.fold(0)[v , e | var n = Math.abs(e - k) v + ((n * (n + 1)) / 2)])])
	}
}