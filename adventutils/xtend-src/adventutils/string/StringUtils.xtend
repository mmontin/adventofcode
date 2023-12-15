package adventutils.string

class StringUtils {

	def static reverse(String s) {
		s.toCharArray.reverse.join
	}

	def static padWith(String input, String padding, int size) {
		String.format("%1$" + size + "s", input).replace(" ", padding)
	}
}
