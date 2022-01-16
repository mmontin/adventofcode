package advent2015.puzzle9;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import adventutils.input.InputLoader;

public class Launcher {

	static Map<Pair,Integer> distances = new HashMap<>() ;
	
	public static void main(String[] args) throws IOException {
		
		for (String s : new InputLoader(2015,9).getInputs()) {
			String[] split = s.split(" ") ;
			distances.put(new Pair(Integer.parseInt(split[0]), Integer.parseInt(split[1])), Integer.parseInt(split[2])) ;
		}

		System.out.println(distances.size());
		List<Integer> peaks = new ArrayList<Integer>() ;
		for (int i = 1 ; i <= 8 ; i++) peaks.add(i) ;
		System.out.println(length(0, peaks));
	}
	
	private static List<Integer> removeAt(int index, List<Integer> input) {
		List<Integer> output = new ArrayList<>() ;
		for (int i = 0 ; i < input.size() ; i++) if (i != index) output.add(input.get(i)) ;
		return output ;
	}
	
	private static Integer length(Integer current, List<Integer> toVisit) {
		if (toVisit.size() == 0) return 0 ;
		
		int zero = toVisit.get(0) ;
		int ans = length(zero, removeAt(0,toVisit)) + distances.get(new Pair(current, zero));
		
		for (int i = 0 ; i < toVisit.size() ; i++) {
			zero = toVisit.get(i) ;
			ans = Math.max(ans, length(zero, removeAt(i, toVisit)) + distances.get(new Pair(current, zero))) ;
		}
		
		return ans ;
	}
	
	private static class Pair {
		
		int x ;
		int y ;
		
		public Pair(int x, int y) {
			this.x = x ;
			this.y = y ;
		}
		
		@Override
		public boolean equals(Object o) {
			Pair other = (Pair)o ;
			return (other.x == x && other.y == y) || (other.x == y && other.y == x) ;
		}

		@Override
		public int hashCode() {
			return x * y ;
		}
		
		@Override
		public String toString() {
			return "[ " + x + " , " + y + " ]" ;
		}
	}
}
