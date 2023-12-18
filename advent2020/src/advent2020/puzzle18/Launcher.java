package advent2020.puzzle18;

import java.io.IOException;
import java.util.List;

import adventutils.collection.AgdaList;
import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<List<String>> inputs = new AgdaList<>();
		for (String s : new InputLoader(2020,18).getInputs()) inputs.add(getStringsFromString(s));
		System.out.println(inputs);
	}

	public static List<String> getStringsFromString(String s) {
		List<String> output = new AgdaList<String>();
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
