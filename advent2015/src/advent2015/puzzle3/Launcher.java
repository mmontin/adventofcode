package advent2015.puzzle3;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import advent2015.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		String s = Utils.getInputs(3).get(0) ;
		
		System.out.println(s.length());
		
		Pair santa = new Pair(0 , 0) ;
		Pair robot = new Pair(0 , 0) ;
		
		Pair current = santa ;
		
		List<Pair> pairs = new ArrayList<>() ;
		pairs.add(new Pair(santa)) ;
		
		for (char c : s.toCharArray()) {
			current.update(c);
			if (!pairs.contains(current)) pairs.add(new Pair(current)) ;
			if (current == santa) current = robot ;
			else current = santa ;
		}
		System.out.println(pairs.size());
	}

	private static class Pair {
		int x ;
		int y ;
		
		public Pair(int x, int y) {
			super();
			this.x = x;
			this.y = y;
		}
		
		public Pair(Pair p) {
			this(p.x , p.y) ;
		}
		
		public void update(char c) {
			switch (c) {
			case '<' :
				x -- ;
				break ;
			case '>' :
				x ++ ;
				break ;
			case 'v' :
				y -- ;
				break ;
			default :
				y ++ ;
			}
		}
		
		@Override
		public boolean equals(Object o) {
			Pair p = (Pair)o ;
			return x == p.x && y == p.y ;
		}
		
		@Override
		public int hashCode() {
		    return x + y;
		}
	}
}
