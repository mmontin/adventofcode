package advent2017;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    final Function1<String, Integer> _function = (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    };
    final List<Integer> inputs = new InputLoader(Integer.valueOf(2017), Integer.valueOf(5)).<Integer>getInputs(_function);
    final int offsets_size = inputs.size();
    final ArrayList<Integer> offsets = CollectionLiterals.<Integer>newArrayList();
    offsets.addAll(inputs);
    int position = 0;
    int steps = 0;
    while (((position >= 0) && (position < offsets_size))) {
      {
        final Integer current_offset = offsets.get(position);
        offsets.set(position, Integer.valueOf(((current_offset).intValue() + 1)));
        int _position = position;
        position = (_position + (current_offset).intValue());
        steps++;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(steps));
    offsets.clear();
    offsets.addAll(inputs);
    position = 0;
    steps = 0;
    while (((position >= 0) && (position < offsets_size))) {
      {
        final Integer current_offset = offsets.get(position);
        int _xifexpression = (int) 0;
        if (((current_offset).intValue() >= 3)) {
          _xifexpression = ((current_offset).intValue() - 1);
        } else {
          _xifexpression = ((current_offset).intValue() + 1);
        }
        offsets.set(position, Integer.valueOf(_xifexpression));
        int _position = position;
        position = (_position + (current_offset).intValue());
        steps++;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(steps));
  }
}
