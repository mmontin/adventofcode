package advent2020.puzzle12;

import java.io.IOException;
import java.util.stream.Collectors;

import advent2020.Utils;
import advent2020.Utils.MyList;

public class Launcher {

	public static void main(String[] args) throws IOException {
		System.out.println(new MyList<>(Utils.getInputs(12).stream().map(Instruction::new).collect(Collectors.toList())));
	}

	private static enum InstructionType {
		N, S, E, W, L, R, F;
	}

	private static class Instruction {

		private InstructionType it;
		private int v;

		public Instruction(String s) {
			this.it = InstructionType.valueOf(s.substring(0, 1));
			this.v = Integer.parseInt(s.substring(1));
		}

		@Override
		public String toString() {
			return "( " + it + " , " + v + " )";
		}
	}
}
