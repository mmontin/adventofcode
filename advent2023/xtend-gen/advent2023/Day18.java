package advent2023;

import adventutils.advanced.Map;
import adventutils.collection.ListUtils;
import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.geometry.Rectangle;
import adventutils.input.InputLoader;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day18 {
  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2023), Integer.valueOf(18)).getInputs();
    final Coordinate start = new Coordinate(0, 0);
    final ArrayList<Coordinate> first_list = CollectionLiterals.<Coordinate>newArrayList(start);
    final ArrayList<Coordinate> second_list = CollectionLiterals.<Coordinate>newArrayList(start);
    final Consumer<String> _function = (String line) -> {
      final String[] split = line.split(" ");
      final Direction dir = Dir.directionFromString(split[0]);
      final int number = Integer.parseInt(split[1]);
      first_list.add(first_list.getLast().otherMove(dir, number));
      int _length = (split[2]).length();
      int _minus = (_length - 2);
      final int other_number = Integer.parseInt((split[2]).substring(2, _minus), 16);
      int _length_1 = (split[2]).length();
      int _minus_1 = (_length_1 - 2);
      char _charAt = (split[2]).charAt(_minus_1);
      String _plus = (Character.valueOf(_charAt) + "");
      final Direction other_dir = Dir.directionFromStringNb(_plus);
      second_list.add(second_list.getLast().otherMove(other_dir, other_number));
    };
    input.forEach(_function);
    final Pair<CoordinateSet, Pair<CoordinateSet, CoordinateSet>> output = Map.flow(first_list);
    int _size = output.getValue().getKey().size();
    int _size_1 = output.getValue().getValue().size();
    int _plus = (_size + _size_1);
    InputOutput.<Integer>println(Integer.valueOf(_plus));
    final Function1<Coordinate, Integer> _function_1 = (Coordinate it) -> {
      return Integer.valueOf(it.getX());
    };
    final List<Integer> xs = IterableExtensions.<Integer>sort(IterableExtensions.<Integer>toSet(ListExtensions.<Coordinate, Integer>map(second_list, _function_1)));
    final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
      return Integer.valueOf(it.getY());
    };
    final List<Integer> ys = IterableExtensions.<Integer>sort(IterableExtensions.<Integer>toSet(ListExtensions.<Coordinate, Integer>map(second_list, _function_2)));
    ArrayList<Coordinate> _arrayList = new ArrayList<Coordinate>();
    final Function2<ArrayList<Coordinate>, Coordinate, ArrayList<Coordinate>> _function_3 = (ArrayList<Coordinate> l, Coordinate c) -> {
      int _indexOf = xs.indexOf(Integer.valueOf(c.getX()));
      int _multiply = (_indexOf * 2);
      int _indexOf_1 = ys.indexOf(Integer.valueOf(c.getY()));
      int _multiply_1 = (_indexOf_1 * 2);
      Coordinate _coordinate = new Coordinate(_multiply, _multiply_1);
      return ListUtils.<Coordinate, ArrayList<Coordinate>>cons(_coordinate, l);
    };
    final ArrayList<Coordinate> second_list_shrinked = IterableExtensions.<Coordinate, ArrayList<Coordinate>>fold(second_list, _arrayList, _function_3);
    final Pair<CoordinateSet, Pair<CoordinateSet, CoordinateSet>> output_2 = Map.flow(second_list_shrinked);
    final CoordinateSet inside = output_2.getValue().getValue();
    int _size_2 = xs.size();
    int _minus = (_size_2 - 2);
    final Function2<ArrayList<Pair<Rectangle, Rectangle>>, Integer, ArrayList<Pair<Rectangle, Rectangle>>> _function_4 = (ArrayList<Pair<Rectangle, Rectangle>> list, Integer x) -> {
      ArrayList<Pair<Rectangle, Rectangle>> _xblockexpression = null;
      {
        int _size_3 = ys.size();
        int _minus_1 = (_size_3 - 2);
        final Function2<ArrayList<Pair<Rectangle, Rectangle>>, Integer, ArrayList<Pair<Rectangle, Rectangle>>> _function_5 = (ArrayList<Pair<Rectangle, Rectangle>> list2, Integer y) -> {
          ArrayList<Pair<Rectangle, Rectangle>> _xblockexpression_1 = null;
          {
            final Rectangle small_rectangle = new Rectangle((2 * (x).intValue()), ((2 * (x).intValue()) + 2), (2 * (y).intValue()), ((2 * (y).intValue()) + 2));
            Integer _get = xs.get((x).intValue());
            Integer _get_1 = xs.get(((x).intValue() + 1));
            Integer _get_2 = ys.get((y).intValue());
            Integer _get_3 = ys.get(((y).intValue() + 1));
            final Rectangle big_rectangle = new Rectangle((_get).intValue(), (_get_1).intValue(), (_get_2).intValue(), (_get_3).intValue());
            Pair<Rectangle, Rectangle> _mappedTo = Pair.<Rectangle, Rectangle>of(small_rectangle, big_rectangle);
            list2.add(_mappedTo);
            _xblockexpression_1 = list2;
          }
          return _xblockexpression_1;
        };
        IterableExtensions.<Integer, ArrayList<Pair<Rectangle, Rectangle>>>fold(new IntegerRange(0, _minus_1), list, _function_5);
        _xblockexpression = list;
      }
      return _xblockexpression;
    };
    final ArrayList<Pair<Rectangle, Rectangle>> all_rectangles = IterableExtensions.<Integer, ArrayList<Pair<Rectangle, Rectangle>>>fold(new IntegerRange(0, _minus), CollectionLiterals.<Pair<Rectangle, Rectangle>>newArrayList(), _function_4);
    final long t1 = System.currentTimeMillis();
    final HashSet<Rectangle> used_rectangles = Day18.smartSearch(all_rectangles, inside);
    HashSet<HashSet<Coordinate>> _newHashSet = CollectionLiterals.<HashSet<Coordinate>>newHashSet();
    HashSet<Coordinate> _newHashSet_1 = CollectionLiterals.<Coordinate>newHashSet();
    Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>> _mappedTo = Pair.<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>of(_newHashSet, _newHashSet_1);
    Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>> _mappedTo_1 = Pair.<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>>of(BigInteger.ZERO, _mappedTo);
    final Function2<Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>>, Rectangle, Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>>> _function_5 = (Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>> sum, Rectangle el) -> {
      Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>> _xblockexpression = null;
      {
        final Pair<HashSet<Coordinate>, HashSet<HashSet<Coordinate>>> tmp = el.bordersAndCorners();
        final HashSet<HashSet<Coordinate>> borders = tmp.getValue();
        final HashSet<Coordinate> corners = tmp.getKey();
        sum.getValue().getKey().addAll(borders);
        sum.getValue().getValue().addAll(corners);
        BigInteger _key = sum.getKey();
        BigInteger _innerArea = el.innerArea();
        BigInteger _plus_1 = _key.add(_innerArea);
        Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>> _value = sum.getValue();
        _xblockexpression = Pair.<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>>of(_plus_1, _value);
      }
      return _xblockexpression;
    };
    final Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>> overSize = IterableExtensions.<Rectangle, Pair<BigInteger, Pair<HashSet<HashSet<Coordinate>>, HashSet<Coordinate>>>>fold(used_rectangles, _mappedTo_1, _function_5);
    long _currentTimeMillis = System.currentTimeMillis();
    long _minus_1 = (_currentTimeMillis - t1);
    String _plus_1 = ("TIME : " + Long.valueOf(_minus_1));
    InputOutput.<String>println(_plus_1);
    BigInteger _key = overSize.getKey();
    BigInteger _valueOf = BigInteger.valueOf(overSize.getValue().getValue().size());
    BigInteger _plus_2 = _key.add(_valueOf);
    final Function2<BigInteger, HashSet<Coordinate>, BigInteger> _function_6 = (BigInteger acc, HashSet<Coordinate> el) -> {
      int _manhattanDistanceTo = (((Coordinate[])Conversions.unwrapArray(el, Coordinate.class))[0]).manhattanDistanceTo(((Coordinate[])Conversions.unwrapArray(el, Coordinate.class))[1]);
      int _plus_3 = (_manhattanDistanceTo + 1);
      BigInteger _valueOf_1 = BigInteger.valueOf(_plus_3);
      return acc.add(_valueOf_1);
    };
    BigInteger _fold = IterableExtensions.<HashSet<Coordinate>, BigInteger>fold(overSize.getValue().getKey(), BigInteger.ZERO, _function_6);
    final BigInteger size = _plus_2.add(_fold);
    InputOutput.<BigInteger>println(size);
  }

  public static HashSet<Rectangle> smartSearch(final ArrayList<Pair<Rectangle, Rectangle>> all_rectangles, final Set<Coordinate> inside) {
    HashSet<Rectangle> _xblockexpression = null;
    {
      final HashSet<Rectangle> output = CollectionLiterals.<Rectangle>newHashSet();
      final List<Coordinate> sorted_coords = IterableExtensions.<Coordinate>sort(inside);
      int left = 0;
      int right = sorted_coords.size();
      final Function1<Pair<Rectangle, Rectangle>, Rectangle> _function = (Pair<Rectangle, Rectangle> it) -> {
        return it.getKey();
      };
      List<Pair<Rectangle, Rectangle>> _sortBy = IterableExtensions.<Pair<Rectangle, Rectangle>, Rectangle>sortBy(all_rectangles, _function);
      for (final Pair<Rectangle, Rectangle> current : _sortBy) {
        {
          right = sorted_coords.size();
          left = Arrays.binarySearch(((Object[])Conversions.unwrapArray(sorted_coords, Object.class)), left, right, current.getKey().top_left);
          if ((left < 0)) {
            left = ((-left) - 1);
          }
          right = Arrays.binarySearch(((Object[])Conversions.unwrapArray(sorted_coords, Object.class)), left, right, current.getKey().bot_right);
          if ((right < 0)) {
            right = ((-right) - 1);
          }
          final List<Coordinate> candidates = sorted_coords.subList(left, Math.min(right, sorted_coords.size()));
          final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
            return Boolean.valueOf(current.getKey().strictlyContains(it));
          };
          boolean _exists = IterableExtensions.<Coordinate>exists(candidates, _function_1);
          if (_exists) {
            output.add(current.getValue());
          }
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
}
