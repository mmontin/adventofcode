package advent2016.puzzle21

import advent2016.Utils

class Launcher {
	def static void main(String[] args) {
		
		val sb = new StringBuffer("abcdefgh")
		
		Utils.getInputs(21).forEach[
			val split = it.split(" ")
			switch (split.get(0)) {
				case "swap" : {
					if (split.get(1).equals("position")) {
						val i = Integer::parseInt(split.get(2))
						val j = Integer::parseInt(split.get(5))
						val ch = sb.charAt(i)
						sb.setCharAt(i,sb.charAt(j))
						sb.setCharAt(j,ch)
					} else {
						val ch1 = split.get(2).charAt(0)
						val ch2 = split.get(5).charAt(0)
						for (i : 0..<sb.length) {
							if (sb.charAt(i).equals(ch1))
								sb.setCharAt(i,ch2)
							else if (sb.charAt(i).equals(ch2))
								sb.setCharAt(i,ch1)
						}
					}
				}
				case "rotate" : {
					if (split.get(1).equals("based")) {
						val ch = split.get(6)
						var offset = sb.indexOf(ch)
						if (offset >= 4) offset ++
						offset ++
						(0..<offset).forEach[
							val ch2 = sb.charAt(sb.length - 1)
							sb.deleteCharAt(sb.length - 1)
							sb.insert(0,ch2)
						]
					} else {
						val right = split.get(1).equals("right")
						val offset = Integer::parseInt(split.get(2))
						(0..<offset).forEach[
							if (right) {
								val ch = sb.charAt(sb.length - 1)
								sb.deleteCharAt(sb.length - 1)
								sb.insert(0,ch)
							} else {
								val ch = sb.charAt(0)
								sb.deleteCharAt(0)
								sb.append(ch)
							}
						]
					}
				}
				case "reverse" : {
					val i = Integer::parseInt(split.get(2))
					val j = Integer::parseInt(split.get(4))
					sb.replace(i,j+1,sb.substring(i,j+1).toCharArray.toList.reverse.join)
				}
				default : {
					val i = Integer::parseInt(split.get(2))
					val j = Integer::parseInt(split.get(5))
					val ch = sb.charAt(i)
					sb.deleteCharAt(i).insert(j,ch)
				}
			}
		]
		
		println(sb.toString)
	}
}