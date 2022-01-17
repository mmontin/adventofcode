package advent2020.puzzle22;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import adventutils.input.InputLoader;
import adventutils.list.AgdaList;

public class Launcher {

	static List<Integer> joueur1 = new ArrayList<Integer>() ;
	static List<Integer> joueur2 = new ArrayList<Integer>() ;

	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new InputLoader(2020,22).getInputReader() ;
		br.readLine() ;
		String line ;
		while (!(line = br.readLine()).isBlank())
			joueur1.add(Integer.parseInt(line)) ;
		br.readLine() ;
		while (!(line = br.readLine()).isBlank())
			joueur2.add(Integer.parseInt(line)) ;
		br.close();
		System.out.println("joueur1 = " + new AgdaList<>(joueur1));
		System.out.println("joueur2 = " + new AgdaList<>(joueur2));
	}
}
