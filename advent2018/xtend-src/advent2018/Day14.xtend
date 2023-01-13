package advent2018

import java.util.List

class Day14 {
	
	final static int index = 513401
	
	static List<Integer> recipes = newArrayList(3,7)
	static int elf_1 = 0
	static int elf_2 = 1
	
	def static void main(String[] args) {
		while (recipes.size < index + 10) step
		println(recipes.subList(index,index+10).join)
		for (i:0..25000000) step
		println((0..<recipes.size-6).findFirst[recipes.subList(it,it+6).join.equals(index.toString)])
	}
	
	def static void step() {
		val sum = recipes.get(elf_1) + recipes.get(elf_2)
		recipes.addAll(sum.toString.toCharArray.map[Integer.parseInt(it.toString)])
		elf_1 = (recipes.get(elf_1) + elf_1 + 1) % recipes.size
		elf_2 = (recipes.get(elf_2) + elf_2 + 1) % recipes.size
	}
}