package advent2017

class Day15 {
	
	static final long a_start = 289
	static final long b_start = 629
	
	static final long a_factor = 16807
	static final long b_factor = 48271
	
	static final long a_multiple = 4
	static final long b_multiple = 8
	
	static final long divisor = 2147483647

	def static void main(String[] args) {
	
		var a_current = a_start
		var b_current = b_start
		var nb_of_matches = 0
		
		for (i : 0..<40000000) {
			a_current = (a_current * a_factor) % divisor
			b_current = (b_current * b_factor) % divisor
			var a_string = pad_and_trim(Long.toString(a_current,2))
			var b_string = pad_and_trim(Long.toString(b_current,2))
			if (a_string.equals(b_string)) nb_of_matches ++
		}
		
		println(nb_of_matches)
		
		a_current = a_start
		b_current = b_start
		nb_of_matches = 0
		
		for (i : 0..<5000000) {
			do
				a_current = (a_current * a_factor) % divisor
			while (a_current % a_multiple != 0)
			do
				b_current = (b_current * b_factor) % divisor
			while (b_current % b_multiple != 0)
			
			var a_string = pad_and_trim(Long.toString(a_current,2))
			var b_string = pad_and_trim(Long.toString(b_current,2))
			if (a_string.equals(b_string)) nb_of_matches ++	
		}
		
		println(nb_of_matches)
	}
	
	def static pad_and_trim(String s) {
		s.length >= 16 ? 
			s.substring(s.length-16,s.length) :
			String.format("%1$" + 16 + "s", s).replace(' ', '0')
	}
}