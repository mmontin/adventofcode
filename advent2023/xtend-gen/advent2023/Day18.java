package advent2023;

import adventutils.collection.ListUtils;
import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import com.google.common.collect.Iterables;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
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
public class Day18 {
  public static class Rectangle {
    private final int minX;

    private final int maxX;

    private final int minY;

    private final int maxY;

    public Rectangle(final int x1, final int x2, final int y1, final int y2) {
      int _xifexpression = (int) 0;
      if ((x1 <= x2)) {
        _xifexpression = x1;
      } else {
        _xifexpression = x2;
      }
      this.minX = _xifexpression;
      int _xifexpression_1 = (int) 0;
      if ((this.minX == x1)) {
        _xifexpression_1 = x2;
      } else {
        _xifexpression_1 = x1;
      }
      this.maxX = _xifexpression_1;
      int _xifexpression_2 = (int) 0;
      if ((y1 <= y2)) {
        _xifexpression_2 = y1;
      } else {
        _xifexpression_2 = y2;
      }
      this.minY = _xifexpression_2;
      int _xifexpression_3 = (int) 0;
      if ((this.minY == y1)) {
        _xifexpression_3 = y2;
      } else {
        _xifexpression_3 = y1;
      }
      this.maxY = _xifexpression_3;
    }

    public BigInteger area() {
      BigInteger _valueOf = BigInteger.valueOf((this.maxY + 1));
      BigInteger _valueOf_1 = BigInteger.valueOf(this.minY);
      BigInteger _minus = _valueOf.subtract(_valueOf_1);
      BigInteger _valueOf_2 = BigInteger.valueOf((this.maxX + 1));
      BigInteger _valueOf_3 = BigInteger.valueOf(this.minX);
      BigInteger _minus_1 = _valueOf_2.subtract(_valueOf_3);
      return _minus.multiply(_minus_1);
    }

    public boolean contains(final Coordinate c) {
      return ((((this.minX <= c.getX()) && (c.getX() <= this.maxX)) && (this.minY <= c.getY())) && (c.getY() <= this.maxY));
    }

    public boolean strictlyContains(final Coordinate c) {
      return ((((this.minX < c.getX()) && (c.getX() < this.maxX)) && (this.minY < c.getY())) && (c.getY() < this.maxY));
    }

    public HashSet<HashSet<Coordinate>> borders() {
      Coordinate _coordinate = new Coordinate(this.minX, this.minY);
      Coordinate _coordinate_1 = new Coordinate(this.minX, this.maxY);
      Coordinate _coordinate_2 = new Coordinate(this.minX, this.minY);
      Coordinate _coordinate_3 = new Coordinate(this.maxX, this.minY);
      Coordinate _coordinate_4 = new Coordinate(this.minX, this.maxY);
      Coordinate _coordinate_5 = new Coordinate(this.maxX, this.maxY);
      Coordinate _coordinate_6 = new Coordinate(this.maxX, this.minY);
      Coordinate _coordinate_7 = new Coordinate(this.maxX, this.maxY);
      return CollectionLiterals.<HashSet<Coordinate>>newHashSet(
        CollectionLiterals.<Coordinate>newHashSet(_coordinate, _coordinate_1), 
        CollectionLiterals.<Coordinate>newHashSet(_coordinate_2, _coordinate_3), 
        CollectionLiterals.<Coordinate>newHashSet(_coordinate_4, _coordinate_5), 
        CollectionLiterals.<Coordinate>newHashSet(_coordinate_6, _coordinate_7));
    }

    public int hashCode() {
      return ((this.minX * this.maxX) + (this.minY * this.maxY));
    }

    public boolean equals(final Object other) {
      boolean _xblockexpression = false;
      {
        final Day18.Rectangle o = ((Day18.Rectangle) other);
        _xblockexpression = ((((this.minX == o.minX) && (this.maxY == o.maxY)) && (this.minY == o.minY)) && (this.maxY == o.maxY));
      }
      return _xblockexpression;
    }
  }

