package advent2021.puzzle19

import advent2021.Utils
import java.util.HashSet
import java.util.List

class Launcher {
	
	public static final Matrix RxPi2  = new Matrix(#[#[1,0,0],#[0,0,-1],#[0,1,0]])
	public static final Matrix RxPi   = new Matrix(#[#[1,0,0],#[0,-1,0],#[0,0,-1]])
	public static final Matrix RxmPi2 = new Matrix(#[#[1,0,0],#[0,0,1],#[0,-1,0]])
	public static final Matrix RyPi2  = new Matrix(#[#[0,0,1],#[0,1,0],#[-1,0,0]])
	public static final Matrix RyPi   = new Matrix(#[#[-1,0,0],#[0,1,0],#[0,0,-1]])
	public static final Matrix RymPi2 = new Matrix(#[#[0,0,-1],#[0,1,0],#[1,0,0]])
	public static final Matrix RzPi2  = new Matrix(#[#[0,-1,0],#[1,0,0],#[0,0,1]])
	public static final Matrix RzPi   = new Matrix(#[#[-1,0,0],#[0,-1,0],#[0,0,1]])
	public static final Matrix RzmPi2 = new Matrix(#[#[0,1,0],#[-1,0,0],#[0,0,1]])
	
	def static void main(String[] args) {
		
		val data = newArrayList
		val inputReader = Utils.getInputReader(19)
		var String tmp_string
		var List<Vector> tmp
		while((tmp_string = inputReader.readLine)!==null) {
			if (tmp_string.contains("scanner")) tmp = newArrayList
			else if (tmp_string.isEmpty) data.add(tmp)
			else tmp.add(new Vector(tmp_string))
		}
		
		val distances = newArrayList
		data.forEach[
			val dists = newHashSet
			for (i : 0 ..< it.size)
				for (j : i + 1 ..< it.size)
					dists.add(it.get(i).to(it.get(j)).size2)
			distances.add(dists)
		]

		for (i : 0..<distances.size)
			for (j : i+1..<distances.size) {
				var intersection = new HashSet(distances.get(i))
				intersection.retainAll(distances.get(j))
				if (intersection.size > 0) {
					println('(' + i + ',' + j + ')')
					println(intersection.size)
					println("------------------")
				}
			}
	}
}