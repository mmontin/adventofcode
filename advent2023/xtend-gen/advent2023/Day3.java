package advent2023;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import com.google.common.base.Objects;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day3 {
  private static final List<String> grid = new InputLoader(Integer.valueOf(2023), Integer.valueOf(3)).getInputs();

  private static final int maxX = Day3.grid.size();

  private static final int maxY = Day3.grid.get(0).length();

  private static final Pattern number = Pattern.compile("\\d+");

  private static final Map<Coordinate, List<Integer>> gears = CollectionLiterals.<Coordinate, List<Integer>>newHashMap();

  public static void main(final String[] args) {
    final String emptyLine = ".".repeat(Day3.maxY);
    Day3.grid.add(emptyLine);
    Day3.grid.add(0, emptyLine);
    final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer sum, final Integer i) {
        int _xblockexpression = (int) 0;
        {
          final Matcher matcher = Day3.number.matcher(Day3.grid.get((i).intValue()));
          int current = 0;
          while (matcher.find()) {
            {
              final int matched = Integer.parseInt(matcher.group());
              int _start = matcher.start();
              final int prev = (_start - 1);
              final int end = matcher.end();
              final Pair<Boolean, HashSet<Coordinate>> upper = Day3.hasSymbol(prev, end, Day3.grid.get(((i).intValue() - 1)), ((i).intValue() - 1));
              final Pair<Boolean, HashSet<Coordinate>> lower = Day3.hasSymbol(prev, end, Day3.grid.get(((i).intValue() + 1)), ((i).intValue() + 1));
              final Pair<Boolean, HashSet<Coordinate>> left = Day3.isSymbol(prev, Day3.grid.get((i).intValue()), (i).intValue());
              final Pair<Boolean, HashSet<Coordinate>> right = Day3.isSymbol(end, Day3.grid.get((i).intValue()), (i).intValue());
              final HashSet<Coordinate> allGears = CollectionLiterals.<Coordinate>newHashSet();
              allGears.addAll(upper.getValue());
              allGears.addAll(lower.getValue());
              allGears.addAll(left.getValue());
              allGears.addAll(right.getValue());
              if (((((upper.getKey()).booleanValue() || (lower.getKey()).booleanValue()) || (left.getKey()).booleanValue()) || (right.getKey()).booleanValue())) {
                int _current = current;
                current = (_current + matched);
              }
              final Consumer<Coordinate> _function = new Consumer<Coordinate>() {
                public void accept(final Coordinate g) {
                  final BiFunction<List<Integer>, List<Integer>, List<Integer>> _function = new BiFunction<List<Integer>, List<Integer>, List<Integer>>() {
                    public List<Integer> apply(final List<Integer> o, final List<Integer> n) {
                      List<Integer> _xblockexpression = null;
                      {
                        o.addAll(n);
                        _xblockexpression = o;
                      }
                      return _xblockexpression;
                    }
                  };
                  Day3.gears.merge(g, CollectionLiterals.<Integer>newArrayList(Integer.valueOf(matched)), _function);
                }
              };
              allGears.forEach(_function);
            }
          }
          _xblockexpression = ((sum).intValue() + current);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(new IntegerRange(1, Day3.maxX), Integer.valueOf(0), _function));
    final Function1<Map.Entry<Coordinate, List<Integer>>, Boolean> _function_1 = new Function1<Map.Entry<Coordinate, List<Integer>>, Boolean>() {
      public Boolean apply(final Map.Entry<Coordinate, List<Integer>> x) {
        int _size = x.getValue().size();
        return Boolean.valueOf((_size == 2));
      }
    };
    final Function2<Integer, Map.Entry<Coordinate, List<Integer>>, Integer> _function_2 = new Function2<Integer, Map.Entry<Coordinate, List<Integer>>, Integer>() {
      public Integer apply(final Integer acc, final Map.Entry<Coordinate, List<Integer>> v) {
        Integer _get = v.getValue().get(0);
        Integer _get_1 = v.getValue().get(1);
        int _multiply = ((_get).intValue() * (_get_1).intValue());
        return Integer.valueOf(((acc).intValue() + _multiply));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Map.Entry<Coordinate, List<Integer>>, Integer>fold(IterableExtensions.<Map.Entry<Coordinate, List<Integer>>>filter(Day3.gears.entrySet(), _function_1), Integer.valueOf(0), _function_2));
  }

  public static Pair<Boolean, HashSet<Coordinate>> hasSymbol(final int i, final int j, final String s, final int x) {
    HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet();
    Pair<Boolean, HashSet<Coordinate>> _mappedTo = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet);
    final Function2<Pair<Boolean, HashSet<Coordinate>>, Integer, Pair<Boolean, HashSet<Coordinate>>> _function = new Function2<Pair<Boolean, HashSet<Coordinate>>, Integer, Pair<Boolean, HashSet<Coordinate>>>() {
      public Pair<Boolean, HashSet<Coordinate>> apply(final Pair<Boolean, HashSet<Coordinate>> acc, final Integer e) {
        Pair<Boolean, HashSet<Coordinate>> _xblockexpression = null;
        {
          final Pair<Boolean, HashSet<Coordinate>> sub = Day3.isSymbol((e).intValue(), s, x);
          acc.getValue().addAll(sub.getValue());
          HashSet<Coordinate> _value = acc.getValue();
          _xblockexpression = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(((acc.getKey()).booleanValue() || (sub.getKey()).booleanValue())), _value);
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Integer, Pair<Boolean, HashSet<Coordinate>>>fold(new IntegerRange(i, j), _mappedTo, _function);
  }

  public static Pair<Boolean, HashSet<Coordinate>> isSymbol(final int i, final String s, final int x) {
    Pair<Boolean, HashSet<Coordinate>> _xtrycatchfinallyexpression = null;
    try {
      Pair<Boolean, HashSet<Coordinate>> _switchResult = null;
      char _charAt = s.charAt(i);
      final int cAsInt = ((int) _charAt);
      boolean _matched = false;
      if ((((cAsInt >= 49) && (cAsInt <= 57)) || (cAsInt == 46))) {
        _matched=true;
        HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet();
        _switchResult = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet);
      }
      if (!_matched) {
        if (Objects.equal(cAsInt, 42)) {
          _matched=true;
          Coordinate _coordinate = new Coordinate(x, i);
          HashSet<Coordinate> _newHashSet_1 = CollectionLiterals.<Coordinate>newHashSet(_coordinate);
          _switchResult = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(true), _newHashSet_1);
        }
      }
      if (!_matched) {
        HashSet<Coordinate> _newHashSet_2 = CollectionLiterals.<Coordinate>newHashSet();
        _switchResult = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(true), _newHashSet_2);
      }
      _xtrycatchfinallyexpression = _switchResult;
    } catch (final Throwable _t) {
      if (_t instanceof IndexOutOfBoundsException) {
        HashSet<Coordinate> _newHashSet_3 = CollectionLiterals.<Coordinate>newHashSet();
        Pair<Boolean, HashSet<Coordinate>> _mappedTo = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet_3);
        _xtrycatchfinallyexpression = _mappedTo;
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    return _xtrycatchfinallyexpression;
  }
}
