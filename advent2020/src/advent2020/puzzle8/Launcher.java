package advent2020.puzzle8;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import advent2020.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		List<Instruction> instructions = Utils.getInputs(8).stream().map(x -> new Instruction(x)).collect(Collectors.toList()) ;
		List<Integer> toChange = new ArrayList<>() ;
		for (int i = 0; i < instructions.size(); i++) if (instructions.get(i).canBeChanged()) toChange.add(i) ;
		Context c = new Context() ;
		List<Instruction> toProcess ;
		do {
			toProcess = copy(instructions) ;
			toProcess.get(toChange.get(0)).change() ;
			toChange.remove(0) ;
			c.reset();
		} while (!c.execute(toProcess) && toChange.size() != 0) ;
		System.out.println("Result : " + c.getAcc());
	}
	
	private static List<Instruction> copy(List<Instruction> instructions) {
		List<Instruction> output = new ArrayList<Instruction>() ;
		for (Instruction i : instructions) output.add(new Instruction(i)) ;
		return output ;
	}
}
