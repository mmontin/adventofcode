package adventutils.geometry

class Interval {
	
	public long leftBound
	public long rightBound

	new(long lb, long rb) {
		leftBound = lb
		rightBound = rb
	}
	
	new(String s) {
		this(Long.parseLong(s.split("-").get(0)), Long.parseLong(s.split("-").get(1)))
	}

	def int position(long dot) {
		if (dot < leftBound)
			-1
		else if(dot > rightBound) 1 else 0
	}
	
	def contains(long dot) {
		position(dot) == 0
	}
		
	def boolean includedIn(Interval other) {
		other.contains(leftBound) && other.contains(rightBound)
	}
	
	def boolean overlapsWith(Interval other) {
		other.contains(leftBound) || other.contains(rightBound)
	}

	def length() {
		rightBound - leftBound
	}
	
	def isUnity() {
		length == 0
	}

	override toString() {
		'[' + leftBound + ',' + rightBound + ']'
	}
}
