package advent2022

import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day7 {

	static final Folder root = new Folder("root", null)
	static Folder current = root
	static final List<Folder> folders = newArrayList(root)

	def static void main(String[] args) {

		new InputLoader(2022, 7).getInputs.map [
			if(it.startsWith("$")) it.substring(2) else it
		].map[split(" ")].forEach [
			switch (it.get(0)) {
				case "cd":
					current = switch (it.get(1)) {
						case "/": root
						case "..": current.parent
						default: current.content.get(it.get(1))
					}
				case "ls":
					return
				case "dir":
					folders.add(new Folder(it.get(1), current))
				default:
					current.addSize(Integer.parseInt(it.get(0)))
			}
		]

		println(folders.filter[it.size <= 100000].fold(0)[acc, e|acc + e.size])
		println(folders.sortBy[size].findFirst[it.size >= root.size - 40000000].size)
	}

	static class Folder {

		public Folder parent
		public int size
		Map<String, Folder> content

		new(String _name, Folder _parent) {
			parent = _parent
			size = 0
			content = newHashMap
			if(parent !== null) parent.content.put(_name, this)
		}

		def void addSize(int toAdd) {
			size += toAdd
			if(parent !== null) parent.addSize(toAdd)
		}
	}
}
