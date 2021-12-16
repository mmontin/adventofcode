package advent2021.puzzle16

import advent2021.Utils

class Launcher {

	public static final String input = Utils.getInputReader(16).readLine.toCharArray.fold('') [ s, c |
		s + String.format("%4s",Integer::toBinaryString(Integer::parseInt(c + '',16))).replace(" ","0")
	]
	
	static int i = 0
	static int sum = 0

	def static void main(String[] args) {
		println('PART 2: ' + decodePacket)
		println('PART 1: ' + sum)
	}
	
	def static Long decodePacket() {
		sum += Integer::parseInt(input.substring(i,i=i+3),2)
		val type_id = Integer::parseInt(input.substring(i,i=i+3),2)
		if (type_id == 4) {
			var number = ""
			while (input.substring(i,i=i+1).equals('1')) number += input.substring(i,i=i+4)
			Long::parseLong(number + input.substring(i,i=i+4),2)
		} else {
			val values = newArrayList
			if (input.substring(i,i=i+1).equals('0')) {
				var total_length = Integer::parseInt(input.substring(i,i=i+15),2)
				var final_index = i + total_length
				while (i != final_index) values.add(decodePacket)
			} else
				(0..<Integer::parseInt(input.substring(i,i=i+11),2)).forEach[values.add(decodePacket)]
			switch (type_id) {
				case 0 : values.reduce[x , y | x + y]
				case 1 : values.reduce[x , y | x * y]
				case 2 : values.min
				case 3 : values.max
				case 5 : values.get(0) > values.get(1) ? 1L : 0L
				case 6 : values.get(0) < values.get(1) ? 1L : 0L
				default : values.get(0) == values.get(1) ? 1L : 0L
			}
		}
	}
}
