package advent2020.puzzle20;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import adventutils.input.InputLoader;

public class Launcher {

	public static List<Tile> tiles = new ArrayList<>() ;
	public static Map<Integer,Set<Integer>> adjacency = new HashMap<>() ;
	
	public static void main(String[] args) throws IOException {
		
		BufferedReader br = new InputLoader(2020,20).getInputReader() ;
		
		// Building the tiles
		String currentLine ;
		List<String> lines = new ArrayList<>() ;
		while (((currentLine = br.readLine()) != null)) {
			if (currentLine.isEmpty()) {
				tiles.add(new Tile(lines)) ;
				lines.clear();
			} else
				lines.add(currentLine) ;
		}

		// Building adjacencies
		for (int i = 0 ; i < tiles.size() ; i++)
			for (int j = i+1 ; j < tiles.size() ; j++)
				if (tiles.get(i).matchesAny(tiles.get(j)))
					inprintAdjacency(i, j);

		// Computing the first result by multiplying the ids of the 4 corners together
		// Corners are the only tiles with only 2 neighbors
		long res1 = 1 ;
		for (Entry<Integer,Set<Integer>> e : adjacency.entrySet())
			if (e.getValue().size() == 2)
				res1 *= tiles.get(e.getKey()).getId() ;
		
		System.out.println(res1);
	}
	
	private static void inprintAdjacency(int i, int j) {
		if (!adjacency.containsKey(i))
			adjacency.put(i, new HashSet<>()) ;
		adjacency.get(i).add(j) ;
		if (!adjacency.containsKey(j))
			adjacency.put(j, new HashSet<>()) ;
		adjacency.get(j).add(i) ;
	}
}
