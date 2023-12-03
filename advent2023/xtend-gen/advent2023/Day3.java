package advent2023;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

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
    final Function2<Integer, Integer, Integer> _function = (Integer sum, Integer i) -> {
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
            final Consumer<Coordinate> _function_1 = (Coordinate g) -> {
              final BiFunction<List<Integer>, List<Integer>, List<Integer>> _function_2 = (List<Integer> o, List<Integer> n) -> {
                List<Integer> _xblockexpression_1 = null;
                {
                  o.addAll(n);
                  _xblockexpression_1 = o;
                }
                return _xblockexpression_1;
              };
              Day3.gears.merge(g, CollectionLiterals.<Integer>newArrayList(Integer.valueOf(matched)), _function_2);
            };
            allGears.forEach(_function_1);
          }
        }
        _xblockexpression = ((sum).intValue() + current);
      }
      return Integer.valueOf(_xblockexpression);
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(new IntegerRange(1, Day3.maxX), Integer.valueOf(0), _function));
    final Function2<Integer, Map.Entry<Coordinate, List<Integer>>, Integer> _function_1 = (Integer acc, Map.Entry<Coordinate, List<Integer>> v) -> {
      Integer _xifexpression = null;
      int _size = v.getValue().size();
      boolean _equals = (_size == 2);
      if (_equals) {
        Integer _get = v.getValue().get(0);
        Integer _get_1 = v.getValue().get(1);
        int _multiply = ((_get).intValue() * (_get_1).intValue());
        _xifexpression = Integer.valueOf(((acc).intValue() + _multiply));
      } else {
        _xifexpression = acc;
      }
      return _xifexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<Map.Entry<Coordinate, List<Integer>>, Integer>fold(Day3.gears.entrySet(), Integer.valueOf(0), _function_1));
  }

  public static Pair<Boolean, HashSet<Coordinate>> hasSymbol(final int i, final int j, final String s, final int x) {
    HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet();
    Pair<Boolean, HashSet<Coordinate>> _mappedTo = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet);
    final Function2<Pair<Boolean, HashSet<Coordinate>>, Integer, Pair<Boolean, HashSet<Coordinate>>> _function = (Pair<Boolean, HashSet<Coordinate>> acc, Integer e) -> {
      Pair<Boolean, HashSet<Coordinate>> _xblockexpression = null;
      {
        final Pair<Boolean, HashSet<Coordinate>> sub = Day3.isSymbol((e).intValue(), s, x);
        acc.getValue().addAll(sub.getValue());
        HashSet<Coordinate> _value = acc.getValue();
        _xblockexpression = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(((acc.getKey()).booleanValue() || (sub.getKey()).booleanValue())), _value);
      }
      return _xblockexpression;
    };
    return IterableExtensions.<Integer, Pair<Boolean, HashSet<Coordinate>>>fold(new IntegerRange(i, j), _mappedTo, _function);
  }

  public static Pair<Boolean, HashSet<Coordinate>> isSymbol(final int i, final String s, final int x) {
    Pair<Boolean, HashSet<Coordinate>> _switchResult = null;
    boolean _matched = false;
    if ((i < 0)) {
      _matched=true;
      HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet();
      _switchResult = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet);
    }
    if (!_matched) {
      int _length = s.length();
      boolean _greaterEqualsThan = (i >= _length);
      if (_greaterEqualsThan) {
        _matched=true;
        HashSet<Coordinate> _newHashSet_1 = CollectionLiterals.<Coordinate>newHashSet();
        _switchResult = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet_1);
      }
    }
    if (!_matched) {
      Pair<Boolean, HashSet<Coordinate>> _xblockexpression = null;
      {
        char _charAt = s.charAt(i);
        final int cAsInt = ((int) _charAt);
        Pair<Boolean, HashSet<Coordinate>> _switchResult_1 = null;
        boolean _matched_1 = false;
        if (((cAsInt >= 49) && (cAsInt <= 57))) {
          _matched_1=true;
          HashSet<Coordinate> _newHashSet_2 = CollectionLiterals.<Coordinate>newHashSet();
          _switchResult_1 = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet_2);
        }
        if (!_matched_1) {
          if (Objects.equal(cAsInt, 42)) {
            _matched_1=true;
            Coordinate _coordinate = new Coordinate(x, i);
            HashSet<Coordinate> _newHashSet_3 = CollectionLiterals.<Coordinate>newHashSet(_coordinate);
            _switchResult_1 = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(true), _newHashSet_3);
          }
        }
        if (!_matched_1) {
          if (Objects.equal(cAsInt, 46)) {
            _matched_1=true;
            HashSet<Coordinate> _newHashSet_4 = CollectionLiterals.<Coordinate>newHashSet();
            _switchResult_1 = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(false), _newHashSet_4);
          }
        }
        if (!_matched_1) {
          HashSet<Coordinate> _newHashSet_5 = CollectionLiterals.<Coordinate>newHashSet();
          _switchResult_1 = Pair.<Boolean, HashSet<Coordinate>>of(Boolean.valueOf(true), _newHashSet_5);
        }
        _xblockexpression = _switchResult_1;
      }
      _switchResult = _xblockexpression;
    }
    return _switchResult;
  }
}
