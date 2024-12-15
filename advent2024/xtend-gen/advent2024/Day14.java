package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day14 {
  private static final int max_i = 101;

  private static final int max_j = 103;

  public static void main(final String[] args) {
    final Function1<String, Pair<Coordinate, Coordinate>> _function = (String it) -> {
      Pair<Coordinate, Coordinate> _xblockexpression = null;
      {
        final String[] split = it.split("p=| v=");
        String _get = split[1];
        Coordinate _coordinate = new Coordinate(_get);
        String _get_1 = split[2];
        Coordinate _coordinate_1 = new Coordinate(_get_1);
        _xblockexpression = Pair.<Coordinate, Coordinate>of(_coordinate, _coordinate_1);
      }
      return _xblockexpression;
    };
    final Set<Pair<Coordinate, Coordinate>> input = IterableExtensions.<Pair<Coordinate, Coordinate>>toSet(ListExtensions.<String, Pair<Coordinate, Coordinate>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(14)).getInputs(), _function));
    final Function2<HashSet<Pair<Coordinate, Coordinate>>, Pair<Coordinate, Coordinate>, HashSet<Pair<Coordinate, Coordinate>>> _function_1 = (HashSet<Pair<Coordinate, Coordinate>> acc, Pair<Coordinate, Coordinate> el) -> {
      HashSet<Pair<Coordinate, Coordinate>> _xblockexpression = null;
      {
        acc.add(Day14.step(el, 100));
        _xblockexpression = acc;
      }
      return _xblockexpression;
    };
    final Function1<Pair<Coordinate, Coordinate>, Coordinate> _function_2 = (Pair<Coordinate, Coordinate> it) -> {
      return it.getKey();
    };
    final Iterable<Coordinate> res1 = IterableExtensions.<Pair<Coordinate, Coordinate>, Coordinate>map(IterableExtensions.<Pair<Coordinate, Coordinate>, HashSet<Pair<Coordinate, Coordinate>>>fold(input, CollectionLiterals.<Pair<Coordinate, Coordinate>>newHashSet(), _function_1), _function_2);
    final int middle_x = (Day14.max_i / 2);
    final int middle_y = (Day14.max_j / 2);
    final Function1<Coordinate, Boolean> _function_3 = (Coordinate it) -> {
      return Boolean.valueOf(((it.getX() < middle_x) && (it.getY() < middle_y)));
    };
    final int top_left = IterableExtensions.size(IterableExtensions.<Coordinate>filter(res1, _function_3));
    final Function1<Coordinate, Boolean> _function_4 = (Coordinate it) -> {
      return Boolean.valueOf(((it.getX() < middle_x) && (it.getY() > middle_y)));
    };
    final int bot_left = IterableExtensions.size(IterableExtensions.<Coordinate>filter(res1, _function_4));
    final Function1<Coordinate, Boolean> _function_5 = (Coordinate it) -> {
      return Boolean.valueOf(((it.getX() > middle_x) && (it.getY() < middle_y)));
    };
    final int top_right = IterableExtensions.size(IterableExtensions.<Coordinate>filter(res1, _function_5));
    final Function1<Coordinate, Boolean> _function_6 = (Coordinate it) -> {
      return Boolean.valueOf(((it.getX() > middle_x) && (it.getY() > middle_y)));
    };
    final int bot_right = IterableExtensions.size(IterableExtensions.<Coordinate>filter(res1, _function_6));
    InputOutput.<Integer>println(Integer.valueOf((((top_left * top_right) * bot_left) * bot_right)));
    final ArrayList<Set<Pair<Coordinate, Coordinate>>> all_states = CollectionLiterals.<Set<Pair<Coordinate, Coordinate>>>newArrayList();
    Set<Pair<Coordinate, Coordinate>> current = input;
    while ((!all_states.contains(current))) {
      {
        all_states.add(current);
        final Function1<Pair<Coordinate, Coordinate>, Pair<Coordinate, Coordinate>> _function_7 = (Pair<Coordinate, Coordinate> it) -> {
          return Day14.step(it, 1);
        };
        current = IterableExtensions.<Pair<Coordinate, Coordinate>>toSet(IterableExtensions.<Pair<Coordinate, Coordinate>, Pair<Coordinate, Coordinate>>map(current, _function_7));
      }
    }
    final Function1<Set<Pair<Coordinate, Coordinate>>, Integer> _function_7 = (Set<Pair<Coordinate, Coordinate>> s) -> {
      final Function1<Pair<Coordinate, Coordinate>, Coordinate> _function_8 = (Pair<Coordinate, Coordinate> it) -> {
        return it.getKey();
      };
      final Function1<Coordinate, Boolean> _function_9 = (Coordinate it) -> {
        return Boolean.valueOf(((it.getX() <= (middle_x + (it.getY() / 2))) && ((middle_x - (it.getY() / 2)) <= it.getX())));
      };
      return Integer.valueOf(IterableExtensions.size(IterableExtensions.<Coordinate>filter(IterableExtensions.<Pair<Coordinate, Coordinate>, Coordinate>map(s, _function_8), _function_9)));
    };
    final List<Integer> sizes = ListExtensions.<Set<Pair<Coordinate, Coordinate>>, Integer>map(all_states, _function_7);
    final Integer max_size = IterableExtensions.<Integer>max(sizes);
    InputOutput.<Integer>println(Integer.valueOf(sizes.indexOf(max_size)));
  }

  public static Pair<Coordinate, Coordinate> step(final Pair<Coordinate, Coordinate> coord, final int n) {
    Pair<Coordinate, Coordinate> _xblockexpression = null;
    {
      int _x = coord.getKey().getX();
      int _x_1 = coord.getValue().getX();
      int _multiply = (_x_1 * n);
      int _plus = (_x + _multiply);
      int new_x = (_plus % Day14.max_i);
      if ((new_x < 0)) {
        new_x = (Day14.max_i + new_x);
      }
      int _y = coord.getKey().getY();
      int _y_1 = coord.getValue().getY();
      int _multiply_1 = (_y_1 * n);
      int _plus_1 = (_y + _multiply_1);
      int new_y = (_plus_1 % Day14.max_j);
      if ((new_y < 0)) {
        new_y = (Day14.max_j + new_y);
      }
      Coordinate _coordinate = new Coordinate(new_x, new_y);
      Coordinate _value = coord.getValue();
      _xblockexpression = Pair.<Coordinate, Coordinate>of(_coordinate, _value);
    }
    return _xblockexpression;
  }
}
