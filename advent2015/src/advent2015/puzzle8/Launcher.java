package advent2015.puzzle8;

import java.io.IOException;

import advent2015.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {

		System.out.println(Utils.getInputs(8).stream().reduce(0, ((x , y) -> x + y.length() - numberOfChars(y.substring(1,y.length()-1),0)), Integer::sum));
		System.out.println(Utils.getInputs(8).stream().reduce(0, ((x , y) -> x + toAdd(y)), Integer::sum));
	}
	
	public static int numberOfChars(String s, int current) {
		if (s.equals("")) return current ;
		if (s.startsWith("\\\"") || s.startsWith("\\\\")) return numberOfChars(s.substring(2),current+1) ;
		else if (s.length() >= 4 && s.substring(0, 4).startsWith("\\x")) return numberOfChars(s.substring(4),current+1) ;
		else return numberOfChars(s.substring(1), current+1) ;
	}
	
	public static int numberOf(String s, char c) {
		int sum = 0;
		for (char ch : s.toCharArray()) if (c == ch) sum ++ ;
		return sum ;
	}
	
	public static int toAdd(String s) {
		return 2 + numberOf(s, '\\') + numberOf(s, '"') ;
	}
}
