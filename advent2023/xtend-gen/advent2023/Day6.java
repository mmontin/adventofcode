package advent2023;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day6 {
  private static final List<Pair<Long, Long>> races = CollectionLiterals.<Pair<Long, Long>>newArrayList(Pair.<Long, Long>of(Long.valueOf(34L), Long.valueOf(204L)), Pair.<Long, Long>of(Long.valueOf(90L), Long.valueOf(1713L)), Pair.<Long, Long>of(Long.valueOf(89L), Long.valueOf(1210L)), Pair.<Long, Long>of(Long.valueOf(86L), Long.valueOf(1780L)));

  private static final List<Pair<Long, Long>> race2 = CollectionLiterals.<Pair<Long, Long>>newArrayList(Pair.<Long, Long>of(Long.valueOf(34908986L), Long.valueOf(204171312101780L)));

  public static void main(final String[] args) {
    final Function2<Integer, Pair<Long, Long>, Integer> _function = new Function2<Integer, Pair<Long, Long>, Integer>() {
      public Integer apply(final Integer acc, final Pair<Long, Long> el) {
        int _xblockexpression = (int) 0;
        {
          final ArrayList<Long> nb = Day6.possibilities((el.getKey()).longValue());
          final Function1<Long, Boolean> _function = new Function1<Long, Boolean>() {
            public Boolean apply(final Long it) {
              Long _value = el.getValue();
              return Boolean.valueOf((it.compareTo(_value) > 0));
            }
          };
          int _size = IterableExtensions.size(IterableExtensions.<Long>filter(nb, _function));
          _xblockexpression = ((acc).intValue() * _size);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    InputOutput.<Integer>println(
      IterableExtensions.<Pair<Long, Long>, Integer>fold(Day6.races, Integer.valueOf(1), _function));
    final Function2<Integer, Pair<Long, Long>, Integer> _function_1 = new Function2<Integer, Pair<Long, Long>, Integer>() {
      public Integer apply(final Integer acc, final Pair<Long, Long> el) {
        int _xblockexpression = (int) 0;
        {
          final ArrayList<Long> nb = Day6.possibilities((el.getKey()).longValue());
          final Function1<Long, Boolean> _function = new Function1<Long, Boolean>() {
            public Boolean apply(final Long it) {
              Long _value = el.getValue();
              return Boolean.valueOf((it.compareTo(_value) > 0));
            }
          };
          int _size = IterableExtensions.size(IterableExtensions.<Long>filter(nb, _function));
          _xblockexpression = ((acc).intValue() * _size);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    InputOutput.<Integer>println(
      IterableExtensions.<Pair<Long, Long>, Integer>fold(Day6.race2, Integer.valueOf(1), _function_1));
  }

  public static ArrayList<Long> possibilities(final long time) {
    final Function2<ArrayList<Long>, Integer, ArrayList<Long>> _function = new Function2<ArrayList<Long>, Integer, ArrayList<Long>>() {
      public ArrayList<Long> apply(final ArrayList<Long> acc, final Integer el) {
        ArrayList<Long> _xblockexpression = null;
        {
          acc.add(Long.valueOf(((time - (el).intValue()) * (el).intValue())));
          _xblockexpression = acc;
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Integer, ArrayList<Long>>fold(new IntegerRange(0, ((int) time)), CollectionLiterals.<Long>newArrayList(), _function);
  }
}
