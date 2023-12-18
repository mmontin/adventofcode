package advent2020.puzzle10;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import adventutils.collection.AgdaList;
import adventutils.input.InputLoader;

public class Launcher {
	public static void main(String[] args) throws IOException {
		List<Integer> input = new InputLoader(2020,10).getInputs().stream().map(x -> Integer.parseInt(x)).collect(Collectors.toList());
		input.sort(Comparator.naturalOrder());
		Distance d = new Distance(0,1) ;
		d.update(0, input.get(0));
		for (int i = 0; i < input.size() - 1; i++) d.update(input.get(i), input.get(i+1));
		System.out.println(d.result());
		System.out.println(new AgdaList<Integer>(input));
	}
	
	private static class Distance {
		int distance1 ;
		int distance3 ;
		
		public Distance(int d1, int d3) {
			distance1 = d1 ;
			distance3 = d3 ;
		}
		
		public void update(int v1, int v2) {
			int distance = v2 - v1 ;
			if (distance == 1) distance1 ++ ;
			else if (distance == 3) distance3 ++ ;
			else System.out.println("Autre chose");
		}
		
		public int result() {
			return distance1 * distance3 ;
		}
	}
}
