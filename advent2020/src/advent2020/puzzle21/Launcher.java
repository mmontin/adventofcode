package advent2020.puzzle21;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import advent2020.Utils;

public class Launcher {

	private static Map<String, Set<String>> possibleAllergens = new HashMap<>();
	private static Map<String, Integer> allIngredients = new HashMap<>();

	public static void main(String[] args) throws IOException {

		BufferedReader br = Utils.getInputReader(21);
		String line;
		while (!((line = br.readLine()) == null)) {
			String[] split = line.split(" \\(contains ");
			String[] ingredients = split[0].split(" ");
			String[] allergens = split[1].substring(0, split[1].length() - 1).split(", ");
			updatePossibleAllergens(ingredients, allergens);
		}

		Set<String> possibleIngredients = new HashSet<>();
		for (Set<String> s : possibleAllergens.values())
			possibleIngredients.addAll(s);

		int occurrences = 0;
		for (Entry<String, Integer> e : allIngredients.entrySet())
			if (!possibleIngredients.contains(e.getKey()))
				occurrences += e.getValue();

		System.out.println(occurrences);

		List<String> allergens = new ArrayList<>(possibleAllergens.keySet());
		while (allergens.size() != 0) {
			String s = allergens.remove(0);
			if (possibleAllergens.get(s).size() == 1) {
				for (String other : allergens) {
					if (!s.equals(other)) {
						possibleAllergens.get(other).remove(possibleAllergens.get(s).iterator().next()) ;
					}
				}
			} else {
				allergens.add(s) ;
			}
		}
		
		allergens = new ArrayList<>(possibleAllergens.keySet()) ;
		allergens.sort(Comparator.naturalOrder());
		
		String answer = "" ;
		for (int i = 0 ; i < allergens.size() ; i++)
			answer += possibleAllergens.get(allergens.get(i)).iterator().next() + "," ;
		answer = answer.substring(0,answer.length()-1) ;
		System.out.println(answer);
	}

	private static void updatePossibleAllergens(String[] ingredients, String[] allergens) {
		for (String s : ingredients)
			allIngredients.merge(s, 1, Integer::sum);
		for (String a : allergens)
			possibleAllergens.merge(a, new HashSet<>(Arrays.asList(ingredients)), Launcher::intersection);
	}

	private static Set<String> intersection(Set<String> s1, Set<String> s2) {
		s1.retainAll(s2);
		return s1;
	}
}
