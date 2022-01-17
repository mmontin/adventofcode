package advent2020.puzzle6;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		int total = 0;
		boolean first = true;
		Set<Character> set = new HashSet<>();
		for (String s : new InputLoader(2020,6).getInputs()) {
			if (s.isBlank()) {
				total += set.size();
				set.clear();
				first = true;
			} else {
				List<Character> temp = new ArrayList<>();
				for (int i = 0; i < s.length(); i++)
					temp.add(s.charAt(i));
				if (first)
					first = !set.addAll(temp);
				else
					set.removeIf(x -> !temp.contains(x));
			}
		}
		System.out.println(total += set.size());
	}
}
