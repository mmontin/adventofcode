package advent2021.puzzle4

class Square {
	
	int number
	protected boolean called
	
	new(int number_) {
		number = number_
		called = false
	}
	
	def call(int number_) {
		called = called || (number == number_)
	}
	
	def value() {
		called ? 0 : number
	}
	
	override toString() {
		'(' + number + ' , ' + called + ')'
	}
}