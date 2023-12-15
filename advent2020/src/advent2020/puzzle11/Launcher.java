package advent2020.puzzle11;

import java.io.IOException;
import java.util.List;

import adventutils.input.InputLoader;
import adventutils.collection.AgdaList;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = new InputLoader(2020,11).getInputs();
		int numberOfLines = inputs.size() ;
		int numberOfColumns = inputs.get(0).length() ;
		List<List<Seat>> seats = new AgdaList<List<Seat>>(numberOfLines) ;
		for (String s : inputs) seats.add(stringToSeats(s)) ;
		System.out.println("line : " + numberOfLines);
		System.out.println("columns : " + numberOfColumns);
		System.out.println(seats);
	}
	
	private static List<Seat> stringToSeats(String s) {
		int length = s.length() ;
		List<Seat> seats = new AgdaList<Seat>(length) ;
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
