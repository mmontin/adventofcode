package advent2021.puzzle4

class Square {
	
	protected int number
	protected boolean called
	
	new(int number_) {
		number = number_
		called = false
	}
	
	def call(int number_) {
		called = called || (number == number_)
	}
}