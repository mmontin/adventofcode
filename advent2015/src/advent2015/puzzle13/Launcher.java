package advent2015.puzzle13;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import adventutils.input.InputLoader;

public class Launcher {

	private static Map<String, Map<String, Integer>> relations = new HashMap<>();

	public static void main(String[] args) throws IOException {

		for (String s : new InputLoader(2015, 13).getInputs()) {
			String[] split = s.split(" ");
			String name = split[0];
			Integer value = Integer.parseInt(split[3]);
			if (split[2].equals("lose"))
				value = -value;
			String target = split[10].split("\\.")[0];
			if (!relations.containsKey(name))
				relations.put(name, new HashMap<>());
			relations.get(name).put(target, value);
		}
		
		Set<String> others = relations.keySet() ;
		Map<String,Integer> myRels = new HashMap<>() ;
		relations.put("Mathieu", myRels) ;
		for (String s : others) {
			myRels.put(s, 0);
			relations.get(s).put("Mathieu", 0) ;
		}

		List<List<String>> perms = generatePerm(new ArrayList<>(relations.keySet())) ;
		System.out.println(perms.stream().reduce(0, ((x , y) -> Math.max(x , getTotalHappiness(y))), Math::max)) ;
	}

	public static int getTotalHappiness(List<String> members) {
		int total = 0;
		for (int i = 0; i < members.size(); i++) {
			int next = i == members.size() - 1 ? 0 : i + 1;
			total += relations.get(members.get(i)).get(members.get(next));
			total += relations.get(members.get(next)).get(members.get(i));
		}
		return total;
	}

	public static <E> List<List<E>> generatePerm(List<E> original) {
		if (original.isEmpty()) {
			List<List<E>> result = new ArrayList<>();
			result.add(new ArrayList<>());
			return result;
		}
		E firstElement = original.remove(0);
		List<List<E>> returnValue = new ArrayList<>();
		List<List<E>> permutations = generatePerm(original);
		for (List<E> smallerPermutated : permutations) {
			for (int index = 0; index <= smallerPermutated.size(); index++) {
				List<E> temp = new ArrayList<>(smallerPermutated);
				temp.add(index, firstElement);
				returnValue.add(temp);
			}
		}
		return returnValue;
	}
}
