package advent2017

import adventutils.input.InputLoader
import adventutils.geometry.Coordinate

class Day11 {
	def static void main(String[] args) {
		val input = new InputLoader(2017,11).inputs.head.split(",")
		val starting_spot = new Coordinate
		var current = starting_spot
		val positions = newHashSet(current)
		for (i : input) {
			current = switch i {
				case "n" : current.addY(1)
				case "nw" : current.addY(1).addX(-1)
				case "sw" : current.addX(-1)
				case "s" : current.addY(-1)
				case "se" : current.addY(-1).addX(1) 
				case "ne" : current.addX(1)
			}
			positions.add(current)
		}
		println(current.steps)
		println(positions.maxBy[steps].steps)
	}
	
	def static steps(Coordinate c) {
		val val_x = Math.abs(c.x)
		val val_y = Math.abs(c.y)
		val_x+val_y-Math.min(val_x,val_y)
	}
}