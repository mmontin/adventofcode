package advent2021.puzzle5

import adventutils.input.InputLoader
import java.util.HashMap

class Launcher {
	def static void main(String[] args) {
		
		val points = new HashMap<Point,Integer>()
		new InputLoader(2021,5).getInputs[s | new Segment(s)].forEach[s | s.addPointsOnGrid(points)]
		println(points.values.fold(0)[v , n | n >= 2 ? v + 1 : v])
	}
}