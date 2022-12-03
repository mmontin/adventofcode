package advent2020.puzzle20;

import java.util.ArrayList;
import java.util.List;

import adventutils.string.StringUtils;

public class Tile {

	private Long id ;
	private List<String> borders ;

	public Tile(List<String> lines) {
		id = Long.parseLong(lines.remove(0).substring(5, 9)) ;
		borders = new ArrayList<>(4) ;
		borders.add(lines.get(0)) ;
		borders.add(lines.stream().reduce("", ((x , y) -> x + y.charAt(9)), ((x , y) -> x + y))) ;
		borders.add(lines.get(lines.size() - 1)) ;
		borders.add(lines.stream().reduce("", ((x , y) -> x + y.charAt(0)), ((x , y) -> x + y))) ;
	}

	public boolean matchesAny(Tile otherTile) {
		for (String oBorder : otherTile.borders) {
			String oBorderRev = StringUtils.reverse(oBorder) ;
			for (String mBorder : borders)
				if (mBorder.equals(oBorder) || mBorder.equals(oBorderRev))
					return true ;
		}
		return false ;
	}

	public Long getId() {
		return id ;
	}

	public void rotate() {
		String north = borders.remove(0) ;
		String east = borders.remove(0) ;
		String south = borders.remove(0) ;
		String west = borders.remove(0) ;
		borders.add(StringUtils.reverse(west)) ;
		borders.add(north) ;
		borders.add(StringUtils.reverse(east)) ;
		borders.add(south) ;
	}
	
	public void flip() {
		String north = borders.remove(0) ;
		String east = borders.remove(0) ;
		String south = borders.remove(0) ;
		String west = borders.remove(0) ;
		borders.add(south) ;
		borders.add(StringUtils.reverse(east)) ;
		borders.add(north) ;
		borders.add(StringUtils.reverse(west)) ;
	}
}
