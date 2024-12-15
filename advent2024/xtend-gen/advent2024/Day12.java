package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionExtensions;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day12 {
  public static class BorderedCoordinate {
    private Coordinate coord;

    private Set<Direction> borders;

    private Set<Coordinate> similarNeighbours;

    public BorderedCoordinate(final Coordinate c) {
      this.coord = c;
      this.borders = CollectionLiterals.<Direction>newHashSet();
      this.similarNeighbours = CollectionLiterals.<Coordinate>newHashSet();
      final Consumer<Pair<Coordinate, Direction>> _function = (Pair<Coordinate, Direction> neighbour) -> {
        String _get = Day12.coordinates.get(neighbour.getKey());
        String _get_1 = Day12.coordinates.get(c);
        boolean _equals = Objects.equals(_get, _get_1);
        if (_equals) {
          this.similarNeighbours.add(neighbour.getKey());
        } else {
          this.borders.add(neighbour.getValue());
        }
      };
      c.noDiagonalUnboundedNeighboursWithDirection().forEach(_function);
    }

    public int getBorderCount() {
      return this.borders.size();
    }

    public int similarBordersCount(final Day12.BorderedCoordinate other) {
      int _xifexpression = (int) 0;
      boolean _contains = this.similarNeighbours.contains(other.coord);
      if (_contains) {
        final Function1<Direction, Boolean> _function = (Direction it) -> {
          return Boolean.valueOf(other.borders.contains(it));
        };
        _xifexpression = IterableExtensions.size(IterableExtensions.<Direction>filter(this.borders, _function));
      } else {
        _xifexpression = 0;
      }
      return _xifexpression;
    }

    @Override
    public int hashCode() {
      return this.coord.hashCode();
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day12.BorderedCoordinate) {
        _matched=true;
        _switchResult = this.coord.equals(((Day12.BorderedCoordinate)other).coord);
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  private static List<List<String>> inputs = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(12)).getInputs(), ((Function1<String, List<String>>) (String it) -> {
    final Function1<Character, String> _function = (Character it_1) -> {
      return (it_1 + "");
    };
    return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
  }));

  private static int max_i = (Day12.inputs.size() - 1);

  private static int max_j = (Day12.inputs.get(0).size() - 1);

  private static HashMap<Coordinate, String> coordinates = new Function0<HashMap<Coordinate, String>>() {
    @Override
    public HashMap<Coordinate, String> apply() {
      HashMap<Coordinate, String> _xblockexpression = null;
      {
        final HashMap<Coordinate, String> output = CollectionLiterals.<Coordinate, String>newHashMap();
        IntegerRange _upTo = new IntegerRange(0, Day12.max_i);
        for (final Integer i : _upTo) {
          IntegerRange _upTo_1 = new IntegerRange(0, Day12.max_j);
          for (final Integer j : _upTo_1) {
            Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
            output.put(_coordinate, Day12.inputs.get((i).intValue()).get((j).intValue()));
          }
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    final ArrayList<HashSet<Day12.BorderedCoordinate>> areas = CollectionLiterals.<HashSet<Day12.BorderedCoordinate>>newArrayList();
    Set<Coordinate> _keySet = Day12.coordinates.keySet();
    final HashSet<Coordinate> remaining = new HashSet<Coordinate>(_keySet);
    while ((!remaining.isEmpty())) {
      {
        final Coordinate current = IterableExtensions.<Coordinate>head(remaining);
        remaining.remove(current);
        final HashSet<Day12.BorderedCoordinate> current_area = CollectionLiterals.<Day12.BorderedCoordinate>newHashSet();
        Day12.BorderedCoordinate _borderedCoordinate = new Day12.BorderedCoordinate(current);
        final HashSet<Day12.BorderedCoordinate> next_to_proceed = CollectionLiterals.<Day12.BorderedCoordinate>newHashSet(_borderedCoordinate);
        while ((!next_to_proceed.isEmpty())) {
          {
            current_area.addAll(next_to_proceed);
            final HashSet<Day12.BorderedCoordinate> next_next_to_proceed = CollectionLiterals.<Day12.BorderedCoordinate>newHashSet();
            for (final Day12.BorderedCoordinate c : next_to_proceed) {
              final Function1<Coordinate, Day12.BorderedCoordinate> _function = (Coordinate it) -> {
                return new Day12.BorderedCoordinate(it);
              };
              final Function1<Day12.BorderedCoordinate, Boolean> _function_1 = (Day12.BorderedCoordinate it) -> {
                boolean _contains = current_area.contains(it);
                return Boolean.valueOf((!_contains));
              };
              Iterables.<Day12.BorderedCoordinate>addAll(next_next_to_proceed, IterableExtensions.<Day12.BorderedCoordinate>filter(IterableExtensions.<Coordinate, Day12.BorderedCoordinate>map(c.similarNeighbours, _function), _function_1));
            }
            next_to_proceed.clear();
            next_to_proceed.addAll(next_next_to_proceed);
          }
        }
        areas.add(current_area);
        final Function1<Day12.BorderedCoordinate, Coordinate> _function = (Day12.BorderedCoordinate it) -> {
          return it.coord;
        };
        CollectionExtensions.<Coordinate>removeAll(remaining, IterableExtensions.<Day12.BorderedCoordinate, Coordinate>map(current_area, _function));
      }
    }
    final Function2<Integer, HashSet<Day12.BorderedCoordinate>, Integer> _function = (Integer acc, HashSet<Day12.BorderedCoordinate> el) -> {
      int _size = el.size();
      final Function2<Integer, Day12.BorderedCoordinate, Integer> _function_1 = (Integer acc1, Day12.BorderedCoordinate el1) -> {
        int _borderCount = el1.getBorderCount();
        return Integer.valueOf(((acc1).intValue() + _borderCount));
      };
      Integer _fold = IterableExtensions.<Day12.BorderedCoordinate, Integer>fold(el, Integer.valueOf(0), _function_1);
      int _multiply = (_size * (_fold).intValue());
      return Integer.valueOf(((acc).intValue() + _multiply));
    };
    InputOutput.<Integer>println(IterableExtensions.<HashSet<Day12.BorderedCoordinate>, Integer>fold(areas, Integer.valueOf(0), _function));
    final Function1<HashSet<Day12.BorderedCoordinate>, List<Day12.BorderedCoordinate>> _function_1 = (HashSet<Day12.BorderedCoordinate> it) -> {
      return IterableExtensions.<Day12.BorderedCoordinate>toList(it);
    };
    final Function2<Integer, List<Day12.BorderedCoordinate>, Integer> _function_2 = (Integer acc, List<Day12.BorderedCoordinate> el) -> {
      int _size = el.size();
      int _xblockexpression = (int) 0;
      {
        final Function2<Integer, Day12.BorderedCoordinate, Integer> _function_3 = (Integer acc1, Day12.BorderedCoordinate el1) -> {
          int _borderCount = el1.getBorderCount();
          return Integer.valueOf(((acc1).intValue() + _borderCount));
        };
        final Integer all_borders = IterableExtensions.<Day12.BorderedCoordinate, Integer>fold(el, Integer.valueOf(0), _function_3);
        final int size_el = el.size();
        int to_remove_borders = 0;
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, size_el, true);
        for (final Integer i : _doubleDotLessThan) {
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), size_el, true);
          for (final Integer j : _doubleDotLessThan_1) {
            int __remove_borders = to_remove_borders;
            int _similarBordersCount = el.get((i).intValue()).similarBordersCount(el.get((j).intValue()));
            to_remove_borders = (__remove_borders + _similarBordersCount);
          }
        }
        _xblockexpression = ((all_borders).intValue() - to_remove_borders);
      }
      int _multiply = (_size * _xblockexpression);
      return Integer.valueOf(((acc).intValue() + _multiply));
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Day12.BorderedCoordinate>, Integer>fold(ListExtensions.<HashSet<Day12.BorderedCoordinate>, List<Day12.BorderedCoordinate>>map(areas, _function_1), Integer.valueOf(0), _function_2));
  }
}
