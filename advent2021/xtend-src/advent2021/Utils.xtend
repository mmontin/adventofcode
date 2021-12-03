package advent2021

import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.nio.file.Files
import java.nio.file.Paths
import java.util.ArrayList
import java.util.List
import org.eclipse.xtext.xbase.lib.Functions.Function1

class Utils {
	
	public static final String inputs = "/media/monsieuro/Mes Données/Eclipse/adventofcode/advent2021/inputs/"
		
	def static getInputs(int inputNumber) {
		Files.readAllLines(Paths.get(inputs + inputNumber))
	}
	
	def static<T> List<T> getInputs(int inputNumber, Function1<? super String, ? extends T> f) {
		getInputs(inputNumber).map[x | f.apply(x)]
	}
	
	def static getInputReader(int inputNumber) {
		new BufferedReader(new FileReader(new File(inputs + inputNumber)))
	}
	
	static class MyList<T> extends ArrayList<T> {

		override toString() {
			'(' + this.map[x | x.toString.concat(" ∷ ")].fold("")[x , y | x.concat(y)] + "[])"
		}
	}
}