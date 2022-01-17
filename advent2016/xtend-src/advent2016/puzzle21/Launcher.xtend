package advent2016.puzzle21

import adventutils.input.InputLoader

class Launcher {
	def static void main(String[] args) {
		
		val il = new InputLoader(2016,21)
		
		val sb = new StringBuffer("abcdefgh")
		
		il.getInputs.forEach[
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
		
		println(sb)
		println('--------------')
		
		val sb2 = new StringBuffer("fbgdceah")
		
		il.getInputs.reverse.forEach[
			val split = it.split(" ")
			switch (split.get(0)) {
				case "swap" : {
					if (split.get(1).equals("position")) {
						val i = Integer::parseInt(split.get(2))
						val j = Integer::parseInt(split.get(5))
						val ch = sb2.charAt(i)
						sb2.setCharAt(i,sb2.charAt(j))
						sb2.setCharAt(j,ch)
					} else {
						val ch1 = split.get(2).charAt(0)
						val ch2 = split.get(5).charAt(0)
						for (i : 0..<sb2.length) {
							if (sb2.charAt(i).equals(ch1))
								sb2.setCharAt(i,ch2)
							else if (sb2.charAt(i).equals(ch2))
								sb2.setCharAt(i,ch1)
						}
					}
				}
				case "rotate" : {
					if (split.get(1).equals("based")) {
						var offset = switch(sb2.indexOf(split.get(6))) {
							case 1 : 1
							case 3 : 2
							case 5 : 3
							case 7 : 4
							case 2 : 6
							case 4 : 7
							case 6 : 0
							default : 1
						}
						(0..<offset).forEach[
							val ch = sb2.charAt(0)
							sb2.deleteCharAt(0)
							sb2.append(ch)
						]
					} else {
						val right = !split.get(1).equals("right")
						val offset = Integer::parseInt(split.get(2))
						(0..<offset).forEach[
							if (right) {
								val ch = sb2.charAt(sb2.length - 1)
								sb2.deleteCharAt(sb2.length - 1)
								sb2.insert(0,ch)
							} else {
								val ch = sb2.charAt(0)
								sb2.deleteCharAt(0)
								sb2.append(ch)
							}
						]
					}
				}
				case "reverse" : {
					val i = Integer::parseInt(split.get(2))
					val j = Integer::parseInt(split.get(4))
					sb2.replace(i,j+1,sb2.substring(i,j+1).toCharArray.toList.reverse.join)
				}
				default : {
					val i = Integer::parseInt(split.get(5))
					val j = Integer::parseInt(split.get(2))
					val ch = sb2.charAt(i)
					sb2.deleteCharAt(i).insert(j,ch)
				}
			}
		]
		
		println(sb2)
	}
}