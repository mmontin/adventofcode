package advent2015.puzzle2;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import advent2015.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = Utils.getInputs(2) ;
		System.out.println(inputs.stream().reduce(0, ((x , y) -> x + compute(y)), Integer::sum)) ;
	}

	private static Integer compute(String y) {
		String[] split = y.split("x") ;
		List<Integer> values = new ArrayList<>() ;
		values.add(Integer.parseInt(split[0])) ;
		values.add(Integer.parseInt(split[1])) ;
		values.add(Integer.parseInt(split[2])) ;
		values.sort(Comparator.naturalOrder());
		// return 3 * values.get(0) * values.get(1) + 2 * values.get(1) * values.get(2) + 2 * values.get(2) * values.get(0);
		return 2 * values.get(0) + 2 * values.get(1) + values.get(2) * values.get(1) * values.get(0);
	}
}
