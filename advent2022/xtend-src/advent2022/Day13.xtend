package advent2022

import adventutils.input.InputLoader
import adventutils.list.AgdaList
import java.util.ArrayList
import java.util.List
import java.util.Stack

class Day13 {
	
	static final Package div1 = {
		val output = new ListPackage
		val inner = new ListPackage
		inner.packages.add(new UnaryPackage(2))
		output.packages.add(inner)
		output
	}

	static final Package div2 = {
		val output = new ListPackage
		val inner = new ListPackage
		inner.packages.add(new UnaryPackage(6))
		output.packages.add(inner)
		output
	}

	def static void main(String[] args) {
		val inputs = new InputLoader(2022, 13).inputs
		var i = 0
		val pairs = newArrayList
		while (i < inputs.size) {
			pairs.add(
				Package.newPackage(new ArrayList(inputs.get(i).toCharArray.map[it + ""])) ->
					Package.newPackage(new ArrayList(inputs.get(i + 1).toCharArray.map[it + ""]))
			)
			i = i + 3
		}
		var sum = 0
		for (k : 1..pairs.size) {
			val current = pairs.get(k-1)
			if (current.key.compareTo(current.value) >= 0)
				sum += k
		}
		println(sum)
		
		val all = newArrayList(div1, div2)
		pairs.forEach[
			all.add(it.key)
			all.add(it.value)
		]
		val sorted = all.sort.reverse
		println((sorted.indexOf(div1) + 1) * (sorted.indexOf(div2) + 1))
	}

	static abstract class Package implements Comparable<Package> {

		def static Package newPackage(ArrayList<String> strings) {

			val existing = new Stack

			while (!strings.isEmpty) {
				switch (current : strings.remove(0)) {
					case "[":
						existing.push(new ListPackage)
					case "]": {
						val finished = existing.pop
						if (existing.size == 0)
							return finished
						else
							((existing.peek as ListPackage).packages.add(finished))
					}
					case ",": {
					}
					default: {
						try {
							var full = Integer.parseInt(current + strings.get(0))
							(existing.peek as ListPackage).packages.add(new UnaryPackage(full))
							strings.remove(0)
						} catch (NumberFormatException nfe) {
							(existing.peek as ListPackage).packages.add(new UnaryPackage(Integer.parseInt(current)))
						}
					}
				}
			}
		}

		override int compareTo(Package p2) {
			switch this {
				UnaryPackage: {
					switch p2 {
						UnaryPackage:
							p2.value.compareTo((this as UnaryPackage).value)
						default: {
							(this as UnaryPackage).toListPackage.compareTo(p2)
						}
					}
				}
				default: {
					switch p2 {
						UnaryPackage:
							this.compareTo(p2.toListPackage)
						default: {
							val l1 = this as ListPackage
							val l2 = p2 as ListPackage
							if (l1.packages.isEmpty && l2.packages.isEmpty)
								0
							else if (l1.packages.isEmpty)
								1
							else if (l2.packages.isEmpty)
								-1
							else
								switch (res : l1.packages.get(0).compareTo(l2.packages.get(0))) {
									case 0 : l1.tailPackage.compareTo(l2.tailPackage)
									default : res
								}

						}
					}
				}
			}
		}
	}

	static class UnaryPackage extends Package {

		int value

		new(int i) {
			value = i
		}

		override String toString() {
			"(UP " + value.toString + ")"
		}

		def toListPackage() {
			val ret = new ListPackage
			ret.packages.add(this)
			ret
		}
	}

	static class ListPackage extends Package {

		List<Package> packages

		new() {
			packages = newArrayList
		}

		def tailPackage() {
			val ret = new ListPackage
			ret.packages.addAll(packages.drop(1))
			ret
		}

		override String toString() {
			"(LP " + new AgdaList(packages).toString + ")"
		}
	}
}
