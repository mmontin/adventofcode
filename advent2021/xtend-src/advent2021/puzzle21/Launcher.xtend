package advent2021.puzzle21

import java.math.BigInteger

class Launcher {
	
	static class Player {
		int square
		int score
		
		new(int square_) {
			square = square_ - 1
			score = 0
		}
		
		def play(int dice) {
			square = (square + dice) % 10
			score += (square + 1)
		}
		
		def getScore() {
			score
		}
	}
	
	static class Result {
		
		BigInteger nb1
		BigInteger nb2
		
		new(boolean p1) {
			nb1 = p1 ? BigInteger.ONE : BigInteger.ZERO
			nb2 = p1 ? BigInteger.ZERO : BigInteger.ONE
		}
		
		def add(Result r, int coeff) {
			val coeffb = BigInteger.valueOf(coeff)
			this.nb1 = this.nb1.add(r.nb1.multiply(coeffb))
			this.nb2 = this.nb2.add(r.nb2.multiply(coeffb))
			this
		}
		
		override toString() {
			'(' + nb1 + ',' + nb2 + ')'
		}
	}
	
	static class Game {
		
		int square1
		int score1
		
		int square2
		int score2
		
		boolean p1
		
		new (int square1_, int score1_, int square2_, int score2_, boolean p1_) {
			square1 = square1_
			square2 = square2_
			score1 = score1_
			score2 = score2_
			p1 = p1_
		}
		
		new (Game other) {
			this(other.square1, other.score1, other.square2, other.score2, other.p1)
		}
		
		def Result step() {
			if (p1 && score2 > 20)
				new Result(false)
			else if (!p1 && score1 > 20)
				new Result(true)
			else {
				val r1 = new Game(this).play(3).step
				val r2 = new Game(this).play(4).step
				val r3 = new Game(this).play(5).step
				val r4 = new Game(this).play(6).step
				val r5 = new Game(this).play(7).step
				val r6 = new Game(this).play(8).step
				val r7 = new Game(this).play(9).step
				r1.add(r2,3).add(r3,6).add(r4,7).add(r5,6).add(r6,3).add(r7,1)
			}
		}
		
		def play(int dice) {
			if (p1) {
				square1 = (square1 + dice) % 10
				score1 += (square1 + 1) 
			} else {
				square2 = (square2 + dice) % 10
				score2 += (square2 + 1)
			}
			p1 = !p1
			this
		}
	}
	
	def static void main(String[] args) {
		
		val p1 = new Player(10)
		val p2 = new Player(9)
		
		var current = p2
		var dice = 0
		var rolls = 0
		
		do {
			var value = 0
			for (i : 0..2) {
				rolls++
				value += (dice + 1)
				dice = (dice + 1) % 100
			}
			current = (current == p1 ? p2 : p1)
			current.play(value)
		} while (current.score < 1000)
		
		println(rolls * (current == p1 ? p2 : p1).score)
		
		println(new Game(9,0,8,0,true).step)
	}
}