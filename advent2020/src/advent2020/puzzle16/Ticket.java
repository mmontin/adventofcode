package advent2020.puzzle16;

import java.util.ArrayList;
import java.util.List;

public class Ticket {

	private List<Integer> values ;
	
	public Ticket(String s) {
		String[] split = s.split(",") ;
		values = new ArrayList<>() ;
		for (int i = 0 ; i < split.length ; i++)
			values.add(Integer.parseInt(split[i])) ;
	}
	
	public Integer errorRate(List<TicketField> fields) {
		return values.stream().reduce(0, 
				((x , y) -> x + satisfies(y, fields)), 
				((x , y) -> x + y)) ;
	}
	
	private static Integer satisfies(Integer value, List<TicketField> fields) {
		return fields.stream().reduce(false, ((x , y) -> x || y.inRange(value)), ((x , y) -> x || y)) ? 0 : value ;
	}
	
	public Integer getValueAt(int n) {
		return values.get(n) ;
	}
}
