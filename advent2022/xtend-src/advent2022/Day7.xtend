package advent2022

import adventutils.input.InputLoader
import java.util.List

class Day7 {

	static final Folder root = new Folder
	static Folder current = root
	static final List<Folder> folders = newArrayList(root)

	def static void main(String[] args) {

		new InputLoader(2022, 7).getInputs.map [
			if(it.startsWith("$")) it.substring(2) else it
		].map[split(" ")].forEach [
			switch (it.get(0)) {
				case "cd":
					switch (it.get(1)) {
						case "/": current = root
						case "..": current = current.parent
						default: current = current.content.findFirst[e|e.name == it.get(1)] as Folder
					}
				case "ls":
					return
				case "dir":
					folders.add(new Folder(it.get(1), current))
				default:
					new File(it.get(1), current, Integer.parseInt(it.get(0)))
			}
		]
		
		println(folders.filter[it.size <= 100000].fold(0)[acc, e|acc + e.size])
		
		println(folders.sortBy[size].findFirst[it.size >= root.size-40000000].size)
	}

	static class File {

		public String name
		public Folder parent
		public int size

		new(String _name, Folder _parent, int _size) {
			name = _name
			parent = _parent
			size = _size
			if(parent !== null) parent.addChild(this)
		}
	}

	static class Folder extends File {

		List<File> content

		new(String _name, Folder _parent) {
			super(_name, _parent, 0)
			content = newArrayList
		}

		new() {
			this("root", null)
		}

		def addChild(File file) {
			content.add(file)
			if(file.size != 0) addSize(file.size)
		}

		def void addSize(int toAdd) {
			size += toAdd
			if (super.parent !== null)
				super.parent.addSize(toAdd)
		}
	}
}
