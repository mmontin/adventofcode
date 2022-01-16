package advent2015.puzzle6;

import java.io.IOException;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {

		int[][] data = new int[1000][];
		for (int i = 0; i < 1000; i++) {
			data[i] = new int[1000];
			for (int j = 0; j < 1000; j++)
				data[i][j] = 0;
		}

		List<String> inputs = new InputLoader(2015,6).getInputs();

		for (String s : inputs) {
			String[] split = s.split(" through ");
			String[] split2 = split[1].split(",");
			int i2 = Integer.parseInt(split2[0]);
			int j2 = Integer.parseInt(split2[1]);
			TODO todo;
			String[] split3;
			if (split[0].startsWith("toggle")) {
				todo = TODO.TOGGLE;
				split3 = split[0].split("toggle ")[1].split(",");
			} else {
				if (split[0].startsWith("turn on")) todo = TODO.TON;
				else todo = TODO.TOFF ;
				split3 = split[0].split(" ")[2].split(",");
			}
			int i1 = Integer.parseInt(split3[0]);
			int j1 = Integer.parseInt(split3[1]);
			process(i1, i2, j1, j2, todo, data);
		}
		
		int count = 0 ;
		
		for (int i = 0; i < 1000; i++)
			for (int j = 0; j < 1000; j++)
				count += data[i][j] ;
		
		System.out.println(count);
	}

	private static void process(int i1, int i2, int j1, int j2, TODO todo, int[][] data) {
		for (int i = i1; i <= i2; i++)
			for (int j = j1; j <= j2; j++)
				data[i][j] = todo == TODO.TON ? data[i][j] + 1 : (todo == TODO.TOFF ? Math.max(0, data[i][j] - 1) : data[i][j] + 2);
	}

	private static enum TODO {
		TOGGLE, TON, TOFF;
	}
}
