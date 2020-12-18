package advent2020.puzzle8;

import java.util.List;

public class Context {
	
	private int offset ;
	private int acc ;
	
	public Context() {
		this.reset();
	}
	
	public int getAcc() {
		return this.acc;
	}
	
	public boolean execute(List<Instruction> instructions) {
		while (this.offset < instructions.size()) {
			Instruction i = instructions.get(this.offset) ;
			switch (i.getIt()) {
			case NONE :
				return false ;
			case ACC:
				this.acc += i.getValue();
			case NOP:
				this.offset += 1;
				break ;
			case JUMP:
				this.offset += i.getValue();
			}
			i.visit();
		}
		return true ;
	}
	
	public void reset() {
		this.offset = 0 ;
		this.acc = 0 ;
	}
}
