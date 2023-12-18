package advent2015.puzzle18;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final List<List<Integer>> tiles = new ArrayList<List<Integer>>();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String l) {
        final ArrayList<Integer> line = CollectionLiterals.<Integer>newArrayList();
        final Consumer<Character> _function = new Consumer<Character>() {
          public void accept(final Character c) {
            int _xifexpression = (int) 0;
            boolean _equals = (c + "").equals("#");
            if (_equals) {
              _xifexpression = 1;
            } else {
              _xifexpression = 0;
            }
            line.add(Integer.valueOf(_xifexpression));
          }
        };
        ((List<Character>)Conversions.doWrapArray(l.toCharArray())).forEach(_function);
        tiles.add(line);
      }
    };
    new InputLoader(Integer.valueOf(2015), Integer.valueOf(18)).getInputs().forEach(_function);
    List<List<Integer>> input = tiles;
    IntegerRange _upTo = new IntegerRange(0, 99);
    for (final Integer k : _upTo) {
      input = Launcher.step(input);
    }
    final Function2<Integer, List<Integer>, Integer> _function_1 = new Function2<Integer, List<Integer>, Integer>() {
      public Integer apply(final Integer v, final List<Integer> l) {
        final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
          public Integer apply(final Integer x, final Integer y) {
            return Integer.valueOf(((x).intValue() + (y).intValue()));
          }
        };
        return IterableExtensions.<Integer, Integer>fold(l, v, _function);
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(input, Integer.valueOf(0), _function_1));
  }

  public static ArrayList<List<Integer>> step(final List<List<Integer>> input) {
    ArrayList<List<Integer>> _xblockexpression = null;
    {
      final ArrayList<List<Integer>> output = new ArrayList<List<Integer>>();
      IntegerRange _upTo = new IntegerRange(0, 99);
      for (final Integer i : _upTo) {
        {
          final ArrayList<Integer> line = new ArrayList<Integer>();
          IntegerRange _upTo_1 = new IntegerRange(0, 99);
          for (final Integer j : _upTo_1) {
            {
              int neighbours = 0;
              int _max = Math.max(((i).intValue() - 1), 0);
              int _min = Math.min(((i).intValue() + 1), 99);
              IntegerRange _upTo_2 = new IntegerRange(_max, _min);
              for (final Integer k : _upTo_2) {
                int _max_1 = Math.max(((j).intValue() - 1), 0);
                int _min_1 = Math.min(((j).intValue() + 1), 99);
                IntegerRange _upTo_3 = new IntegerRange(_max_1, _min_1);
                for (final Integer l : _upTo_3) {
                  if (((!Objects.equal(k, i)) || (!Objects.equal(l, j)))) {
                    int _neighbours = neighbours;
                    Integer _get = input.get((k).intValue()).get((l).intValue());
                    neighbours = (_neighbours + (_get).intValue());
                  }
                }
              }
              Integer newValue = input.get((i).intValue()).get((j).intValue());
              if (((((i).intValue() == 0) && (((j).intValue() == 0) || ((j).intValue() == 99))) || (((i).intValue() == 99) && (((j).intValue() == 0) || ((j).intValue() == 99))))) {
                newValue = Integer.valueOf(1);
              } else {
                if (((newValue).intValue() == 1)) {
                  int _xifexpression = (int) 0;
                  if (((neighbours == 2) || (neighbours == 3))) {
                    _xifexpression = 1;
                  } else {
                    _xifexpression = 0;
                  }
                  newValue = Integer.valueOf(_xifexpression);
                } else {
                  int _xifexpression_1 = (int) 0;
                  if ((neighbours == 3)) {
                    _xifexpression_1 = 1;
                  } else {
                    _xifexpression_1 = 0;
                  }
                  newValue = Integer.valueOf(_xifexpression_1);
                }
              }
              line.add(newValue);
            }
          }
          output.add(line);
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
