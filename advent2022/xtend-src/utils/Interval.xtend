package utils

class Interval {
	
	int x
	int y
	
	new (String s) {
		val split1 = s.split("-")
		x = Integer.parseInt(split1.get(0))
		y = Integer.parseInt(split1.get(1))
	}
	
	def boolean contains(int e) {
		e >= x && e <= y
	}
	
	def boolean includedIn(Interval other) {
		other.contains(x) && other.contains(y)
	}
	
	def boolean overlapsWith(Interval other) {
		other.contains(x) || other.contains(y)
	}
}