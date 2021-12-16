package advent2020.puzzle25;

import java.io.IOException;
import java.util.List;

import advent2020.Utils;

public class Launcher {

	private final static int subjectNb = 7 ;
	
	public static void main(String[] args) throws IOException {
		List<String> l = Utils.getInputs(25) ;
		
		int cardKey = Integer.parseInt(l.get(0)) ;
		int doorKey = Integer.parseInt(l.get(1)) ;
		
		int cardLoopSize = findLoopSize(cardKey);
		int doorLoopSize = findLoopSize(doorKey);
	}

	private static int findLoopSize(int k) {
		int x = 1 ;
		int nb = 0 ;
		while (x != k) {
			x = (x * subjectNb) % 20201227 ;
			nb ++ ;
		}
		return nb ;
	}
}
