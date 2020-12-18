package advent2020.puzzle15;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import advent2020.Utils;

public class Launcher {

	private static Map<Integer,Queue> turns = new HashMap<>() ;
	private static Integer first ;
	private static Integer last ;
	private static Integer turnNumber = 1 ;
	
	public static void main(String[] args) throws IOException {
		String[] input = Utils.getInputs(15).get(0).split(",");
		for (int i = 0 ; i < input.length ; i++) {
			Integer val = Integer.parseInt(input[i]) ;
			if (i == 0) first = val ;
			turns.put(val, new Queue(turnNumber)) ;
			last = val ;
			turnNumber++ ;
		}
		
		while (turnNumber <= 30000000) {
			Queue q = turns.get(last) ;
			Integer newLast = q.notOnlyOnce() ? q.diff() : first ;
			updateTurns(newLast, turnNumber ++) ;
			last = newLast ;
		}
		
		System.out.println(last);
	}
	
	public static void updateTurns(Integer val, Integer turnNumber) {
		Queue q = turns.get(val) ;
		if (q == null)
			turns.put(val, new Queue(turnNumber)) ;
		else 
			turns.put(val, q.update(turnNumber)) ;
	}
	
	private static class Queue {
		
		private Integer u = null;
		private Integer v = null;
		
		public Queue(Integer val) {
			this.update(val);
		}
		
		public Queue update(Integer val) {
			u = v ;
			v = val ;
			return this ;
		}
		
		public boolean notOnlyOnce() {
			return u != null ;
		}
		
		@Override
		public String toString() {
			return "[ " + u + " , " + v + " ]";
		}
		
		public Integer diff() {
			return v - u ;
		}
	}
}
