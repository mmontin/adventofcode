package advent2016.puzzle4

import advent2016.Utils
import java.util.List
import java.util.Collections

class Launcher {
	
	static class Tuple implements Comparable<Tuple> {
		
		String s
		int occurrences
		
		new(String s_, int occurrences_) {
			s = s_
			occurrences = occurrences_
		}
		
		override compareTo(Tuple other) {
			if (occurrences > other.occurrences)
				-1
			else if (occurrences < other.occurrences)
				1
			else
				s.compareTo(other.s)
		}
		
		override toString() {
			'(' + s + ',' + occurrences + ')'
		}
	}
	
	static class Entry {
		
		static final String alphabet = "abcdefghijklmnopqrstuvwxyz"
		
		List<String> encrypted_name
		Integer sector_id
		String checksum
		
		new(String s) {
			val split = s.split("-").toList
			val split1 = split.last.split("\\[")
			sector_id = Integer::parseInt(split1.get(0))
			checksum = split1.get(1).split('\\]').get(0)
			encrypted_name = split.take(split.size-1).toList
		}
		
		def boolean verifyChecksum() {
			val encrypted_name_sampled = encrypted_name.fold(newArrayList)[l , v |
				l.addAll(v.toCharArray.map[it + ''])
				l
			]
			encrypted_name_sampled.toSet.fold(newArrayList)[l , e |
				l.add(new Tuple(e,Collections.frequency(encrypted_name_sampled,e)))
				l
			].sort.take(5).map[s].join.equals(checksum)
		}
		
		def decode() {
			encrypted_name.map[
				it.toCharArray.fold('')[s , v |
					s + alphabet.charAt((alphabet.indexOf(v) + sector_id) % 26)
				]
			].join('-')
		}
	}
	
	def static void main(String[] args) {
		
		val entries = Utils.getInputs(4)[new Entry(it)]
		
		println(entries.fold(0)[sum , e | e.verifyChecksum ? sum + e.sector_id : sum])
		
		println(entries.filter[verifyChecksum].findFirst[it.decode.contains("north")].sector_id)
	}
}