  public static Direction direction(final String s) {
    Direction _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "0")) {
      _matched=true;
      _switchResult = Direction.RIGHT;
    }
    if (!_matched) {
      if (Objects.equal(s, "1")) {
        _matched=true;
        _switchResult = Direction.DOWN;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "2")) {
        _matched=true;
        _switchResult = Direction.LEFT;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "3")) {
        _matched=true;
        _switchResult = Direction.UP;
      }
    }
    return _switchResult;
  }

  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2023), Integer.valueOf(18)).getInputs();
    final Coordinate start = new Coordinate(0, 0);
    final ArrayList<Coordinate> first_list = CollectionLiterals.<Coordinate>newArrayList(start);
    final ArrayList<Coordinate> second_list = CollectionLiterals.<Coordinate>newArrayList(start);
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String line) {
        final String[] split = line.split(" ");
        final Direction dir = Dir.directionFromString(split[0]);
        final int number = Integer.parseInt(split[1]);
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, number, true);
        for (final Integer i : _doubleDotLessThan) {
          first_list.add(IterableExtensions.<Coordinate>last(first_list).otherMove(dir));
        }
        int _length = (split[2]).length();
        int _minus = (_length - 2);
        final int other_number = Integer.parseInt((split[2]).substring(2, _minus), 16);
        int _length_1 = (split[2]).length();
        int _minus_1 = (_length_1 - 2);
        char _charAt = (split[2]).charAt(_minus_1);
        String _plus = (Character.valueOf(_charAt) + "");
        final Direction other_dir = Day18.direction(_plus);
        second_list.add(IterableExtensions.<Coordinate>last(second_list).otherMove(other_dir, other_number));
      }
    };
    input.forEach(_function);
    CoordinateSet _coordinateSet = new CoordinateSet(first_list);
    InputOutput.<Integer>println(Integer.valueOf(Day18.spreadOutside(_coordinateSet).size()));
    final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(it.getX());
      }
    };
    final List<Integer> xs = IterableExtensions.<Integer>sort(IterableExtensions.<Integer>toSet(ListExtensions.<Coordinate, Integer>map(second_list, _function_1)));
    final Function1<Coordinate, Integer> _function_2 = new Function1<Coordinate, Integer>() {
      public Integer apply(final Coordinate it) {
        return Integer.valueOf(it.getY());
      }
    };
    final List<Integer> ys = IterableExtensions.<Integer>sort(IterableExtensions.<Integer>toSet(ListExtensions.<Coordinate, Integer>map(second_list, _function_2)));
    ArrayList<Coordinate> _arrayList = new ArrayList<Coordinate>();
    final Function2<ArrayList<Coordinate>, Coordinate, ArrayList<Coordinate>> _function_3 = new Function2<ArrayList<Coordinate>, Coordinate, ArrayList<Coordinate>>() {
      public ArrayList<Coordinate> apply(final ArrayList<Coordinate> l, final Coordinate c) {
        int _indexOf = xs.indexOf(Integer.valueOf(c.getX()));
        int _multiply = (_indexOf * 2);
        int _indexOf_1 = ys.indexOf(Integer.valueOf(c.getY()));
        int _multiply_1 = (_indexOf_1 * 2);
        Coordinate _coordinate = new Coordinate(_multiply, _multiply_1);
        return ListUtils.<Coordinate, ArrayList<Coordinate>>cons(_coordinate, l);
      }
    };
    final ArrayList<Coordinate> second_list_shrinked = IterableExtensions.<Coordinate, ArrayList<Coordinate>>fold(second_list, _arrayList, _function_3);
    int _size = second_list_shrinked.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
    CoordinateSet _coordinateSet_1 = new CoordinateSet();
    final Function2<CoordinateSet, Integer, CoordinateSet> _function_4 = new Function2<CoordinateSet, Integer, CoordinateSet>() {
      public CoordinateSet apply(final CoordinateSet set, final Integer i) {
        CoordinateSet _xblockexpression = null;
        {
          final Coordinate left = second_list_shrinked.get((i).intValue());
          int _size = second_list_shrinked.size();
          int _modulo = (((i).intValue() + 1) % _size);
          final Coordinate right = second_list_shrinked.get(_modulo);
          set.addAll(Coordinate.getAllCoordsOnLine(left, right));
          _xblockexpression = set;
        }
        return _xblockexpression;
      }
    };
    final CoordinateSet shrinked_set = IterableExtensions.<Integer, CoordinateSet>fold(_doubleDotLessThan, _coordinateSet_1, _function_4);
    final CoordinateSet reached = Day18.spreadOutside(shrinked_set);
    int _size_1 = xs.size();
    int _minus = (_size_1 - 2);
    final Function2<ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>, Integer, ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>> _function_5 = new Function2<ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>, Integer, ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>>() {
      public ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> apply(final ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> list, final Integer x) {
        ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> _xblockexpression = null;
        {
          int _size = ys.size();
          int _minus = (_size - 2);
          final Function2<ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>, Integer, ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>> _function = new Function2<ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>, Integer, ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>>() {
            public ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> apply(final ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> list2, final Integer y) {
              ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> _xblockexpression = null;
              {
                final Day18.Rectangle small_rectangle = new Day18.Rectangle((2 * (x).intValue()), ((2 * (x).intValue()) + 2), (2 * (y).intValue()), ((2 * (y).intValue()) + 2));
                Integer _get = xs.get((x).intValue());
                Integer _get_1 = xs.get(((x).intValue() + 1));
                Integer _get_2 = ys.get((y).intValue());
                Integer _get_3 = ys.get(((y).intValue() + 1));
                final Day18.Rectangle big_rectangle = new Day18.Rectangle((_get).intValue(), (_get_1).intValue(), (_get_2).intValue(), (_get_3).intValue());
                Pair<Day18.Rectangle, Day18.Rectangle> _mappedTo = Pair.<Day18.Rectangle, Day18.Rectangle>of(small_rectangle, big_rectangle);
                list2.add(_mappedTo);
                _xblockexpression = list2;
              }
              return _xblockexpression;
            }
          };
          IterableExtensions.<Integer, ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>>fold(new IntegerRange(0, _minus), list, _function);
          _xblockexpression = list;
        }
        return _xblockexpression;
      }
    };
    final ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>> rectangles = IterableExtensions.<Integer, ArrayList<Pair<Day18.Rectangle, Day18.Rectangle>>>fold(new IntegerRange(0, _minus), CollectionLiterals.<Pair<Day18.Rectangle, Day18.Rectangle>>newArrayList(), _function_5);
    final Function2<HashSet<Day18.Rectangle>, Coordinate, HashSet<Day18.Rectangle>> _function_6 = new Function2<HashSet<Day18.Rectangle>, Coordinate, HashSet<Day18.Rectangle>>() {
      public HashSet<Day18.Rectangle> apply(final HashSet<Day18.Rectangle> set, final Coordinate el) {
        HashSet<Day18.Rectangle> _xblockexpression = null;
        {
          final Function1<Pair<Day18.Rectangle, Day18.Rectangle>, Boolean> _function = new Function1<Pair<Day18.Rectangle, Day18.Rectangle>, Boolean>() {
            public Boolean apply(final Pair<Day18.Rectangle, Day18.Rectangle> it) {
              return Boolean.valueOf(it.getKey().strictlyContains(el));
            }
          };
          final Pair<Day18.Rectangle, Day18.Rectangle> rect = IterableExtensions.<Pair<Day18.Rectangle, Day18.Rectangle>>findFirst(rectangles, _function);
          if ((rect != null)) {
            set.add(rect.getValue());
          }
          _xblockexpression = set;
        }
        return _xblockexpression;
      }
    };
    final HashSet<Day18.Rectangle> used_rectangles = IterableExtensions.<Coordinate, HashSet<Day18.Rectangle>>fold(reached, CollectionLiterals.<Day18.Rectangle>newHashSet(), _function_6);
    HashMap<HashSet<Coordinate>, Integer> _newHashMap = CollectionLiterals.<HashSet<Coordinate>, Integer>newHashMap();
    Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>> _mappedTo = Pair.<BigInteger, HashMap<HashSet<Coordinate>, Integer>>of(BigInteger.ZERO, _newHashMap);
    final Function2<Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>>, Day18.Rectangle, Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>>> _function_7 = new Function2<Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>>, Day18.Rectangle, Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>>>() {
      public Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>> apply(final Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>> sum, final Day18.Rectangle el) {
        Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>> _xblockexpression = null;
        {
          final Consumer<HashSet<Coordinate>> _function = new Consumer<HashSet<Coordinate>>() {
            public void accept(final HashSet<Coordinate> it) {
              final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
                public Integer apply(final Integer x, final Integer y) {
                  return Integer.valueOf(((x).intValue() + (y).intValue()));
                }
              };
              sum.getValue().merge(it, Integer.valueOf(1), _function);
            }
          };
          el.borders().forEach(_function);
          BigInteger _key = sum.getKey();
          BigInteger _area = el.area();
          BigInteger _plus = _key.add(_area);
          HashMap<HashSet<Coordinate>, Integer> _value = sum.getValue();
          _xblockexpression = Pair.<BigInteger, HashMap<HashSet<Coordinate>, Integer>>of(_plus, _value);
        }
        return _xblockexpression;
      }
    };
    final Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>> overSize = IterableExtensions.<Day18.Rectangle, Pair<BigInteger, HashMap<HashSet<Coordinate>, Integer>>>fold(used_rectangles, _mappedTo, _function_7);
    final Function1<Map.Entry<HashSet<Coordinate>, Integer>, Boolean> _function_8 = new Function1<Map.Entry<HashSet<Coordinate>, Integer>, Boolean>() {
      public Boolean apply(final Map.Entry<HashSet<Coordinate>, Integer> it) {
        Integer _value = it.getValue();
        return Boolean.valueOf(((_value).intValue() > 1));
      }
    };
    final Function1<Map.Entry<HashSet<Coordinate>, Integer>, HashSet<Coordinate>> _function_9 = new Function1<Map.Entry<HashSet<Coordinate>, Integer>, HashSet<Coordinate>>() {
      public HashSet<Coordinate> apply(final Map.Entry<HashSet<Coordinate>, Integer> it) {
        return it.getKey();
      }
    };
    final Function2<BigInteger, HashSet<Coordinate>, BigInteger> _function_10 = new Function2<BigInteger, HashSet<Coordinate>, BigInteger>() {
      public BigInteger apply(final BigInteger acc, final HashSet<Coordinate> el) {
        BigInteger _valueOf = BigInteger.valueOf((((Coordinate[])Conversions.unwrapArray(el, Coordinate.class))[0]).manhattanDistanceTo(((Coordinate[])Conversions.unwrapArray(el, Coordinate.class))[1]));
        BigInteger _plus = acc.add(_valueOf);
        return _plus.add(BigInteger.ONE);
      }
    };
    final BigInteger duplicateSize = IterableExtensions.<HashSet<Coordinate>, BigInteger>fold(IterableExtensions.<Map.Entry<HashSet<Coordinate>, Integer>, HashSet<Coordinate>>map(IterableExtensions.<Map.Entry<HashSet<Coordinate>, Integer>>filter(overSize.getValue().entrySet(), _function_8), _function_9), BigInteger.ZERO, _function_10);
    InputOutput.<BigInteger>println(overSize.getKey().subtract(duplicateSize));
  }

  public static CoordinateSet spreadOutside(final CoordinateSet s) {
    CoordinateSet _xblockexpression = null;
    {
      Coordinate _coordinate = new Coordinate((-1), (-1));
      final HashSet<Coordinate> frontier = CollectionLiterals.<Coordinate>newHashSet(_coordinate);
      final CoordinateSet reached = new CoordinateSet(s);
      while ((!frontier.isEmpty())) {
        {
          final HashSet<Coordinate> tmp = new HashSet<Coordinate>(frontier);
          reached.addAll(frontier);
          frontier.clear();
          final Consumer<Coordinate> _function = new Consumer<Coordinate>() {
            public void accept(final Coordinate it) {
              final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it_1) {
                  boolean _contains = reached.contains(it_1);
                  return Boolean.valueOf((!_contains));
                }
              };
              Iterables.<Coordinate>addAll(frontier, IterableExtensions.<Coordinate>filter(it.noDiagonalBoundedNeighbours((s.minX - 1), (s.maxX + 1), (s.minY - 1), (s.maxY + 1)), _function));
            }
          };
          tmp.forEach(_function);
        }
      }
      reached.removeAll(s);
      _xblockexpression = reached.invertSet();
    }
    return _xblockexpression;
  }
}
