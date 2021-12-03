package advent2020.puzzle19;

import java.util.Map;

public abstract class BinaryRule extends Rule {
	
	private String left ;
	private String right ;
	
	public BinaryRule(String left, String right) {
		super("") ;
		this.left = left ;
		this.right = right ;
	}
	
	@Override
	public boolean isStub() {
		return this.contenu.equals("") ;
	}

	@Override
	public boolean resolve(Map<Integer,Rule> rules) {
		if (!isStub()) return true ;
		Rule rLeft = rules.get(Integer.parseInt(left)) ;
		Rule rRight = rules.get(Integer.parseInt(right)) ;
		if (rLeft.isStub() || rRight.isStub())
			return false ;
		else {
			contenu = "(" + rLeft.getRegularExpression() + getSeparator() + rRight.getRegularExpression() + ")";
			return true ;
		}
	}
	
	public abstract String getSeparator() ;
	public abstract String getToStringSeparator() ;
	
	@Override
	public String toString() {
		return left + getToStringSeparator() + right ;
	}
}