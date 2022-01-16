package advent2015.puzzle5;

import java.io.IOException;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = new InputLoader(2015,5).getInputs();
		int count = 0;
		for (String s : inputs) {
//			char previous = '0';
//			int voyels = 0;
//			boolean doubleLetter = false;
//			boolean badLetters = false;
//			for (int i = 0; i < s.length(); i++) {
//				char current = s.charAt(i);
//				if (current == 'a' || current == 'e' || current == 'i' || current == 'o' || current == 'u')
//					voyels++;
//				if (i != 0) {
//					if (current == previous)
//						doubleLetter = true;
//					if (previous == 'a' && current == 'b' || previous == 'c' && current == 'd'
//							|| previous == 'p' && current == 'q' || previous == 'x' && current == 'y')
//						badLetters = true;
//				}
//				previous = current ;
//			}
//			if (voyels >= 3 && doubleLetter && !badLetters) count ++ ;
			count += checkString(s) ;
		}
		System.out.println(count);
	}

	private static int checkString(String s) {
		boolean sandwich = false ;
		for (int i = 1 ; i < s.length() - 1 ; i++) {
			if (s.charAt(i-1) == s.charAt(i+1)) {
				sandwich = true ;
				break ;
			}
		}
		boolean duplet = false ;
		for (int i = 0; i < s.length() - 1; i++) {
			String s1 = s.substring(0, i) ;
			String s2 = s.substring(i , i + 2) ;
			String s3 = i < s.length() - 2 ? s.substring(i + 2, s.length() - 1) : "";
			if (s1.contains(s2) || s3.contains(s2)) {
				duplet = true ;
				break ;
			}
		}
		return sandwich && duplet ? 1 : 0 ;
	}
}
