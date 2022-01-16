package adventutils.input

import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.nio.file.Files
import java.nio.file.Paths
import org.eclipse.xtext.xbase.lib.Functions.Function1

class InputLoader {
	
	String path
	
	new(Integer year, Integer day) {
		path = "/home/monsieuro/adventofcode/advent" + year + "/inputs/" + day
	}
	
	def getInputs() {
		Files.readAllLines(Paths.get(path))
	}
	
	def <T> getInputs(Function1<? super String, ? extends T> f) {
		getInputs().map[x | f.apply(x)]
	}
	
	def getInputReader() {
		new BufferedReader(new FileReader(new File(path)))
	}
}