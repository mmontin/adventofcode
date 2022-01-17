package advent2020.puzzle7;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import adventutils.input.InputLoader;

public class Launcher {

	private static final Map<String, Bag> data = new HashMap<>();

	public static void main(String[] args) throws IOException {

		// Populating the data
		for (String s : new InputLoader(2020,7).getInputs()) {
			String[] split1 = s.split("bags contain");
			String color = split1[0].replaceAll("\\s+", "");
			Bag current = getBag(color);
			if (!split1[1].equals(" no other bags.")) {
				String[] split2 = split1[1].split(",");
				for (int i = 0; i < split2.length; i++) {
					String[] split3 = split2[i].split(" ");
					int occurrences = Integer.parseInt(split3[1]);
					current.addContains(occurrences, getBag(split3[2] + split3[3]));
				}
			}
		}

		// Retrieving the List of bags that can contain a shiny gold bag
		List<Bag> result = new ArrayList<>();
		data.get("shinygold").addToList(result);
		System.out.println(result.size() - 1);

		// Counting the number of bags contained in a shiny gold bag
		System.out.println(data.get("shinygold").numberOfBags() - 1);
	}

	private static Bag getBag(String color) {
		if (data.containsKey(color))
			return data.get(color);
		Bag b = new Bag();
		data.put(color, b);
		return b;
	}
}
