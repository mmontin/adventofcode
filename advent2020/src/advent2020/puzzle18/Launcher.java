package advent2020.puzzle18;

import java.io.IOException;
import java.util.List;

import advent2020.Utils;
import advent2020.Utils.MyList;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<List<String>> inputs = new MyList<>();
		for (String s : Utils.getInputs(18)) inputs.add(getStringsFromString(s));
		System.out.println(inputs);
	}

	public static List<String> getStringsFromString(String s) {
		List<String> output = new MyList<String>();
		for (char c : s.toCharArray()) {
			switch (c) {
			case '(': output.add("LPAR") ; break ;
			case ')': output.add("RPAR"); break ;
			case '+': output.add("OP PLUS"); break ;
			case '*': output.add("OP MULT"); break ;
			case ' ': continue ;
			default : output.add("NB " + c);
			}
		}
		return output;
	}
}
