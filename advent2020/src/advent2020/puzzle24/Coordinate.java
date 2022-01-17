package advent2020.puzzle24;

public class Coordinate {
	
	int x ;
	int y ;
	
	public Coordinate(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	public Coordinate(Coordinate p) {
		this(p.x , p.y) ;
	}
	
	public Coordinate(String s) {
		this(0,0) ;
		String tmp = s ;
		while (tmp.length() != 0) {
			int offset ;
			if (tmp.startsWith("ne")) {
				y ++ ;
				offset = 2 ;
			} else if (tmp.startsWith("sw")) {
				y -- ;
				offset = 2 ;
			} else if (tmp.startsWith("se")) {
				x ++ ;
				y -- ;
				offset = 2 ;
			} else if (tmp.startsWith("nw")) {
				x -- ;
				y ++ ;
				offset = 2 ;
			} else if (tmp.startsWith("e")) {
				x ++ ;
				offset = 1 ;
			} else {
				x -- ;
				offset = 1 ;
			}
			tmp = tmp.substring(offset) ;
		}
	}
	
	@Override
	public boolean equals(Object o) {
		Coordinate p = (Coordinate)o ;
		return x == p.x && y == p.y;
	}
	
	@Override
	public int hashCode() {
	    return x + y;
	}
	
	@Override
	public String toString() {
		return "[ " + x + " , " + y + "]";
	}
}
