package advent2022

import adventutils.input.InputLoader

class Day25 {

	def static void main(String[] args) {

		val sum = Long.toString(new InputLoader(2022, 25).inputs.map[toCharArray].fold(0L) [ acc, v |
			val strings = v.map[it.toString]
			acc + (0 ..< strings.size).fold(0L) [ acc1, i |
				val current = strings.get(strings.size - i - 1)
				acc1 + (switch current {
					case "=": -2
					case "-": -1
					default: Long.parseLong(current)
				}) * (Math.pow(5, i) as long)
			]
		],5).toCharArray.map[Integer.parseInt(it.toString)]
		
		val output = (0..<sum.size).fold(""->0)[acc,v|
			val current = sum.get(sum.size - 1 - v)
			switch (x : current + acc.value) {
				case 3 : "=" + acc.key -> 1
				case 4 : "-" + acc.key -> 1
				case 5 : "0" + acc.key -> 1
				default : x + acc.key -> 0 
			}
		]
		
		println(switch (output.value){
			case 1 : "1" + output.key
			default : output.key
		})
	}
}
