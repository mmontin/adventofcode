package advent2022

import adventutils.input.InputLoader
import java.util.List
import java.util.Map

class Day7 {

	// The root of the filesystem
	static final Folder root = new Folder("root", null)

	// The folder we are currently in
	static Folder current = root

	// All folders, tracked for convenience
	static final List<Folder> folders = newArrayList(root)

	def static void main(String[] args) {

		// Treating the input file line by line, updating the file system on the fly
		new InputLoader(2022, 7).getInputs.forEach [
			// Ignoring prompts, which are noise
			val toProcess = it.startsWith("$") ? it.substring(2) : it
			// Splitting current line into its components
			val parts = toProcess.split(" ")
			// Deciding on what to do based on the first token on the line
			// Thankfully the grammar is LL(1)
			switch x : parts.get(0) {
				// Switching to the right place: the root, the parent or a subdir
				case "cd":
					current = switch destination : parts.get(1) {
						case "/": root
						case "..": current.parent
						default: current.content.get(destination)
					}
				// Ignoring "ls" as this is noise: what follows is part of current
				case "ls":
					return
				// Creating a directory (and assigning current as parent in the process)
				case "dir":
					folders.add(new Folder(parts.get(1), current))
				// Gathering the size of a file (the only relevant element)
				default:
					current.addSize(Integer.parseInt(x))
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

		// Creating a folder, and adding it to its parent's children
		new(String _name, Folder _parent) {
			parent = _parent
			size = 0
			content = newHashMap
			if(parent !== null) parent.content.put(_name, this)
		}

		// Updating the size of the folder as well as its ancestors recursively
		def void addSize(int toAdd) {
			size += toAdd
			if(parent !== null) parent.addSize(toAdd)
		}
	}
}
