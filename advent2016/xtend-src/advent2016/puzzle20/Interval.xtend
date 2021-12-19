package advent2016.puzzle20

class Interval {
	
	protected long leftBound
	protected long rightBound
	
	new(String s) {
		var split = s.split("-")
		leftBound = Long::parseLong(split.get(0))
		rightBound = Long::parseLong(split.get(1))
	}
	
	def int contains(long dot) {
		if (dot < leftBound) -1
		else if (dot > rightBound) 1
		else 0
	}
	
	override toString() {
		'[' + leftBound + ',' + rightBound + ']'
	}
}