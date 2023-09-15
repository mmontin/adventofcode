package adventutils

class Either<L, R> {

	final L left
	final R right

	private new(L _left, R _right) {
		left = _left
		right = _right
	}

	def static <L,R> fromLeft(L _left) {
		new Either(_left, null as R)
	}

	def static <L,R> fromRight(R _right) {
		new Either(null as L, _right)

	}
	
	def isRight() {
		right !== null
	}
	
	def isLeft() {
		left !== null
	}
	
	def getLeft() {
		left
	}
	
	def getRight() {
		right
	}
}
