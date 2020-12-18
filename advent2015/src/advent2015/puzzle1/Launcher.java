package advent2015.puzzle1;

import java.io.IOException;

import advent2015.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		String s = Utils.getInputs(1).get(0) ;
		int i = 0 ;
		boolean printed = false ;
		for (int k = 0 ; k < s.length() ; k++) {
			if (s.charAt(k) == '(') i ++ ;
			else i -- ;
			if (i < 0 && !printed) {
				System.out.println(k+1) ;
				printed = true ;
			}
		}
		System.out.println(i);
	}
}
