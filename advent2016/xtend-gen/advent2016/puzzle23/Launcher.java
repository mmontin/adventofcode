package advent2016.puzzle23;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Launcher {
  public static List<Instruction> instructions = new ArrayList<Instruction>(new InputLoader(Integer.valueOf(2016), Integer.valueOf(23)).<Instruction>getInputs(((Function1<String, Instruction>) (String it) -> {
    return new Instruction(it);
  })));

  public static Map<String, Integer> registers = CollectionLiterals.<String, Integer>newHashMap(Pair.<String, Integer>of("a", Integer.valueOf(7)), Pair.<String, Integer>of("b", Integer.valueOf(0)), Pair.<String, Integer>of("c", Integer.valueOf(0)), Pair.<String, Integer>of("d", Integer.valueOf(0)));

  public static int position = 0;

  public static void main(final String[] args) {
    while ((Launcher.position < Launcher.instructions.size())) {
      Launcher.instructions.get(Launcher.position).execute();
    }
    InputOutput.<Integer>println(Launcher.registers.get("a"));
  }
}
