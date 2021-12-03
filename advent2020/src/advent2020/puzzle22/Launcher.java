package advent2020.puzzle22;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import advent2020.Utils;

public class Launcher {

	static List<Integer> joueur1 = new ArrayList<Integer>() ;
	static List<Integer> joueur2 = new ArrayList<Integer>() ;

	
	public static void main(String[] args) throws IOException {
		BufferedReader br = Utils.getInputReader(22) ;
		br.readLine() ;
		String line ;
		while (!(line = br.readLine()).isBlank())
			joueur1.add(Integer.parseInt(line)) ;
		br.readLine() ;
		while (!(line = br.readLine()).isBlank())
			joueur2.add(Integer.parseInt(line)) ;
		br.close();
		System.out.println("joueur1 = " + new Utils.MyList<>(joueur1));
		System.out.println("joueur2 = " + new Utils.MyList<>(joueur2));
	}
}
