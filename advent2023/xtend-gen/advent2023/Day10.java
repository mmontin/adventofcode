package advent2023;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day10 {
  public static void main(final String[] args) {
    final HashMap<Coordinate, Iterable<Coordinate>> coordinates = CollectionLiterals.<Coordinate, Iterable<Coordinate>>newHashMap();
    final ArrayList<Coordinate> starting = CollectionLiterals.<Coordinate>newArrayList();
    final Function1<String, List<String>> _function = new Function1<String, List<String>>() {
      public List<String> apply(final String it) {
        final Function1<Character, String> _function = new Function1<Character, String>() {
          public String apply(final Character it_1) {
            return (it_1 + "");
          }
        };
        return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
      }
    };
    final List<List<String>> lines = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(10)).getInputs(), _function);
    int _size = lines.size();
    int _minus = (_size - 1);
    final Consumer<Integer> _function_1 = new Consumer<Integer>() {
      public void accept(final Integer i) {
        int _size = lines.get(0).size();
        int _minus = (_size - 1);
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
            String _get = lines.get((i).intValue()).get((j).intValue());
            boolean _matched = false;
            if (Objects.equal(_get, "|")) {
              _matched=true;
              final Function1<Coordinate.Direction, Coordinate> _function = new Function1<Coordinate.Direction, Coordinate>() {
                public Coordinate apply(final Coordinate.Direction it) {
                  return current.otherMove(it);
                }
              };
              coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.UP, Coordinate.Direction.DOWN), _function));
            }
            if (!_matched) {
              if (Objects.equal(_get, "-")) {
                _matched=true;
                final Function1<Coordinate.Direction, Coordinate> _function_1 = new Function1<Coordinate.Direction, Coordinate>() {
                  public Coordinate apply(final Coordinate.Direction it) {
                    return current.otherMove(it);
                  }
                };
                coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.LEFT, Coordinate.Direction.RIGHT), _function_1));
              }
            }
            if (!_matched) {
              if (Objects.equal(_get, "7")) {
                _matched=true;
                final Function1<Coordinate.Direction, Coordinate> _function_2 = new Function1<Coordinate.Direction, Coordinate>() {
                  public Coordinate apply(final Coordinate.Direction it) {
                    return current.otherMove(it);
                  }
                };
                coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.LEFT, Coordinate.Direction.DOWN), _function_2));
              }
            }
            if (!_matched) {
              if (Objects.equal(_get, "J")) {
                _matched=true;
                final Function1<Coordinate.Direction, Coordinate> _function_3 = new Function1<Coordinate.Direction, Coordinate>() {
                  public Coordinate apply(final Coordinate.Direction it) {
                    return current.otherMove(it);
                  }
                };
                coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.LEFT, Coordinate.Direction.UP), _function_3));
              }
            }
            if (!_matched) {
              if (Objects.equal(_get, "F")) {
                _matched=true;
                final Function1<Coordinate.Direction, Coordinate> _function_4 = new Function1<Coordinate.Direction, Coordinate>() {
                  public Coordinate apply(final Coordinate.Direction it) {
                    return current.otherMove(it);
                  }
                };
                coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.RIGHT, Coordinate.Direction.DOWN), _function_4));
              }
            }
            if (!_matched) {
              if (Objects.equal(_get, "L")) {
                _matched=true;
                final Function1<Coordinate.Direction, Coordinate> _function_5 = new Function1<Coordinate.Direction, Coordinate>() {
                  public Coordinate apply(final Coordinate.Direction it) {
                    return current.otherMove(it);
                  }
                };
                coordinates.put(current, IterableExtensions.<Coordinate.Direction, Coordinate>map(CollectionLiterals.<Coordinate.Direction>newHashSet(Coordinate.Direction.UP, Coordinate.Direction.RIGHT), _function_5));
              }
            }
            if (!_matched) {
              if (Objects.equal(_get, "S")) {
                _matched=true;
                starting.add(current);
              }
            }
            if (!_matched) {
              coordinates.put(current, CollectionLiterals.<Coordinate>newHashSet());
            }
          }
        };
        new IntegerRange(0, _minus).forEach(_function);
      }
    };
    new IntegerRange(0, _minus).forEach(_function_1);
    final Coordinate start = starting.get(0);
    final Function1<Coordinate, Boolean> _function_2 = new Function1<Coordinate, Boolean>() {
      public Boolean apply(final Coordinate it) {
        return Boolean.valueOf(IterableExtensions.contains(coordinates.get(it), start));
      }
    };
    coordinates.put(start, IterableExtensions.<Coordinate>filter(start.noDiagonalUnboundedNeighbours(), _function_2));
    Coordinate prev = start;
    Coordinate current = IterableExtensions.<Coordinate>head(coordinates.get(start));
    final ArrayList<Coordinate> path = CollectionLiterals.<Coordinate>newArrayList(prev);
    while ((!current.equals(start))) {
      {
        path.add(current);
        final Coordinate nprev = prev;
        prev = current;
        final Function1<Coordinate, Boolean> _function_3 = new Function1<Coordinate, Boolean>() {
          public Boolean apply(final Coordinate it) {
            boolean _equals = it.equals(nprev);
            return Boolean.valueOf((!_equals));
          }
        };
        current = IterableExtensions.<Coordinate>findFirst(coordinates.get(current), _function_3);
      }
    }
    path.add(current);
    int _size_1 = path.size();
    int _divide = (_size_1 / 2);
    InputOutput.<Integer>println(Integer.valueOf(_divide));
    final Function1<Coordinate, Integer> _function_3 = new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(it.getX());
      }
    };
    int _x = IterableExtensions.<Coordinate, Integer>maxBy(coordinates.keySet(), _function_3).getX();
    final int max = (_x * 2);
    int _size_2 = path.size();
    int _minus_1 = (_size_2 - 2);
    final Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>> _function_4 = new Function2<HashSet<Coordinate>, Integer, HashSet<Coordinate>>() {
      public HashSet<Coordinate> apply(final HashSet<Coordinate> acc, final Integer el) {
        HashSet<Coordinate> _xblockexpression = null;
        {
          final Coordinate left = path.get((el).intValue()).scale(2);
          final Coordinate right = path.get(((el).intValue() + 1)).scale(2);
          int _x = left.getX();
          int _x_1 = right.getX();
          int _plus = (_x + _x_1);
          int _divide = (_plus / 2);
          int _y = right.getY();
          int _y_1 = left.getY();
          int _plus_1 = (_y + _y_1);
          int _divide_1 = (_plus_1 / 2);
          final Coordinate middle = new Coordinate(_divide, _divide_1);
          acc.add(left);
          acc.add(middle);
          _xblockexpression = acc;
        }
        return _xblockexpression;
      }
    };
    final HashSet<Coordinate> reached = IterableExtensions.<Integer, HashSet<Coordinate>>fold(new IntegerRange(0, _minus_1), CollectionLiterals.<Coordinate>newHashSet(), _function_4);
    Coordinate _coordinate = new Coordinate((-1), (-1));
    final HashSet<Coordinate> frontier = CollectionLiterals.<Coordinate>newHashSet(_coordinate);
    while ((!frontier.isEmpty())) {
      {
        final HashSet<Coordinate> tmp = new HashSet<Coordinate>(frontier);
        reached.addAll(frontier);
        frontier.clear();
        final Consumer<Coordinate> _function_5 = new Consumer<Coordinate>() {
          public void accept(final Coordinate it) {
            final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
              public Boolean apply(final Coordinate it_1) {
                boolean _contains = reached.contains(it_1);
                return Boolean.valueOf((!_contains));
              }
            };
            Iterables.<Coordinate>addAll(frontier, IterableExtensions.<Coordinate>filter(it.noDiagonalBoundedNeighbours((-2), (max + 2)), _function));
          }
        };
        tmp.forEach(_function_5);
      }
    }
    final Function1<Coordinate, Coordinate> _function_5 = new Function1<Coordinate, Coordinate>() {
      public Coordinate apply(final Coordinate it) {
        return it.scale(2);
      }
    };
    final Function1<Coordinate, Boolean> _function_6 = new Function1<Coordinate, Boolean>() {
      public Boolean apply(final Coordinate it) {
        boolean _contains = reached.contains(it);
        return Boolean.valueOf((!_contains));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Coordinate>filter(IterableExtensions.<Coordinate, Coordinate>map(coordinates.keySet(), _function_5), _function_6))));
  }
}
