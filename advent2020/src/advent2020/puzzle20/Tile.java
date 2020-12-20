package advent2020.puzzle20;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import advent2020.Utils;

public class Tile {

	private Long id ;
	private List<String> borders ;
	private List<Tile> neighbours ;
	
	public Tile(List<String> lines) {
		id = Long.parseLong(lines.remove(0).substring(5, 9)) ;
		neighbours = new ArrayList<>(4) ;
		
		borders = new ArrayList<>(8) ;
		borders.add(lines.get(0)) ;
		borders.add(lines.get(lines.size() - 1)) ;
		borders.add(lines.stream().reduce("", ((x , y) -> x + y.charAt(0)), ((x , y) -> x + y))) ;
		borders.add(lines.stream().reduce("", ((x , y) -> x + y.charAt(9)), ((x , y) -> x + y))) ;
		borders.add(Utils.reverse(borders.get(0))) ;
		borders.add(Utils.reverse(borders.get(1))) ;
		borders.add(Utils.reverse(borders.get(2))) ;
		borders.add(Utils.reverse(borders.get(3))) ;
	}
	
	public void addNeighbour(Tile other) {
		if (!this.neighbours.contains(other)) {
			this.neighbours.add(other) ;
			other.addNeighbour(this);
		}
	}
	
	public int getNumberOfNeighbours() {
		return this.neighbours.size() ;
	}
	
	public boolean matchesAny(Tile otherTile) {
		return otherTile.borders.stream().reduce(false, ((x , y) -> x || this.matches(y)), ((x , y) -> x || y)) ;
	}
	
	public boolean matches(String other) {
		for (String s : borders) if (s.equals(other)) return true ;
		return false ;
	}

	public Tile register(Map<String, Integer> bordersMap) {
		for (String s : borders)
			bordersMap.put(s, bordersMap.containsKey(s) ? bordersMap.get(s) + 1 : 1) ;
		return this ;
	}

	public Long getId() {
		return id ;
	}
}
