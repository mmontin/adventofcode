package advent2020.puzzle20;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import advent2020.Utils;

public class Tile {

	private Long id ;
	private List<String> borders ;
	private Map<Tile,String> neighbours ;
	private boolean adjusted ;
	
	public Tile(List<String> lines) {
		id = Long.parseLong(lines.remove(0).substring(5, 9)) ;
		neighbours = new HashMap<>() ;
		adjusted = false ;
		borders = new ArrayList<>(4) ;
		borders.add(lines.get(0)) ;
		borders.add(lines.stream().reduce("", ((x , y) -> x + y.charAt(9)), ((x , y) -> x + y))) ;
		borders.add(lines.get(lines.size() - 1)) ;
		borders.add(lines.stream().reduce("", ((x , y) -> x + y.charAt(0)), ((x , y) -> x + y))) ;
	}
	
	public void addNeighbour(Tile other, String border) {
		if (!this.neighbours.containsKey(other)) {
			this.neighbours.put(other, border) ;
			other.addNeighbour(this, border);
		}
	}
	
	public int getNumberOfNeighbours() {
		return this.neighbours.size() ;
	}

	public String matchesAny(Tile otherTile) {
		for (String s : otherTile.borders) {
			if (matches(s)) return s ;
			if (matches(Utils.reverse(s))) return Utils.reverse(s) ;
		}
		return null ;
	}
	
	public boolean matches(String other) {
		for (String s : borders) if (s.equals(other) || s.equals(Utils.reverse(other))) return true ;
		return false ;
	}

	public Long getId() {
		return id ;
	}
	
	// Puts the border s in the direction d
	public void adjust(String s, int direction) {
		if (adjusted) return ;
		adjusted = true ;
		if (!borders.get(direction).equals(s)) {
			rotate() ;
			if (!borders.get(direction).equals(s)) {
				rotate() ;
				if (!borders.get(direction).equals(s)) {
					rotate() ;
					if (!borders.get(direction).equals(s)) {
						flip() ;
						if (!borders.get(direction).equals(s)) {
							rotate() ;
							if (!borders.get(direction).equals(s)) {
								rotate() ;
								if (!borders.get(direction).equals(s)) {
									rotate() ;
								}
							}
						}
					}
				}
			}
		}
		for (Entry<Tile,String> entry : neighbours.entrySet()) {
			entry.getKey().adjust(
					entry.getValue(), 
					(borders.indexOf(entry.getValue()) + 2) % 4);
		}
	}
	
	private void rotate() {
		String north = borders.remove(0) ;
		String east = borders.remove(0) ;
		String south = borders.remove(0) ;
		String west = borders.remove(0) ;
		borders.add(Utils.reverse(west)) ;
		borders.add(north) ;
		borders.add(Utils.reverse(east)) ;
		borders.add(south) ;
	}
	
	private void flip() {
		String north = borders.remove(0) ;
		String east = borders.remove(0) ;
		String south = borders.remove(0) ;
		String west = borders.remove(0) ;
		borders.add(south) ;
		borders.add(Utils.reverse(east)) ;
		borders.add(north) ;
		borders.add(Utils.reverse(west)) ;
	}
	
	public void initializeSouth() {
		adjust(neighbours.entrySet().iterator().next().getValue(),2) ;
	}
	
	public String getBorder(int i) {
		return borders.get(i) ;
	}
	
	@Override
	public String toString() {
		return "Tile " + id ;
	}
	
	public boolean isAdjusted() {
		return adjusted ;
	}

	public Tile getEastNeighbour() {
		for (Entry<Tile,String> entry : neighbours.entrySet())
			if (entry.getValue().equals(borders.get(1))) return entry.getKey() ;
		return null ;
	}

	public Tile getSouthNeighbour() {
		for (Entry<Tile,String> entry : neighbours.entrySet())
			if (entry.getValue().equals(borders.get(2))) return entry.getKey() ;
		return null ;
	}
	
	public Tile getWestNeighbour() {
		for (Entry<Tile,String> entry : neighbours.entrySet())
			if (entry.getValue().equals(borders.get(3))) return entry.getKey() ;
		return null ;
	}

	public Tile getNorthNeighbour() {
		for (Entry<Tile,String> entry : neighbours.entrySet())
			if (entry.getValue().equals(borders.get(0))) return entry.getKey() ;
		return null ;
	}
	
	public Set<Tile> getNeighbours() {
		return neighbours.keySet() ;
	}
}
