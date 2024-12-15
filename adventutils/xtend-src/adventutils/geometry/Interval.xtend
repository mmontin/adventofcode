package adventutils.geometry

class Interval {

	public long leftBound
	public long rightBound

	new(long lb, long rb) {
		leftBound = lb
		rightBound = rb
	}
	
	new(Interval other) {
		this(other.leftBound, other.rightBound)
	}

	new(String s) {
		this(Long.parseLong(s.split("-").get(0)), Long.parseLong(s.split("-").get(1)))
	}
	
	def Interval translate(long t) {
		new Interval(leftBound + t, rightBound + t)
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

	def Interval intersection(Interval other) {
		new Interval(
			Math.max(this.leftBound, other.leftBound),
			Math.min(this.rightBound, other.rightBound)
		)
	}
	
	def Interval swapIfNeeded() {
		new Interval(Math.min(leftBound,rightBound), Math.max(leftBound,rightBound))
	}

	def length() {
		rightBound - leftBound
	}

	def isUnity() {
		length == 0
	}

	def isEmpty() {
		length < 0
	}
	
	def split(long limit, boolean includeLeft) {
		new Interval(leftBound, includeLeft ? limit : limit - 1) ->
		new Interval(includeLeft ? limit + 1 : limit, rightBound)
	}

	override toString() {
		'[' + leftBound + ',' + rightBound + ']'
	}
}
