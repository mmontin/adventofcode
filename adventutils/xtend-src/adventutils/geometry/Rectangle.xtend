package adventutils.geometry

import java.math.BigInteger

class Rectangle implements Comparable<Rectangle> {

	final IntegerRange x
	final IntegerRange y

	public final int minX
	public final int maxX
	public final int minY
	public final int maxY

	public final Coordinate top_left
	public final Coordinate top_right
	public final Coordinate bot_left
	public final Coordinate bot_right

	new(int x1, int x2, int y1, int y2) {

		x = x1 <= x2 ? x1 .. x2 : x2 .. x1
		y = y1 <= y2 ? y1 .. y2 : y2 .. y1

		minX = x.start
		maxX = x.end
		minY = y.start
		maxY = y.end

		top_left = new Coordinate(minX, minY)
		top_right = new Coordinate(minX, maxY)
		bot_left = new Coordinate(maxX, minY)
		bot_right = new Coordinate(maxX, maxY)
	}

	new(Coordinate fst, Coordinate snd) {
		this(fst.x, snd.x, fst.y, snd.y)
	}
	
	def height() {
		maxX - minX
	}
	
	def width() {
		maxY - minY
	}

	def hasInterior() {
		height >= 1 && width >= 1
	}

	// Returns the rectangle exactly contained in this rectangle
	// Will throw an exception if the rectangle is too small
	def subRectangle() {
		if (!hasInterior) throw new RuntimeException("Rectangle too small to contain a sub rectangle")
		new Rectangle(top_left.addX(1).addY(1), bot_right.addX(-1).addY(-1))
	}
	
	def pick() {
		if (!hasInterior) throw new RuntimeException("Rectangle too small to pick an element in its interior")
		top_left.addX(1).addY(1)
	}

	def area() {
		(BigInteger.valueOf(maxY + 1) - BigInteger.valueOf(minY)) *
			(BigInteger.valueOf(maxX + 1) - BigInteger.valueOf(minX))
	}

	def innerArea() {
		(BigInteger.valueOf(maxY) - BigInteger.valueOf(minY + 1)) *
			(BigInteger.valueOf(maxX) - BigInteger.valueOf(minX + 1))
	}

	def contains(Coordinate c) {
		minX <= c.x && c.x <= maxX && minY <= c.y && c.y <= maxY
	}

	def strictlyContains(Coordinate c) {
		minX < c.x && c.x < maxX && minY < c.y && c.y < maxY
	}
	
	def segments() {
		newArrayList(
			new Segment(top_left,top_right),
			new Segment(top_right,bot_right),
			new Segment(bot_right,bot_left),
			new Segment(bot_left,top_left)
		)
	}

	def intersectsWith(Segment s) {
		segments.exists[it.intersect(s)]
	}

	def borders() {
		newHashSet(
			newHashSet(top_left, top_right),
			newHashSet(bot_left, bot_right),
			newHashSet(top_left, bot_left),
			newHashSet(top_right, bot_right)
		)
	}

	def bordersAndCorners() {
		newHashSet(top_left, top_right, bot_left, bot_right) -> newHashSet(
			newHashSet(top_left.addY(1), top_right.addY(-1)),
			newHashSet(bot_left.addY(1), bot_right.addY(-1)),
			newHashSet(top_left.addX(1), bot_left.addX(-1)),
			newHashSet(top_right.addX(1), bot_right.addX(-1))
		)
	}

	def allCoordinates() {
		val output = newHashSet
		x.forEach[i|y.forEach[j|output.add(new Coordinate(i, j))]]
		output
	}

	override hashCode() {
		minX * maxX + minY * maxY
	}

	override equals(Object other) {
		val Rectangle o = other as Rectangle
		minX == o.minX && maxY == o.maxY && minY == o.minY && maxY == o.maxY
	}

	override compareTo(Rectangle other) {
		val one = top_left.compareTo(other.top_left)
		if (one == 0)
			bot_right.compareTo(other.bot_right)
		else
			one
	}

	override toString() {
		"[" + top_left + " ; " + bot_right + "]"
	}
}
