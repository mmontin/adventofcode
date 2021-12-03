package advent2020.puzzle17;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import advent2020.Utils;

public class Launcher {

	private static Map<Triplet,Boolean> grid = new HashMap<>() ;
	
	public static void main(String[] args) throws IOException {

		long time = System.currentTimeMillis() ;
		
		List<String> inputs = Utils.getInputs(17) ;
		for (int i = 0 ; i < inputs.size() ; i++)
			for (int j = 0 ; j < inputs.get(i).length() ; j++)
				grid.put(new Triplet(i , j, 0, 0), inputs.get(i).charAt(j) == '#') ;
		
		for (int i = 0 ; i < 6 ; i++) {
			addEmpties() ;
			step() ;
		}
		
		System.out.println(grid.entrySet().stream().reduce(0, ((x , y) -> x + ((boolean)y.getValue() ? 1 : 0)), Integer::sum));
		System.out.println(System.currentTimeMillis() - time);
	}
	
	private static void step() {
		Map<Triplet,Boolean> newGrid = new HashMap<>() ;
		for (Entry<Triplet, Boolean> e : grid.entrySet()) {
			int nb = getNbOfNeighbours(e.getKey()) ;
			boolean newB ;
			if ((boolean)e.getValue())
				newB = (nb == 2 || nb == 3) ;
			else
				newB = (nb == 3) ;
			newGrid.put(new Triplet(e.getKey()), newB) ;
		}
		grid = newGrid ;
	}
	
	private static void addEmpties() {
		Set<Triplet> reachableEmpties = new HashSet<>() ;
		for (Entry<Triplet, Boolean> e : grid.entrySet())
			if ((boolean)e.getValue())
				addNeighbours(reachableEmpties, (Triplet)e.getKey());
		for (Triplet t : reachableEmpties)
			if (!grid.containsKey(t))
				grid.put(t, false) ;
	}

	private static void addNeighbours(Set<Triplet> neighbours, Triplet key) {
		for (int i = key.x - 1 ; i <= key.x + 1 ; i++)
			for (int j = key.y - 1 ; j <= key.y + 1; j++)
				for (int k = key.z - 1 ; k <= key.z + 1; k++)
					for (int l = key.t - 1 ; l <= key.t + 1 ; l++)
						if (! (i == key.x && j == key.y && k == key.z && l == key.t))
							neighbours.add(new Triplet(i, j, k, l));		
	}
	
	private static int getNbOfNeighbours(Triplet key) {
		Set<Triplet> neighbours= new HashSet<Triplet>() ;
		addNeighbours(neighbours,key) ;
		int nb = 0 ;
		for (Triplet t : neighbours) {
			Boolean b = (Boolean)grid.get(t) ;
			if (b != null && (boolean)b) nb++ ;
		}
		return nb ;
	}

	private static class Triplet {
		int x ;
		int y ;
		int z ;
		int t ;
		
		public Triplet(int x, int y, int z, int t) {
			this.x = x;
			this.y = y;
			this.z = z;
			this.t = t;
		}
		
		public Triplet(Triplet p) {
			this(p.x , p.y, p.z, p.t) ;
		}
		
		@Override
		public boolean equals(Object o) {
			Triplet p = (Triplet)o ;
			return x == p.x && y == p.y && z == p.z && t == p.t;
		}
		
		@Override
		public int hashCode() {
		    return x + y + z + t;
		}
		
		@Override
		public String toString() {
			return "[ " + x + " , " + y + " , " + z + " ," + t + "]";
		}
	}
}
