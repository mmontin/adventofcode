package advent2021.puzzle22

import java.util.Set
import advent2021.Utils

class Launcher {
	
	static final Set<Coordinate> ons = newHashSet
	
	def static void main(String[] args) {
		Utils.getInputs(22).forEach[
			
			println("next")
			
			val split = it.split(",")
			val split1 = split.get(0).split(" ")
			val on = split1.get(0).equals("on")
			val split2 = split1.get(1).split("\\.\\.")
			val minx = Integer.parseInt(split2.get(0).substring(2))
			val maxx = Integer.parseInt(split2.get(1))
			val split3 = split.get(1).split("\\.\\.")
			val miny = Integer.parseInt(split3.get(0).substring(2))
			val maxy = Integer.parseInt(split3.get(1))
			val split4 = split.get(2).split("\\.\\.")
			val minz = Integer.parseInt(split4.get(0).substring(2))
			val maxz = Integer.parseInt(split4.get(1))
			
			(Math.max(-50,minx)..Math.min(50,maxx)).forEach[ i |
				(Math.max(-50,miny)..Math.min(50,maxy)).forEach[ j |
					(Math.max(-50,minz)..Math.min(50,maxz)).forEach[ k |
						if (on)
							ons.add(new Coordinate(i,j,k))
						else
							ons.remove(new Coordinate(i,j,k))
					]
				]
			]
		]
		
		println(ons.size)
	}
}