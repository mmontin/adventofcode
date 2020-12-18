package advent2020;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Utils {

	public static final String inputs = "/home/monsieuro/eclipse-workspace/advent2020/inputs/" ;
	
	public static List<String> getInputs(int inputNumber) throws IOException {
		return Files.readAllLines(Paths.get(Utils.inputs + "input" + inputNumber)) ;
	}
	
	public static class MyList<T> extends ArrayList<T> {

		private static final long serialVersionUID = 1L;

		public MyList() {
			super()	;
		}
		
		public MyList(List<T> l) {
			super(l) ;
		}
		
		public MyList(int numberOfLines) {
			super(numberOfLines) ;
		}

		@Override
		public String toString() {
			String s = "(" ;
			for (T t : this) s = s + t + " ∷ " ;
			return s + "[])" ;
		}
	}
}
