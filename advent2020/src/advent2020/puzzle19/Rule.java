package advent2020.puzzle19;

import java.util.Map;

public abstract class Rule {

	protected String contenu ;
	
	public Rule(String contenu) {
		this.contenu = contenu ;
	}
	
	public abstract boolean isStub() ;
	public abstract boolean resolve(Map<Integer,Rule> rules) ;
	
	public String getRegularExpression() {
		return contenu ;
	}
}