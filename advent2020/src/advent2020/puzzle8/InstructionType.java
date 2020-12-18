package advent2020.puzzle8;

public enum InstructionType {
	NOP, JUMP, ACC, NONE;

	public static InstructionType fromString(String s) {
		switch (s) {
		case ("acc"):
			return ACC;
		case ("nop"):
			return NOP;
		case ("jmp"):
			return JUMP;
		}
		return NONE;
	}
}
