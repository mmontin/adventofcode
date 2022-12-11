package advent2021.puzzle24;

import adventutils.input.InputLoader;
import adventutils.list.ListUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

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

  private static int z = 0;

  public static int function() {
    int _xblockexpression = (int) 0;
    {
      final Stack<Object> stack = new Stack<Object>();
      IntegerRange _upTo = new IntegerRange(9, 1);
      for (final Integer i : _upTo) {
        IntegerRange _upTo_1 = new IntegerRange(9, 1);
        for (final Integer j : _upTo_1) {
          IntegerRange _upTo_2 = new IntegerRange(9, 1);
          for (final Integer k : _upTo_2) {
            IntegerRange _upTo_3 = new IntegerRange(9, 1);
            for (final Integer l : _upTo_3) {
              InputOutput.println();
            }
          }
        }
      }
      _xblockexpression = 0;
    }
    return _xblockexpression;
  }

  public static void main(final String[] args) {
    Launcher.function();
  }
}
