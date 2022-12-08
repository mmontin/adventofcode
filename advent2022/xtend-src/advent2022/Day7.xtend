package advent2022

import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day7 {

	// The root of the filesystem
	static final Folder root = new Folder("root", null)
	
	// The folder we are currently in
	static Folder current = root
	
	// All folders considers, tracked for convenience
	static final List<Folder> folders = newArrayList(root)

	def static void main(String[] args) {

		new InputLoader(2022, 7).getInputs.map [
			//removing the "$" as they are of no use
			if(it.startsWith("$")) it.substring(2) else it
		].map[split(" ")].forEach [
			switch (it.get(0)) {
				// switching to the right place when needed
				case "cd":
					current = switch (it.get(1)) {
						case "/": root
						case "..": current.parent
						default: current.content.get(it.get(1))
					}
				// ignoring "ls" as this is noise
				case "ls":
					return
				// here we create a directory and assign current as parent
				case "dir":
					folders.add(new Folder(it.get(1), current))
				// when a file is encountered we only have to gather its size
				default:
					current.addSize(Integer.parseInt(it.get(0)))
			}
		]

		// 1st star requires the sum of all directories of size <= 100000
		println(folders.filter[it.size <= 100000].fold(0)[acc, e|acc + e.size])
		
		// 2nd star requires the smallest directory that frees up enough room
		println(folders.filter[it.size >= root.size - 40000000].minBy[size].size)
	}

	static class Folder {

		public Folder parent
		public int size
		Map<String, Folder> content

		// When we create a folder, we add it to its parents children
		new(String _name, Folder _parent) {
			parent = _parent
			size = 0
			content = newHashMap
			if(parent !== null) parent.content.put(_name, this)
		}

		// When adding a file, we update the size of all the ancestors
		def void addSize(int toAdd) {
			size += toAdd
			if(parent !== null) parent.addSize(toAdd)
		}
	}
}
