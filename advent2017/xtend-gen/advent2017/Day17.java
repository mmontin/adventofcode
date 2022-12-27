package advent2017;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Day17 {
  private static final int STEP = 304;

  public static void main(final String[] args) {
    final ArrayList<Integer> buffer = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0));
    int current_position = 0;
    IntegerRange _upTo = new IntegerRange(1, 2017);
    for (final Integer i : _upTo) {
      buffer.add(current_position = (((current_position + Day17.STEP) % (i).intValue()) + 1), i);
    }
    int _size = buffer.size();
    int _modulo = ((current_position + 1) % _size);
    InputOutput.<Integer>println(buffer.get(_modulo));
    int second = 0;
    current_position = 0;
    IntegerRange _upTo_1 = new IntegerRange(1, 50000000);
    for (final Integer i_1 : _upTo_1) {
      if (((current_position = (((current_position + Day17.STEP) % (i_1).intValue()) + 1)) == 1)) {
        second = (i_1).intValue();
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(second));
  }
}
