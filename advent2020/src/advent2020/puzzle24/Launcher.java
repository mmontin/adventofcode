package advent2020.puzzle24;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import advent2020.Utils;

public class Launcher {

	static Map<Coordinate,Tile> tiles = new HashMap<>() ;
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = Utils.getInputReader(24) ;
		String line ;
		while ((line = br.readLine()) != null)
			tiles.merge(new Coordinate(line), new Tile(false), ((x , y) -> x.flip())) ;
		
		System.out.println(0 + " : " + tiles.values().stream().reduce(0, ((x , y) -> x + (y.isWhite() ? 0 : 1)), Integer::sum));
		
		step(true) ;

		for (int i = 0 ; i < 100 ; i++) {
			step(false) ;
			System.out.println((i + 1) + " : " + tiles.values().stream().reduce(0, ((x , y) -> x + (y.isWhite() ? 0 : 1)), Integer::sum));
		}
	}
	
	private static void step(boolean isInit) {
		Map<Coordinate,Tile> newTiles = new HashMap<>() ;
		for (Entry<Coordinate, Tile> e : tiles.entrySet()) {
			boolean color = isInit ? e.getValue().isWhite() : e.getValue().getNextColor() ;
			Coordinate c = e.getKey() ;
			newTiles.merge(c, new Tile(color), ((x , y) -> x.setColor(color))) ;
			if (!color)
				for (int i : new int[] {-1 , 1})
					for (int j : new int[] {-1 , 0 , 1} )
						newTiles.merge(new Coordinate(c.x + i, c.y + j), new Tile(true , 1), ((x , y) -> x.addBlackNeighbour())) ;
		}
		tiles = newTiles ;
	}
}