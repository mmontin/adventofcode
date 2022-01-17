package advent2016.puzzle7

import adventutils.input.InputLoader

class Launcher {
	def static void main(String[] args) {
		val input = new InputLoader(2016,7).getInputs
		println(input.fold(0)[v , e |
			v + (checkTLS(e) ? 1 : 0)
		])
		println(input.fold(0)[v , e |
			v + (checkSSL(e) ? 1 : 0)
		])
	}
	
	def static checkSSL(String s) {
		var tmp = s
		val s1 = newArrayList
		val s2 = newArrayList
		while(tmp.contains('[')) {
			var i = tmp.indexOf('[')
			var j = tmp.indexOf(']')
			s1.addAll(getSSLPatterns(tmp.substring(0,i)))
			s2.addAll(getSSLPatterns(tmp.substring(i+1,j)))
			tmp = tmp.substring(j+1)
		}
		s1.addAll(getSSLPatterns(tmp))
		s1.fold(false)[b , e |
			b || s2.findFirst[compatible(it,e)] !== null
		]
	}
	
	def static checkTLS(String s) {
		var tmp = s
		var s1 = false
		var s2 = false
		while (tmp.contains('[')) {
			var i = tmp.indexOf('[')
			var j = tmp.indexOf(']')
			s1 = s1 || Launcher.hasTLSPattern(tmp.substring(0,i))
			s2 = s2 || Launcher.hasTLSPattern(tmp.substring(i+1,j))
			tmp = tmp.substring(j+1)
		}
		s1 = s1 || Launcher.hasTLSPattern(tmp)
		s1 && !s2
	}
	
	def static getSSLPatterns(String s) {
		val ans = newArrayList()
		(0..s.length-3).forEach[ i |
			if (smallHasSSLPatter(s.substring(i,i+3)))
				ans.add(s.substring(i,i+3))
		]
		ans
	}
	
	def static hasTLSPattern(String s) {
		var i = 0
		var ans = false
		while (i <= s.length-4 && !ans) {
			ans = ans || Launcher.smallHasTLSPattern(s.substring(i,i+4))
			i ++
		}
		ans
	}
	
	def static smallHasSSLPatter(String s) {
		s.charAt(0).equals(s.charAt(2)) &&
		!s.charAt(0).equals(s.charAt(1))
	}
	
	def static smallHasTLSPattern(String s) {
		s.charAt(0).equals(s.charAt(3)) &&
		s.charAt(1).equals(s.charAt(2)) &&
		!s.charAt(0).equals(s.charAt(1))
	}
	
	def static compatible(String s1, String s2) {
		s1.charAt(0).equals(s2.charAt(1)) &&
		s2.charAt(0).equals(s1.charAt(1))
	}
}