package advent2020.puzzle2;

import java.io.IOException;
import java.util.List;

import advent2020.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = Utils.getInputs(2) ;
		int result = 0 ;
		for (String input : inputs)
			if (process(input)) result++ ;
		System.out.println(result);
	}

	private static boolean process(String input) {
		String[] inputSplit = input.split(" ") ;
		String[] boundaries = inputSplit[0].split("-") ;
		long min = Long.parseLong(boundaries[0]) ;
		long max = Long.parseLong(boundaries[1]) ;
		char letter = inputSplit[1].charAt(0) ;
		return processString(min-1, max-1, letter, inputSplit[2]) ;
	}

	private static boolean processString(long min, long max, char letter, String string) {
//		long occurrences = string.chars().filter(ch -> ch == letter).count() ;
//		return min <= occurrences && occurrences <= max ;
		return string.charAt((int)min) == letter ^ string.charAt((int)max) == letter ;
	}
}
