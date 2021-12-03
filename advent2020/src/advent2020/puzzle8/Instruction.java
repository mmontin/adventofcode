package advent2020.puzzle8;

public class Instruction {
	
	private InstructionType it ;
	private int value ;
	
	public Instruction(String input) {
		String[] pars = input.split(" ");
		it = InstructionType.fromString(pars[0]);
		value = Integer.parseInt(pars[1]);
	}
	
	public Instruction(Instruction i) {
		this.it = i.it ;
		this.value = i.value ;
	}
	
	public boolean canBeChanged() {
		return it == InstructionType.JUMP || it == InstructionType.NOP ;
	}
	
	public void change() {
		if (this.it == InstructionType.JUMP) this.it = InstructionType.NOP ;
		else if (this.it == InstructionType.NOP) this.it = InstructionType.JUMP ;
	}

	public InstructionType getIt() {
		return this.it ;
	}
	
	public int getValue() {
		return this.value ;
	}
	
	public void visit() {
		this.it = InstructionType.NONE ;
	}
}
