package advent2020.puzzle3;

import java.io.IOException;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = new InputLoader(2020,3).getInputs();
		long un = collisions(1, 1, inputs) ;
		long deux = collisions(3, 1, inputs) ;
		long trois = collisions(5, 1, inputs) ;
		long quatre = collisions(7, 1, inputs) ;
		long cinq = collisions(1, 2, inputs) ;
		System.out.println(un + " ; " + deux + " ; " + trois + " ; " + quatre + " ; " + cinq);
		System.out.println(un * deux * trois * quatre * cinq);
	}

	private static List<Character> toCharList(String input) {
		List<Character> l = new CircularList<>();
		for (int i = 0; i < input.length(); i++)
			l.add(input.charAt(i));
		return l;
	}

	private static int collisions(int right, int down, List<String> field) {
		int trees = 0;
		int offset = -right;
		for (int i = 0; i < field.size(); i += down)
			if (toCharList(field.get(i)).get(offset += right) == '#')
				trees++;
		return trees;
	}
}
