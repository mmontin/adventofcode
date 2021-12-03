package advent2020.puzzle7;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Bag {
	
	private Map<Bag, Integer> contains ;
	private List<Bag> isContainedIn ;
	
	public Bag() {
		this.contains = new HashMap<>() ;
		this.isContainedIn = new ArrayList<>() ;
	}
	
	public void addContains(int occurrences, Bag b) {
		this.contains.put(b.addIsContainedIn(this),occurrences) ;
	}
	
	public Bag addIsContainedIn(Bag b) {
		this.isContainedIn.add(b) ;
		return this ;
	}
	
	public void addToList(List<Bag> alreadyThere) {
		if (!alreadyThere.contains(this)) {
			alreadyThere.add(this) ;
			for (Bag b : isContainedIn)	b.addToList(alreadyThere);
		}
	}
	
	public int numberOfBags() {
		int i = 1 ;
		for (Bag b : contains.keySet()) i += (contains.get(b) * b.numberOfBags()) ;
		return i ;
	}
}
