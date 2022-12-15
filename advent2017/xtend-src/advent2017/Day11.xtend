package advent2017

import adventutils.geometry.Coordinate
import adventutils.input.InputLoader

class Day11 {

	static Coordinate current = new Coordinate
	static int further = 0

	def static void main(String[] args) {

		new InputLoader(2017, 11).inputs.head.split(",").forEach [
			current = switch it {
				case "n": current.addY(1)
				case "nw": current.addY(1).addX(-1)
				case "sw": current.addX(-1)
				case "s": current.addY(-1)
				case "se": current.addY(-1).addX(1)
				case "ne": current.addX(1)
			}
			further = Math.max(further,current.steps)
		]

		println(current.steps)
		println(further)
	}

	def static steps(Coordinate c) {
		val val_x = Math.abs(c.x)
		val val_y = Math.abs(c.y)
		val_x + val_y - Math.min(val_x, val_y)
	}
}
