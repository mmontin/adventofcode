package advent2019;

import adventutils.MemoryRunner;
import adventutils.MemoryRunner2;
import adventutils.geometry.Interval;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day16 {
  private static final List<Integer> seed = ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2019), Integer.valueOf(16)).getInputs()).toCharArray())), ((Function1<Character, Integer>) (Character it) -> {
    String _plus = (it + "");
    return Integer.valueOf(Integer.parseInt(_plus));
  }));

  private static final int size = Day16.seed.size();

  private static final int mega_size = (Day16.size * 10_000);

  private static final int nb_of_phases = 100;

  private static int current_size = Day16.size;

  public static void main(final String[] args) {
    final Function1<Integer, String> _function = (Integer it) -> {
      return Day16.computeRunner.call(Integer.valueOf(Day16.nb_of_phases), it).toString();
    };
    InputOutput.<String>println(IterableExtensions.join(IterableExtensions.<Integer, String>map(new ExclusiveRange(0, 8, true), _function)));
    Day16.current_size = Day16.mega_size;
    Day16.patternRunner.reset();
    Day16.computeRunner.reset();
    Day16.intervalRunner.reset();
    final Function1<Integer, String> _function_1 = (Integer it) -> {
      return it.toString();
    };
    final int offset = Integer.parseInt(IterableExtensions.join(IterableExtensions.<Integer, String>map(IterableExtensions.<Integer>take(Day16.seed, 7), _function_1)));
    final Function1<Integer, String> _function_2 = (Integer it) -> {
      return Day16.computeRunner.call(Integer.valueOf(Day16.nb_of_phases), it).toString();
    };
    InputOutput.<String>println(IterableExtensions.join(IterableExtensions.<Integer, String>map(new ExclusiveRange(offset, (offset + 8), true), _function_2)));
  }

  private static final MemoryRunner<Integer, Pair<List<Interval>, List<Interval>>> patternRunner = new MemoryRunner(((Function<Integer, Pair<ArrayList<Interval>, ArrayList<Interval>>>) (Integer pos) -> {
    Pair<ArrayList<Interval>, ArrayList<Interval>> _xblockexpression = null;
    {
      final Interval full_interval = new Interval(0, (Day16.current_size - 1));
      final ArrayList<Interval> positives = CollectionLiterals.<Interval>newArrayList();
      Interval current_positives = new Interval(pos, (2 * pos));
      final ArrayList<Interval> negatives = CollectionLiterals.<Interval>newArrayList();
      Interval current_negatives = new Interval(((3 * pos) + 2), ((4 * pos) + 2));
      while (current_positives.overlapsWith(full_interval)) {
        {
          positives.add(current_positives.intersection(full_interval));
          boolean _overlapsWith = current_negatives.overlapsWith(full_interval);
          if (_overlapsWith) {
            negatives.add(current_negatives.intersection(full_interval));
          }
          current_positives = current_positives.translate((4 * (1 + pos)));
          current_negatives = current_negatives.translate((4 * (1 + pos)));
        }
      }
      _xblockexpression = Pair.<ArrayList<Interval>, ArrayList<Interval>>of(positives, negatives);
    }
    return _xblockexpression;
  }));

  private static final MemoryRunner2<Integer, Interval, Integer> intervalRunner = new MemoryRunner2<Integer, Interval, Integer>(((Function2<Integer, Interval, Integer>) (Integer phase, Interval el) -> {
    final Function2<Integer, Integer, Integer> _function = (Integer acc1, Integer el1) -> {
      Integer _call = Day16.computeRunner.call(Integer.valueOf(phase), el1);
      return Integer.valueOf(((acc1).intValue() + (_call).intValue()));
    };
    return IterableExtensions.<Integer, Integer>fold(new IntegerRange(((int) el.leftBound), ((int) el.rightBound)), Integer.valueOf(0), _function);
  }));

  private static final MemoryRunner2<Integer, Integer, Integer> computeRunner = new MemoryRunner2<Integer, Integer, Integer>(((Function2<Integer, Integer, Integer>) (Integer phase, Integer pos) -> {
    Integer _xifexpression = null;
    if ((phase != 0)) {
      int _xblockexpression = (int) 0;
      {
        final Pair<List<Interval>, List<Interval>> pat = Day16.patternRunner.call(Integer.valueOf(pos));
        final Function2<Integer, Interval, Integer> _function = (Integer acc, Interval el) -> {
          Integer _call = Day16.intervalRunner.call(Integer.valueOf((phase - 1)), el);
          return Integer.valueOf(((acc).intValue() + (_call).intValue()));
        };
        final Integer positive = IterableExtensions.<Interval, Integer>fold(pat.getKey(), Integer.valueOf(0), _function);
        final Function2<Integer, Interval, Integer> _function_1 = (Integer acc, Interval el) -> {
          Integer _call = Day16.intervalRunner.call(Integer.valueOf((phase - 1)), el);
          return Integer.valueOf(((acc).intValue() + (_call).intValue()));
        };
        final Integer negative = IterableExtensions.<Interval, Integer>fold(pat.getValue(), Integer.valueOf(0), _function_1);
        _xblockexpression = Math.abs((((positive).intValue() - (negative).intValue()) % 10));
      }
      _xifexpression = Integer.valueOf(_xblockexpression);
    } else {
      _xifexpression = Day16.seed.get((pos % Day16.size));
    }
    return _xifexpression;
  }));
}
