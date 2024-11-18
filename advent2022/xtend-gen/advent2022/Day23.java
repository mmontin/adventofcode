package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day23 {
  private static final List<char[]> input = ListExtensions.<String, char[]>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(23)).getInputs(), ((Function1<String, char[]>) (String it) -> {
    return it.toCharArray();
  }));

  private static final Set<Coordinate> elves = CollectionLiterals.<Coordinate>newHashSet();

  private static final List<Direction> propositions = CollectionLiterals.<Direction>newArrayList();

  public static void init() {
    Day23.propositions.clear();
    Day23.propositions.addAll(CollectionLiterals.<Direction>newArrayList(Direction.UP, Direction.DOWN, Direction.LEFT, Direction.RIGHT));
    Day23.elves.clear();
    int _size = Day23.input.size();
    final Consumer<Integer> _function = (Integer i) -> {
      int _size_1 = ((List<Character>)Conversions.doWrapArray(Day23.input.get(0))).size();
      final Consumer<Integer> _function_1 = (Integer j) -> {
        char _get = Day23.input.get((i).intValue())[(j).intValue()];
        boolean _equals = (Character.valueOf(_get) + "").equals("#");
        if (_equals) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          Day23.elves.add(_coordinate);
        }
      };
      new ExclusiveRange(0, _size_1, true).forEach(_function_1);
    };
    new ExclusiveRange(0, _size, true).forEach(_function);
  }

  public static void main(final String[] args) {
    Day23.init();
    final Consumer<Integer> _function = (Integer it) -> {
      Day23.round();
    };
    new ExclusiveRange(0, 10, true).forEach(_function);
    final Function1<Coordinate, Integer> _function_1 = (Coordinate it) -> {
      return Integer.valueOf(it.getX());
    };
    final int minX = IterableExtensions.<Coordinate, Integer>minBy(Day23.elves, _function_1).getX();
    final Function1<Coordinate, Integer> _function_2 = (Coordinate it) -> {
      return Integer.valueOf(it.getX());
    };
    final int maxX = IterableExtensions.<Coordinate, Integer>maxBy(Day23.elves, _function_2).getX();
    final Function1<Coordinate, Integer> _function_3 = (Coordinate it) -> {
      return Integer.valueOf(it.getY());
    };
    final int minY = IterableExtensions.<Coordinate, Integer>minBy(Day23.elves, _function_3).getY();
    final Function1<Coordinate, Integer> _function_4 = (Coordinate it) -> {
      return Integer.valueOf(it.getY());
    };
    final int maxY = IterableExtensions.<Coordinate, Integer>maxBy(Day23.elves, _function_4).getY();
    int _size = Day23.elves.size();
    int _minus = ((((maxX - minX) + 1) * ((maxY - minY) + 1)) - _size);
    InputOutput.<Integer>println(Integer.valueOf(_minus));
    Day23.init();
    int i = 0;
    do {
      i++;
    } while(Day23.round());
    InputOutput.<Integer>println(Integer.valueOf(i));
  }

  public static boolean round() {
    boolean _xblockexpression = false;
    {
      final HashMap<Coordinate, HashSet<Coordinate>> proposals = CollectionLiterals.<Coordinate, HashSet<Coordinate>>newHashMap();
      final Consumer<Coordinate> _function = (Coordinate elf) -> {
        final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
          boolean _contains = Day23.elves.contains(it);
          return Boolean.valueOf((!_contains));
        };
        final Set<Coordinate> empty_neighbours = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate>filter(elf.allAroundUnboundedNeighbours(), _function_1));
        int _size = empty_neighbours.size();
        boolean _notEquals = (_size != 8);
        if (_notEquals) {
          boolean proposition_made = false;
          int i = 0;
          while (((!proposition_made) && (i < 4))) {
            {
              final Direction current_direction = Day23.propositions.get(i);
              final Set<Coordinate> current_proposal = elf.directedNeighbours(current_direction);
              boolean _containsAll = empty_neighbours.containsAll(current_proposal);
              if (_containsAll) {
                proposition_made = true;
                final BiFunction<HashSet<Coordinate>, HashSet<Coordinate>, HashSet<Coordinate>> _function_2 = (HashSet<Coordinate> s1, HashSet<Coordinate> s2) -> {
                  HashSet<Coordinate> _xblockexpression_1 = null;
                  {
                    s1.addAll(s2);
                    _xblockexpression_1 = s1;
                  }
                  return _xblockexpression_1;
                };
                proposals.merge(elf.otherMove(current_direction), CollectionLiterals.<Coordinate>newHashSet(elf), _function_2);
              }
              i++;
            }
          }
        }
      };
      Day23.elves.forEach(_function);
      boolean has_moved = false;
      Set<Map.Entry<Coordinate, HashSet<Coordinate>>> _entrySet = proposals.entrySet();
      for (final Map.Entry<Coordinate, HashSet<Coordinate>> entry : _entrySet) {
        int _size = entry.getValue().size();
        boolean _equals = (_size == 1);
        if (_equals) {
          Day23.elves.remove(IterableExtensions.<Coordinate>head(entry.getValue()));
          Day23.elves.add(entry.getKey());
          has_moved = true;
        }
      }
      Day23.propositions.add(Day23.propositions.remove(0));
      _xblockexpression = has_moved;
    }
    return _xblockexpression;
  }
}
