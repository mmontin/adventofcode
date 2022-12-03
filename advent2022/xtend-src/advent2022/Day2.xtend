package advent2022

import adventutils.input.InputLoader

class Day2 {
	
	def static void main(String[] args) {
		print(new InputLoader(2022,2).inputs.fold(0->0)[acc , el|
			val s = el.split(" ")
			val me = toRPC(s.get(1))
			val you = toRPC(s.get(0))
			acc.key + score(you,me) -> acc.value + scare(you,s.get(1))
		])
	}

	static enum RPC {
		ROCK, PAPER, SCISSOR 
	}
	
	def static toRPC(String s) {
		switch s {
			case "A", case "X" : RPC.ROCK
			case "B", case "Y" : RPC.PAPER
			case "C", case "Z" : RPC.SCISSOR
		}
	}
	
	def static value(RPC input) {
		switch input {
			case RPC.ROCK : 1
			case RPC.PAPER : 2
			case RPC.SCISSOR : 3
		}
	}
	
	def static score(RPC you, RPC me) {
		switch (me -> you) {
			case RPC.ROCK -> RPC.SCISSOR : 6
			case RPC.PAPER -> RPC.ROCK : 6
			case RPC.SCISSOR -> RPC.PAPER : 6
			case me == you : 3
			default : 0  
		} + value(me)
	}
	
	def static scare(RPC you, String me) {
		switch me {
			case "Y" : 3 + value (you)
			case "X" : value(switch you {
				case RPC.ROCK : RPC.SCISSOR
				case RPC.SCISSOR : RPC.PAPER
				case RPC.PAPER : RPC.ROCK
			})
			case "Z" : 6 + value(switch you {
				case RPC.ROCK : RPC.PAPER
				case RPC.SCISSOR : RPC.ROCK
				case RPC.PAPER : RPC.SCISSOR			
			})
		}
	}
}