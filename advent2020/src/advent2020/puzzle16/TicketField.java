package advent2020.puzzle16;

public class TicketField {

	private int min1;
	private int max1;
	private int min2;
	private int max2;
	private String name;

	public TicketField(String s) {
		String[] split1, split2, split3, split4;
		split1 = s.split(": ");
		name = split1[0];
		split2 = split1[1].split(" or ");
		split3 = split2[0].split("-") ;
		split4 = split2[1].split("-") ;
		min1 = Integer.parseInt(split3[0]) ;
		max1 = Integer.parseInt(split3[1]) ;
		min2 = Integer.parseInt(split4[0]) ;
		max2 = Integer.parseInt(split4[1]) ;
	}
	
	public boolean inRange(int v) {
		return (min1 <= v && v <= max1) || (min2 <= v && v <= max2) ;
	}
	
	public String getName() {
		return this.name ;
	}
	
	@Override
	public String toString() {
		return name + " : [ " + min1 + " , " + max1 + " ] or [ " + min2 + " , " + max2 + " ]";  
	}
	
	public boolean isDeparture() {
		return name.contains("departure") ;
	}
}
