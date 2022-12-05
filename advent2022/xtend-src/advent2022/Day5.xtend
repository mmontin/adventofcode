package advent2022

import java.util.List
import adventutils.input.InputLoader
import java.util.ArrayList

class Day5 {
	
	static List<List<String>> distribution
	
	def static init() {
		distribution = newArrayList(
			newArrayList("S", "P", "W", "N", "J", "Z"), 
			newArrayList("T", "S", "G"),
			newArrayList("H", "L", "R", "Q", "V"), 
			newArrayList("D", "T", "S", "V"),
			newArrayList("J", "M", "B", "D", "T", "Z", "Q"), 
			newArrayList("L", "Z", "C", "D", "J", "T", "W", "M"),
			newArrayList("J", "T", "G", "W", "M", "P", "L"), 
			newArrayList("H", "Q", "F", "B", "T", "M", "G", "N"),
			newArrayList("W", "Q", "B", "P", "C", "G", "D", "R"))
	}
	
	def static void main(String[] args) {
		
		val inputs = new InputLoader(2022,5).getInputs
		
		init
		
		inputs.forEach[
			val els = it.split(" ")
			val number = Integer.parseInt(els.get(1))
			val from = Integer.parseInt(els.get(3))-1
			val to = Integer.parseInt(els.get(5))-1
			(1..number).forEach[move(from,to)]
		]
		
		println(distribution.fold("")[acc,e|acc+e.get(0)])
		
		init
		
		inputs.forEach[
			val els = it.split(" ")
			val number = Integer.parseInt(els.get(1))
			val from = Integer.parseInt(els.get(3))-1
			val to = Integer.parseInt(els.get(5))-1
			moveSeveral(number,from,to)
		]
		
		println(distribution.fold("")[acc,e|acc+e.get(0)])
	}
	
	def static move(int from, int to) {
		distribution.get(to).add(0,distribution.get(from).remove(0))
	}
	
	def static moveSeveral(int number, int from, int to) {
		val listIn = distribution.get(from)
		val listOut = distribution.get(to)
		val toMove = new ArrayList(listIn.subList(0,number))
		val toKeep = new ArrayList(listIn.subList(number,listIn.size))
		distribution.set(from,toKeep)
		toMove.addAll(listOut)
		distribution.set(to,toMove)
	}
}