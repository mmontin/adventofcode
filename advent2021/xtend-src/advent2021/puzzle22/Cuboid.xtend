package advent2021.puzzle22

import java.math.BigInteger
import java.util.Set

class Cuboid {

	int minx
	int maxx
	int miny
	int maxy
	int minz
	int maxz

	new(int minx_, int maxx_, int miny_, int maxy_, int minz_, int maxz_) {
		minx = minx_
		maxx = maxx_
		miny = miny_
		maxy = maxy_
		minz = minz_
		maxz = maxz_
	}

	new(String s) {
		val split = s.split(",")
		val split2 = split.get(0).split("\\.\\.")
		minx = Integer.parseInt(split2.get(0).substring(2))
		maxx = Integer.parseInt(split2.get(1))
		val split3 = split.get(1).split("\\.\\.")
		miny = Integer.parseInt(split3.get(0).substring(2))
		maxy = Integer.parseInt(split3.get(1))
		val split4 = split.get(2).split("\\.\\.")
		minz = Integer.parseInt(split4.get(0).substring(2))
		maxz = Integer.parseInt(split4.get(1))
	}
	
	def size() {
		BigInteger.valueOf(maxx - minx + 1).multiply(BigInteger.valueOf(maxy - miny + 1)).multiply(BigInteger.valueOf(maxz - minz + 1))
	}
	
	override toString() {
		'[' + '(' + minx + ',' + maxx + ')' + ',' + '(' + miny + ',' + maxy + ')' + ',' + '(' + minz + ',' + maxz + ')' + ']'
	}
	
	def Set<Cuboid> subtract(Cuboid other) {
		if (other.minx > maxx || other.maxx < minx || other.miny > maxy || other.maxy < miny || other.minz > maxz || other.maxz < minz)
			newHashSet(this)
		else {
			val output = newHashSet
			if (other.minx > minx) {
				output.add(new Cuboid(minx, other.minx - 1, miny, maxy, minz, maxz))
				minx = other.minx
			}
			if (other.maxx < maxx) {
				output.add(new Cuboid(other.maxx + 1, maxx, miny, maxy, minz, maxz))
				maxx = other.maxx
			}
			if (other.miny > miny) {
				output.add(new Cuboid(minx, maxx, miny, other.miny - 1, minz, maxz))
				miny = other.miny
			}
			if (other.maxy < maxy) {
				output.add(new Cuboid(minx, maxx, other.maxy + 1, maxy, minz, maxz))
				maxy = other.maxy
			}
			if (other.minz > minz) {
				output.add(new Cuboid(minx, maxx, miny, maxy, minz, other.minz - 1))
				minz = other.minz
			}
			if (other.maxz < maxz) {
				output.add(new Cuboid(minx, maxx, miny, maxy, other.maxz + 1, maxz))
				maxz = other.maxz
			}
			output
		}
	}
}
