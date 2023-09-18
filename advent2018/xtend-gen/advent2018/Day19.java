package advent2018;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Day19 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2018), Integer.valueOf(19)).getInputs();
    final int pointerRegistry = Integer.parseInt(inputs.get(0).split(" ")[1]);
    final List<String> instructions = inputs.subList(1, inputs.size());
    ArrayList<Integer> _newArrayList = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(1), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0));
    final MiniLang engine = new MiniLang(_newArrayList);
    int currentInstruction = 0;
    while (((currentInstruction >= 0) && (currentInstruction < instructions.size()))) {
      {
        engine.registry.set(pointerRegistry, Integer.valueOf(currentInstruction));
        engine.execute(instructions.get(currentInstruction));
        Integer _get = engine.registry.get(pointerRegistry);
        int _plus = ((_get).intValue() + 1);
        currentInstruction = _plus;
      }
    }
    InputOutput.<Integer>println(engine.registry.get(0));
  }
}
