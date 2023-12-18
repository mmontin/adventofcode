package advent2021.puzzle24;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.collection.ListUtils;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Launcher {
  private static final List<String> inputStrings = new InputLoader(Integer.valueOf(2021), Integer.valueOf(24)).getInputs();

  private static final List<Pair<Integer, Integer>> input = IterableExtensions.<Integer, ArrayList<Pair<Integer, Integer>>>fold(new IntegerRange(0, 13), new ArrayList<Pair<Integer, Integer>>(), new Function2<ArrayList<Pair<Integer, Integer>>, Integer, ArrayList<Pair<Integer, Integer>>>() {
    public ArrayList<Pair<Integer, Integer>> apply(final ArrayList<Pair<Integer, Integer>> l, final Integer i) {
      int _parseInt = Integer.parseInt(Launcher.inputStrings.get((((i).intValue() * 18) + 5)).split(" ")[2]);
      int _parseInt_1 = Integer.parseInt(Launcher.inputStrings.get((((i).intValue() * 18) + 15)).split(" ")[2]);
      Pair<Integer, Integer> _pair = new Pair<Integer, Integer>(Integer.valueOf(_parseInt), Integer.valueOf(_parseInt_1));
      return ListUtils.<Pair<Integer, Integer>, ArrayList<Pair<Integer, Integer>>>cons(_pair, l);
    }
  });

  public static void main(final String[] args) {
    InputOutput.<List<Pair<Integer, Integer>>>println(Launcher.input);
  }
}
