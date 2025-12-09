package adventutils.geometry

// These represent horizontal or vertical segments.
class Segment {
	// True if the segment is vertical, false otherwise
	boolean vertical
	// The fixed coordinate of the segment (x if horizontal, y otherwise)
	int fixed
	// The range in which the non-fix coordinate can vary
	IntegerRange variable

	// Assuming these coordinates make for a vertical or horizontal segment
	new(Coordinate c1, Coordinate c2) {
		if (c1.x == c2.x) {
			vertical = false
			fixed = c1.x
			variable = Math.min(c1.y, c2.y) .. Math.max(c1.y, c2.y)
		} else if (c1.y == c2.y) {
			vertical = true
			fixed = c1.y
			variable = Math.min(c1.x, c2.x) .. Math.max(c1.x, c2.x)
		} else
			throw new RuntimeException("The segment is neither horizontal nor vertical")
	}

	// Intersection, with the assumption that only orthogonal segments may intersect.
	// Intersection is actually pretty simple with this representation, as the fixed
	// portion of both segments only has to live within the variable portion of the other
	// for 2 segments to intersect.
	def intersect(Segment other) {
		other.vertical.xor(vertical) && 
		variable.contains(other.fixed) && 
		other.variable.contains(fixed)
	}
}
