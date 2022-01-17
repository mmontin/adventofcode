package advent2020.puzzle5;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<String> inputs = new InputLoader(2020,5).getInputs();
		List<Integer> ids = new ArrayList<>() ;
		for (String s : inputs) ids.add(process(s)) ;
		Collections.sort(ids);
		List<Integer> possIds = new ArrayList<>() ;
		for (int i = 0; i < 127; i++) for (int j = 0; j < 7; j++) possIds.add(i * 8 + j) ;
		Collections.sort(possIds);
		System.out.println(ids);
		System.out.println(possIds);
		possIds.removeAll(ids) ;
		System.out.println(possIds);
	}

	private static int process(String s) {
		int row_min = 0 ;
		int row_max = 127 ;
		for (int i = 0; i < 7; i++) {
			int half = (row_max - row_min + 1) / 2 ;
			if (s.charAt(i) == 'F') {
				row_max -= half ; 
			} else {
				row_min += half ;
			}
		}
		int col_min = 0 ;
		int col_max = 7 ;
		for (int i = 7; i < 10; i++) {
			int half = (col_max - col_min + 1) / 2 ;
			if (s.charAt(i) == 'L') {
				col_max -= half ; 
			} else {
				col_min += half ;
			}
		}
		if (row_min != row_max || col_min != col_max) System.out.println(s);
		return row_max * 8 + col_max ;
	}
}
