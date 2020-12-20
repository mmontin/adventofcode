package advent2020.puzzle20;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import advent2020.Utils;

public class Launcher {

	private static Map<String,Integer> borders = new HashMap<>() ;
	
	public static void main(String[] args) throws IOException {
		
		BufferedReader br = Utils.getInputReader(20) ;
		
		List<Tile> tiles = new ArrayList<Tile>() ;
		
		String currentLine ;
		List<String> lines = new ArrayList<>() ;
		while (!((currentLine = br.readLine()) == null)) {
			if (currentLine.isBlank()) {
				tiles.add(new Tile(lines).register(borders)) ;
				lines.clear();
			} else
				lines.add(currentLine) ;
		}
		
		// Building neighbours
		for (int i = 0 ; i < tiles.size() ; i++)
			for (int j = i+1 ; j < tiles.size() ; j++)
				if (tiles.get(i).matchesAny(tiles.get(j))) tiles.get(i).addNeighbour(tiles.get(j));
		
		for (Tile t : tiles) System.out.println(t.getNumberOfNeighbours());
				
		Tile[][] jigsaw = new Tile[12][] ;
		for (int i = 0 ; i < 12 ; i++) jigsaw[i] = new Tile[12] ;
	}
}
