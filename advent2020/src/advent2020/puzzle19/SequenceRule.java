package advent2020.puzzle19;

public class SequenceRule extends BinaryRule {

	public SequenceRule(String left, String right) {
		super(left, right);
	}

	@Override
	public String getSeparator() {
		return "" ;
	}

	@Override
	public String getToStringSeparator() {
		return " " ;
	}
}
