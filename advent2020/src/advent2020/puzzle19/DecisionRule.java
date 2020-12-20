package advent2020.puzzle19;

public class DecisionRule extends BinaryRule {

	public DecisionRule(String left, String right) {
		super(left, right);
	}

	@Override
	public String getSeparator() {
		return "|";
	}

	@Override
	public String getToStringSeparator() {
		return getSeparator();
	}
}
