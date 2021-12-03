package advent2020.puzzle23;

import java.util.ArrayList;
import java.util.List;

public class Node {
	
	private Integer value ;
	private Node next ;
	
	public Node(Integer value_) {
		value = value_ ;
		next = null ;
	}
	
	public void setNext(Node n) {
		next = n ;
	}
	
	public Node getNext() {
		return next ;
	}
	
	@Override
	public String toString() {
		return value + " -> " + next.getValue() ;
	}

	public Integer getValue() {
		return value ;
	}
	
	public Node nextInChain(Node three) {
		List<Integer> others = new ArrayList<>() ;
		others.add(three.getValue()) ;
		others.add(three.getNext().getValue()) ;
		others.add(three.getNext().getNext().getValue()) ;
		
		int i = this.value - 1 ;
		while (others.contains(i)) {
			if (i == 1)
				i = 999999 ;
			else
				i = i - 1 ;
		}
		return Launcher.cups.get(i > 0 ? i-1 : 999999) ;
	}
	
	public void insert(Node n) {
		Node nextTemp = next ;
		this.next = n ;
		Node current = this.next ;
		while (current.getNext() != null)
			current = current.next ;
		current.next = nextTemp ;
	}
	
	public Node removeThree() {
		Node plusOne = next ;
		Node plusThree = next.next.next ;
		Node plusFour = plusThree.next ;
		plusThree.setNext(null);
		this.next = plusFour ;
		return plusOne ;
	}
}
