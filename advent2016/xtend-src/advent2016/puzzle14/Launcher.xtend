package advent2016.puzzle14

import java.security.MessageDigest
import java.util.HashSet
import java.util.Map
import org.apache.commons.codec.binary.Hex

class Launcher {

	static final String salt = "cuanljph"
	static final MessageDigest md = MessageDigest.getInstance('MD5')

	def static void main(String[] args) {

		val keys = newHashSet
		val Map<Integer,String> data = newHashMap
		var indice = 0
		while (keys.size < 64) {
			md.reset
			var myString = (salt + indice)
			for (i : 0..2016) {
				md.update(myString.bytes)
				myString = Hex.encodeHexString(md.digest)
			}
			val myHash = myString
			val repeat3 = inARow(myHash, 3)
			if (!repeat3.equals("")) {
				new HashSet(data.entrySet).filter[myHash.contains(it.value)].forEach [
					keys.add(it.key)
					data.remove(it.key)
				]
				data.put(indice, repeat3.repeat(5))
			}
			data.remove(indice - 1000)
			indice++
		}
		println(keys.sort.get(63))
	}

	def static inARow(String s, int range) {
		var String output = ""
		var i = 0
		while (output.equals("") && i <= s.length - range) {
			if (s.substring(i, i + range).toCharArray.toSet.size == 1)
				output = s.charAt(i) + ''
			i++
		}
		output
	}
}
