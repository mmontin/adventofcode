package advent2020.puzzle3;

import java.util.ArrayList; 

public class CircularList<E> extends ArrayList<E> {

	private static final long serialVersionUID = 1L;

	@Override
	public E get(int i) {
		return super.get(i % this.size()) ;
	}
}
