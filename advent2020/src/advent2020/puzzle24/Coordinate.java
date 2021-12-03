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
		int xs = 0 ;
		int ys = 0 ;
		int zs = 0 ;
		String tmp = s ;
		while (tmp.length() != 0) {
			int offset ;
			if (tmp.startsWith("ne")) {
				ys ++ ;
				offset = 2 ;
			} else if (tmp.startsWith("sw")) {
				ys -- ;
				offset = 2 ;
			} else if (tmp.startsWith("se")) {
				zs -- ;
				offset = 2 ;
			} else if (tmp.startsWith("nw")) {
				zs ++ ;
				offset = 2 ;
			} else if (tmp.startsWith("e")) {
				xs ++ ;
				offset = 1 ;
			} else {
				xs -- ;
				offset = 1 ;
			}
			tmp = tmp.substring(offset) ;
		}
		this.x = xs - zs ;
		this.y = ys + zs ;
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
