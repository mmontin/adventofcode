package advent2020.puzzle1;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<Integer> inputs = new InputLoader(2020,1).getInputs().stream()
				.map(s -> Integer.valueOf(s)).collect(Collectors.toList());
		for (int i = 0; i < inputs.size(); i++)
			for (int j = i + 1; j < inputs.size(); j++)
				for (int k = j + 1; k < inputs.size(); k++)
					if (inputs.get(i) + inputs.get(j) + inputs.get(k) == 2020)
						System.out.println(inputs.get(i) * inputs.get(j) * inputs.get(k));
	}
}