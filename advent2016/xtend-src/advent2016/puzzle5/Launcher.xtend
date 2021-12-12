package advent2016.puzzle5

import java.math.BigInteger
import java.security.MessageDigest
import java.util.List

class Launcher {
	
	static final String input = 'abbhdwsy'
	static final MessageDigest md = MessageDigest.getInstance('MD5')
	static final List<String> ans = newArrayList('','','','','','','','')
	
	def static void main(String[] args) {

		var i = 1L
		while (ans.contains(""))
			md5(input + (i++))
		
		println(ans.join)
	}
	
	def static void md5(String input) {
		md.reset
		var s = new BigInteger(1,md.digest(input.bytes)).toString(16)
		if (s.length <= 27) {
			s = '0'.repeat(27 - s.length).concat(s)
			var pos = Integer.parseInt(s.charAt(0) + '',16)
			if (pos >= 0 && pos < ans.size && ans.get(pos).isEmpty) {
				ans.remove(pos)
				ans.add(pos,s.charAt(1) + '')
			}
		}
	}
}