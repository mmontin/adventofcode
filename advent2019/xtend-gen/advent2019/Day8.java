package advent2019;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day8 {
  private static final int max_y = 25;

  private static final int max_x = 6;

  private static final int layer_size = (Day8.max_x * Day8.max_y);

  public static void main(final String[] args) {
    final List<String> line = new InputLoader(Integer.valueOf(2019), Integer.valueOf(8)).getChars().get(0);
    final int full_size = line.size();
    final int nb_of_layers = (full_size / Day8.layer_size);
    final Function1<Integer, List<String>> _function = (Integer it) -> {
      return line.subList(((it).intValue() * Day8.layer_size), (((it).intValue() + 1) * Day8.layer_size));
    };
    final Iterable<List<String>> layers = IterableExtensions.<Integer, List<String>>map(new IntegerRange(0, (nb_of_layers - 1)), _function);
    final Function1<List<String>, Integer> _function_1 = (List<String> it) -> {
      final Function1<String, String> _function_2 = (String it_1) -> {
        return it_1;
      };
      return Integer.valueOf(IterableExtensions.<String, String>groupBy(it, _function_2).get("0").size());
    };
    final Function1<String, String> _function_2 = (String it) -> {
      return it;
    };
    final Map<String, List<String>> min_0 = IterableExtensions.<String, String>groupBy(IterableExtensions.<List<String>, Integer>minBy(layers, _function_1), _function_2);
    int _size = min_0.get("1").size();
    int _size_1 = min_0.get("2").size();
    int _multiply = (_size * _size_1);
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
    final Function2<ArrayList<String>, Integer, ArrayList<String>> _function_3 = (ArrayList<String> acc, Integer el) -> {
      ArrayList<String> _xblockexpression = null;
      {
        int i = 0;
        while ((((List<String>[])Conversions.unwrapArray(layers, List.class))[i]).get((el).intValue()).equals("2")) {
          i++;
        }
        acc.add((((List<String>[])Conversions.unwrapArray(layers, List.class))[i]).get((el).intValue()));
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final ArrayList<String> image = IterableExtensions.<Integer, ArrayList<String>>fold(new IntegerRange(0, (Day8.layer_size - 1)), CollectionLiterals.<String>newArrayList(), _function_3);
    IntegerRange _upTo = new IntegerRange(0, (Day8.max_x - 1));
    for (final Integer i : _upTo) {
      {
        String current_line = "";
        IntegerRange _upTo_1 = new IntegerRange(0, (Day8.max_y - 1));
        for (final Integer j : _upTo_1) {
          String _current_line = current_line;
          String _xifexpression = null;
          boolean _equals = image.get((((i).intValue() * 25) + (j).intValue())).equals("1");
          if (_equals) {
            _xifexpression = "#";
          } else {
            _xifexpression = ".";
          }
          current_line = (_current_line + _xifexpression);
        }
        InputOutput.<String>println(current_line);
      }
    }
  }
}
