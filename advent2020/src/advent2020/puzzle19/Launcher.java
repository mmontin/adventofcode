package advent2020.puzzle19;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class Launcher {

	public static Map<Integer,Rule> rules = new HashMap<>() ;
	private static BufferedReader br ;
	private static List<String> inputRules = new ArrayList<>() ;
	public static List<String> inputValues = new ArrayList<>() ;
	
	static {
		try {
			String currentLine ;
			br = new BufferedReader(new FileReader("/home/monsieuro/adventofcode/advent2020/inputs/input19")) ;
			while (!(currentLine = br.readLine()).isEmpty()) inputRules.add(currentLine) ;
			while (!(currentLine = br.readLine()).isEmpty()) inputValues.add(currentLine) ;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static int newAvailableNumber = inputRules.size() ;

	public static void main(String[] args) {
		for (String s : inputRules) {
			String[] split1 = s.split(": ") ;
			addToRules(Integer.parseInt(split1[0]), split1[1]) ;
		}

		// Resolving stubs until no more progress can be made
		List<Rule> lrules = new ArrayList<>(rules.values()) ;
		int nbOfTries = 0 ;
		while (nbOfTries < lrules.size()) {
			Rule r = lrules.remove(0) ;
			if (!r.resolve(rules)) {
				lrules.add(r) ;
				nbOfTries ++ ;
			} else 
				nbOfTries = 0 ;
		}
		
		for (Entry<Integer,Rule> rule : rules.entrySet())
			if (rule.getValue().isStub())
				System.out.println(rule.getKey() + " -> " + rule.getValue());
		
//		Checking valid strings (PART 1)
		
//		String rule0 = rules.get(0).getRegularExpression() ;
//		int numberOfValid = 0 ;
//		for (String s : inputValues)
//			numberOfValid += s.matches(rule0) ? 1 : 0 ;
//		System.out.println(numberOfValid);
		
		// PART 2
		int nb = 0 ;
		for (String s : inputValues) {
			if (Parser.parse(s)) nb++ ;
		}
		System.out.println(nb);
	}

	private static String addToRules(Integer number, String s) {
		Rule r ;
		if (s.contains("|")) {
			String[] split = s.split(" \\| ") ;
			
			String[] left = split[0].split(" ") ;
			boolean leftUnique = left.length == 1;

			String[] right = split[1].split(" ") ;
			boolean rightUnique = right.length == 1;
			
			String leftNumber = leftUnique ? left[0] : addToRules(null, split[0]);
			String rightNumber = rightUnique ? right[0] : addToRules(null, split[1]);
			r = new DecisionRule(leftNumber, rightNumber) ;
		} else {
			String[] split = s.split(" ");
			switch (split.length) {
			case 1 :
				r = new UnaryRule(split[0].replace("\"", "")) ;
				break ;
			case 2 :
				r = new SequenceRule(split[0], split[1]) ;
				break ;
			default : // split.length == 3
				r = new SequenceRule(split[0], addToRules(null, split[1] + " " + split[2])) ;
			}
		}
		Integer i = number == null ? newAvailableNumber++ : number ;
		rules.put(i, r) ;
		return "" + i ;
	}
}
