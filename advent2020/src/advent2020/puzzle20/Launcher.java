package advent2020.puzzle20;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import advent2020.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		
		BufferedReader br = Utils.getInputReader(20) ;
		
		// Building the tiles
		List<Tile> tiles = new ArrayList<Tile>() ;
		String currentLine ;
		List<String> lines = new ArrayList<>() ;
		while (!((currentLine = br.readLine()) == null)) {
			if (currentLine.isBlank()) {
				tiles.add(new Tile(lines)) ;
				lines.clear();
			} else
				lines.add(currentLine) ;
		}
		
		// Building neighbours
		for (int i = 0 ; i < tiles.size() ; i++)
			for (int j = i+1 ; j < tiles.size() ; j++) {
				String border = tiles.get(i).matchesAny(tiles.get(j)) ;
				if (border != null) tiles.get(i).addNeighbour(tiles.get(j), border);
			}

		Tile starter = null;
		for (Tile t : tiles)
			if (t.getNumberOfNeighbours() == 2) {
				starter = t ;
				break ;
			}
		starter.initializeSouth();

		System.out.println(starter);
		System.out.println(starter.getSouthNeighbour());
		System.out.println(starter.getEastNeighbour());
		System.out.println(starter.getNorthNeighbour());
		System.out.println(starter.getWestNeighbour());
		
//		Tile[][] jigsaw = new Tile[12][] ;
//		for (int i = 0 ; i < 12 ; i++) jigsaw[i] = new Tile[12] ;
//		jigsaw[0][0] = starter ;
//		for (int i = 1 ; i < 9 ; i++) {
//			jigsaw[0][i] = jigsaw[0][i-1].getEastNeighbour() ;
//		}
//		for (int i = 1 ; i < 9 ; i++) {
//			for (int j = 0 ; j < 9 ; j++) {
//				jigsaw[i][j] = jigsaw[i-1][j].getSouthNeighbour() ;
//			}
//		}
	}
}
