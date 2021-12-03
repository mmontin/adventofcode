package advent2020.puzzle19;

import java.util.Map;

public class UnaryRule extends Rule {

	public UnaryRule(String contenu) {
		super(contenu);
	}

	@Override
	public boolean isStub() {
		return contenu.matches("\\d+");
	}

	@Override
	public boolean resolve(Map<Integer,Rule> rules) {
		if (!isStub()) return true ;
		Rule r = rules.get(Integer.parseInt(contenu)) ;
		if (r.isStub()) 
			return false ;
		else {
			contenu = r.getRegularExpression() ;
			return true ;
		}
	}
	
	@Override
	public String toString() {
		return contenu ;
	}
}