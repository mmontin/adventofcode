package advent2020.puzzle25;

import java.io.IOException;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	private final static int subjectNb = 7 ;
	
	public static void main(String[] args) throws IOException {
		List<String> l = new InputLoader(2020,25).getInputs() ;
		
		int cardKey = Integer.parseInt(l.get(0)) ;
		int doorKey = Integer.parseInt(l.get(1)) ;
		
		int cardLoopSize = findLoopSize(cardKey);
		int doorLoopSize = findLoopSize(doorKey);
		
		System.out.println(cardLoopSize + " " + doorLoopSize) ;
		
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
