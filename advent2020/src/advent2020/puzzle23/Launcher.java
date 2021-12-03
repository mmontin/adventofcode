package advent2020.puzzle23;

import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import advent2020.Utils;

public class Launcher {
	
	public static List<Node> cups = new ArrayList<Node>() ;
	
	public static void main(String[] args) throws IOException {

		long time = System.currentTimeMillis() ;
		
		String input = Utils.getInputs(23).get(0) ;
		
		Node first = null ;
		Node current = null ;
		
		for (int i = 0 ; i < input.length() ; i++) {
			Integer value = Integer.parseInt("" + input.charAt(i)) ;
			Node n = new Node(value) ;
			cups.add(n) ;
			if (i == 0) current = n ;
			if (value == 1) first = n ;
		}

		for (int i = 10 ; i <= 1000000 ; i++)
			cups.add(new Node(i)) ;
		
		for (int i = 0 ; i < cups.size() - 1 ; i++) 
			cups.get(i).setNext(cups.get(i+1));
		cups.get(cups.size()-1).setNext(cups.get(0));

		cups.sort((x , y) -> x.getValue() - y.getValue());
		
		for (int i = 0 ; i < 10000000 ; i++) {
			Node n = current.removeThree() ;
			Node target = current.nextInChain(n) ;
			target.insert(n); ;
			current = current.getNext() ;
		}

		BigInteger second = BigInteger.valueOf(first.getNext().getValue()) ;
		BigInteger third = BigInteger.valueOf(first.getNext().getNext().getValue()) ;
		
		System.out.println(second.multiply(third));
		System.out.println("duration : " + (System.currentTimeMillis() - time) + " ms");
	}
}
