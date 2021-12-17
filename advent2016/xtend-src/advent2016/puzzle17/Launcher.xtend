package advent2016.puzzle17

import java.security.MessageDigest
import org.apache.commons.codec.binary.Hex

class Launcher {

	final static String input = "rrrbmfta"
	static final MessageDigest md = MessageDigest.getInstance('MD5')

	static int min_length = Integer::MAX_VALUE
	static int max_length = 0
	static String min_path = ""

	def static void main(String[] args) {
		step(new Coordinates(0, 0), "")
		println("PART 1: " + min_path)
		println("PART 2: " + max_length)
	}

	def static void step(Coordinates current, String path) {
		if (current.final) {
			if (path.length < min_length) {
				min_length = path.length
				min_path = path
			}
			max_length = Math.max(max_length, path.length)
		} else
			current.neighbours(hashAndCollect(input + path)).entrySet.forEach [
				step(it.value, path + it.key)
			]
	}

	def static hashAndCollect(String s) {
		md.update(s.bytes)
		Hex.encodeHexString(md.digest).substring(0, 4).toCharArray.toList.map[it + ''].map [
			switch it {
				case 'b', case 'c',	case 'd', case 'e', case 'f': true
				default: false
			}
		]
	}
}
