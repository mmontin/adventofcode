package adventutils.input

import adventutils.geometry.Coordinate
import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.nio.file.Files
import java.nio.file.Paths
import org.eclipse.xtext.xbase.lib.Functions.Function1
import org.eclipse.xtext.xbase.lib.Functions.Function2

class InputLoader {

	String path

	new(Integer year, Integer day) {
		path = "/home/monsieuro/adventofcode/advent" + year + "/inputs/" + day
	}

	def getInputs() {
		Files.readAllLines(Paths.get(path))
	}

	def getChars() {
		getChars[it]
	}

	def <T> getChars(Function1<? super String, ? extends T> f) {
		inputs.map[toCharArray.map[f.apply(it + "")]]
	}

	def <T> getInputs(Function1<? super String, ? extends T> f) {
		inputs.map[f.apply(it)]
	}

	def getInputReader() {
		new BufferedReader(new FileReader(new File(path)))
	}

	def <T> applyOnGrid(Function2<? super String, Coordinate, T> f) {
		val input = getChars
		val max_i = input.size - 1
		val max_j = input.get(0).size - 1
		for (i : 0 .. max_i) {
			val line = input.get(i)
			for (j : 0 .. max_j)
				f.apply(line.get(j), new Coordinate(i, j))
		}
	}
}
