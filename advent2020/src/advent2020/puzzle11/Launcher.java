package advent2020.puzzle11;

import java.io.IOException;
import java.util.List;

import advent2020.Utils;
import advent2020.Utils.MyList;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = Utils.getInputs(11);
		int numberOfLines = inputs.size() ;
		int numberOfColumns = inputs.get(0).length() ;
		List<List<Seat>> seats = new MyList<List<Seat>>(numberOfLines) ;
		for (String s : inputs) seats.add(stringToSeats(s)) ;
		System.out.println("line : " + numberOfLines);
		System.out.println("columns : " + numberOfColumns);
		System.out.println(seats);
	}
	
	private static List<Seat> stringToSeats(String s) {
		int length = s.length() ;
		List<Seat> seats = new MyList<Seat>(length) ;
		for (int i = 0 ; i < length ; i++) seats.add(Seat.fromChar(s.charAt(i))) ;
		return seats ;
	}
	
	private static enum Seat {
		NOTHING,
		EMPTY,
		TAKEN ;
		
		public static Seat fromChar(char c) {
			switch (c) {
			case '#' :
				return TAKEN ;
			case '.' :
				return NOTHING ;
			default :
				return EMPTY ;
			}
		}
	}
}
