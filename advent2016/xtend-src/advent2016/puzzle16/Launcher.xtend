package advent2016.puzzle16

import java.util.Map

class Launcher {
	
	static final Map<Integer,Boolean> data = newHashMap
	
	static final String input = "10001001100000001"
	static final int disk_size = 35651584
	
	def static void main(String[] args) {
		
		// Initializing data
		(0..<input.length).forEach[ i |
			data.put(i,('' + input.charAt(i)).equals("1") ? true : false)
		]
		
		// Computing the whole disk
		while(data.size < disk_size) {
			data.put(data.size,false)
			val pivot = data.size-1
			for (i : 1..pivot) data.put(pivot+i,!data.get(pivot-i))
		}
		
		// Removing additional elements
		for (i : disk_size..<data.size) data.remove(i)
		
		// Computing the checksum repeatedly
		while(data.size % 2 == 0) {
			for (i : 0..<(data.size / 2))	{
				val prod = 2*i
				val b = data.get(prod) == data.get(prod+1)
				data.remove(prod)
				data.remove(prod+1)
				data.put(i,b)
			}
		}

		for (i : 0..<data.size)
			print(data.get(i) ? 1 : 0)
	}
}