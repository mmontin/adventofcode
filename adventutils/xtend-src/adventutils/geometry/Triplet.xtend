package adventutils.geometry

import java.util.List

class Triplet {
	
	public final int x
	public final int y
	public final int z
	
	final int _hashCode
	
	new(String s) {
		this(s.split(",").map[Integer.parseInt(it)])
	}

	new (List<Integer> input) {
		this(input.get(0),input.get(1),input.get(2))
	}
	
	new (int _x, int _y, int _z) {
		x = _x
		y = _y
		z = _z
		
		_hashCode = toString.hashCode
	}
	
	override toString() {
		"(" + x + "," + y + "," + z + ")"
	}
	
	override equals(Object other) {
		switch (other) {
			Triplet : other.x == x && other.y == y && other.z == this.z
			default : false
		}
	}
	
	override hashCode() {
		_hashCode
	}
	
	def face_neighbours() {
		newHashSet(incrX, decrX, incrY, decrY, incrZ, decrZ)
	}
	
	def incrZ() {
		new Triplet(x, y, z + 1)
	}
	
	def decrZ() {
		new Triplet(x, y, z - 1)
	}
		
	def incrX() {
		new Triplet(x + 1, y, z)
	}
	
	def decrX() {
		new Triplet(x - 1, y, z)
	}
		
	def incrY() {
		new Triplet(x, y + 1, z)
	}
	
	def decrY() {
		new Triplet(x, y - 1, z)
	}
}