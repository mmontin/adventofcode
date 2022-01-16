package advent2015.puzzle14;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		
		List<Deer> deers = new ArrayList<>() ;
		
		for (String s : new InputLoader(2015,14).getInputs()) {
			String[] split = s.split(" ") ;
			deers.add(new Deer(split[0], split[3], split[6], split[13])) ;
		}
		
		int[] points = new int[deers.size()] ;
		for (int i = 0 ; i < points.length ; i++) points[i] = 0 ;
		
		for (int i = 1 ; i <= 2503 ; i++) {
			List<Integer> bests = new ArrayList<>() ;
			int max = 0 ;
			for (int j = 0 ; j < deers.size() ; j++) {
				int score = deers.get(j).positionAt(i) ;
				if (score == max) {
					bests.add(j) ;
				} else if (score > max) {
					bests.clear();
					bests.add(j);
					max = score ;
				}
			}
			for (Integer b : bests)	points[b] ++ ;
		}
		
		int max = 0 ;
		for (int i = 0 ; i < points.length ; i++) 
			if (points[i] > max) max = points[i] ;
		
		System.out.println(max);
	}
	
	private static class Deer {
		private String name ;
		private int speed ;
		private int flightDuration ;
		private int restDuration ;
		
		public Deer(String name_, String speed_, String flightDuration_, String restDuration_) {
			this.name = name_ ;
			this.speed = Integer.parseInt(speed_) ;
			this.flightDuration = Integer.parseInt(flightDuration_) ;
			this.restDuration = Integer.parseInt(restDuration_) ;
		}
		
		public int positionAt(int second) {
			int cycleDuration = flightDuration + restDuration ;
			int nbOfCycles = second / cycleDuration ;
			int excess = second % cycleDuration ;
			int cycleDistance = speed * flightDuration ;
			return nbOfCycles * cycleDistance + (excess >= flightDuration ? cycleDistance : excess * speed) ;
		}
		
		@Override
		public String toString() {
			return name ;
		}
	}
}
