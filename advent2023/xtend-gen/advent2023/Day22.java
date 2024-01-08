package advent2023;

import adventutils.collection.BiMap;
import adventutils.geometry.Coordinate;
import adventutils.geometry.Rectangle;
import adventutils.input.InputLoader;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
public class Day22 {
  public static class Counter {
    private int nb;

    public Counter() {
      this.nb = 0;
    }

    public char next() {
      char _xblockexpression = (char) 0;
      {
        this.nb++;
        _xblockexpression = ((char) (this.nb + 64));
      }
      return _xblockexpression;
    }
  }

  public static class Scene {
    private Map<Coordinate, Pair<Integer, Day22.Brick>> max_ys;

    private BiMap<Day22.Brick, Day22.Brick> adjacency;

    private Set<Day22.Brick> all_bricks;

    public Scene(final List<Day22.Brick> all_bricks_) {
      this.max_ys = CollectionLiterals.<Coordinate, Pair<Integer, Day22.Brick>>newHashMap();
      BiMap<Day22.Brick, Day22.Brick> _biMap = new BiMap<Day22.Brick, Day22.Brick>();
      this.adjacency = _biMap;
      this.all_bricks = IterableExtensions.<Day22.Brick>toSet(all_bricks_);
      final Consumer<Day22.Brick> _function = (Day22.Brick it) -> {
        this.add(it);
      };
      all_bricks_.forEach(_function);
    }

    private void add(final Day22.Brick b) {
      final HashSet<Coordinate> xyFace = b.XYFace().allCoordinates();
      final Function1<Coordinate, Pair<Integer, Day22.Brick>> _function = (Coordinate it) -> {
        Pair<Integer, Day22.Brick> _mappedTo = Pair.<Integer, Day22.Brick>of(Integer.valueOf(0), null);
        return this.max_ys.getOrDefault(it, _mappedTo);
      };
      final Function1<Pair<Integer, Day22.Brick>, Integer> _function_1 = (Pair<Integer, Day22.Brick> it) -> {
        return it.getKey();
      };
      final Function1<Map.Entry<Integer, List<Pair<Integer, Day22.Brick>>>, Integer> _function_2 = (Map.Entry<Integer, List<Pair<Integer, Day22.Brick>>> it) -> {
        return it.getKey();
      };
      final Map.Entry<Integer, List<Pair<Integer, Day22.Brick>>> req = IterableExtensions.<Map.Entry<Integer, List<Pair<Integer, Day22.Brick>>>, Integer>maxBy(IterableExtensions.<Integer, Pair<Integer, Day22.Brick>>groupBy(IterableExtensions.<Coordinate, Pair<Integer, Day22.Brick>>map(xyFace, _function), _function_1).entrySet(), _function_2);
      final Integer height = req.getKey();
      b.descend(((height).intValue() + 1));
      final int newz = b.maxZ();
      final Consumer<Coordinate> _function_3 = (Coordinate it) -> {
        Pair<Integer, Day22.Brick> _mappedTo = Pair.<Integer, Day22.Brick>of(Integer.valueOf(newz), b);
        this.max_ys.put(it, _mappedTo);
      };
      xyFace.forEach(_function_3);
      if (((height).intValue() != 0)) {
        final Consumer<Pair<Integer, Day22.Brick>> _function_4 = (Pair<Integer, Day22.Brick> it) -> {
          this.adjacency.put(it.getValue(), b);
        };
        req.getValue().forEach(_function_4);
      }
    }

    public int numberOfBreakableBricks() {
      final Function1<Day22.Brick, Boolean> _function = (Day22.Brick brick) -> {
        final Function1<Day22.Brick, Boolean> _function_1 = (Day22.Brick it) -> {
          int _size = this.adjacency.right_left.get(it).size();
          return Boolean.valueOf((_size >= 2));
        };
        return Boolean.valueOf(IterableExtensions.<Day22.Brick>forall(this.adjacency.left_right.getOrDefault(brick, CollectionLiterals.<Day22.Brick>newHashSet()), _function_1));
      };
      return IterableExtensions.size(IterableExtensions.<Day22.Brick>filter(this.all_bricks, _function));
    }

    public Integer totalNumberOfReactions() {
      final Function2<Integer, Day22.Brick, Integer> _function = (Integer acc, Day22.Brick el) -> {
        int _chainReaction = this.chainReaction(el);
        return Integer.valueOf(((acc).intValue() + _chainReaction));
      };
      return IterableExtensions.<Day22.Brick, Integer>fold(this.all_bricks, Integer.valueOf(0), _function);
    }

    private int chainReaction(final Day22.Brick initial) {
      int _xblockexpression = (int) 0;
      {
        final BiMap<Day22.Brick, Day22.Brick> other_adjacency = new BiMap<Day22.Brick, Day22.Brick>(this.adjacency);
        Set<Day22.Brick> toRemove = CollectionLiterals.<Day22.Brick>newHashSet(initial);
        int nb = (-1);
        do {
          {
            int _nb = nb;
            int _size = toRemove.size();
            nb = (_nb + _size);
            final Function2<HashSet<Day22.Brick>, Day22.Brick, HashSet<Day22.Brick>> _function = (HashSet<Day22.Brick> acc, Day22.Brick el) -> {
              HashSet<Day22.Brick> _xblockexpression_1 = null;
              {
                acc.addAll(other_adjacency.rm(el));
                _xblockexpression_1 = acc;
              }
              return _xblockexpression_1;
            };
            toRemove = IterableExtensions.<Day22.Brick, HashSet<Day22.Brick>>fold(toRemove, CollectionLiterals.<Day22.Brick>newHashSet(), _function);
            final Function1<Day22.Brick, Boolean> _function_1 = (Day22.Brick it) -> {
              return Boolean.valueOf(other_adjacency.right_left.get(it).isEmpty());
            };
            toRemove = IterableExtensions.<Day22.Brick>toSet(IterableExtensions.<Day22.Brick>filter(toRemove, _function_1));
          }
        } while((!toRemove.isEmpty()));
        _xblockexpression = nb;
      }
      return _xblockexpression;
    }
  }

  public static class Brick {
    private String name;

    private IntegerRange x;

    private IntegerRange y;

    private IntegerRange z;

    public Brick(final String name_, final String s) {
      this.name = name_;
      final String[] split = s.split("~");
      final Function1<String, Integer> _function = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final List<Integer> left = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray((split[0]).split(","))), _function);
      final Function1<String, Integer> _function_1 = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final List<Integer> right = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray((split[1]).split(","))), _function_1);
      Integer _get = left.get(0);
      Integer _get_1 = right.get(0);
      IntegerRange _upTo = new IntegerRange((_get).intValue(), (_get_1).intValue());
      this.x = _upTo;
      Integer _get_2 = left.get(1);
      Integer _get_3 = right.get(1);
      IntegerRange _upTo_1 = new IntegerRange((_get_2).intValue(), (_get_3).intValue());
      this.y = _upTo_1;
      Integer _get_4 = left.get(2);
      Integer _get_5 = right.get(2);
      IntegerRange _upTo_2 = new IntegerRange((_get_4).intValue(), (_get_5).intValue());
      this.z = _upTo_2;
    }

    public int minZ() {
      return this.z.getStart();
    }

    public int maxZ() {
      return this.z.getEnd();
    }

    public IntegerRange descend(final int tz) {
      int _end = this.z.getEnd();
      int _plus = (tz + _end);
      int _start = this.z.getStart();
      int _minus = (_plus - _start);
      IntegerRange _upTo = new IntegerRange(tz, _minus);
      return this.z = _upTo;
    }

    public Rectangle XYFace() {
      int _start = this.x.getStart();
      int _end = this.x.getEnd();
      int _start_1 = this.y.getStart();
      int _end_1 = this.y.getEnd();
      return new Rectangle(_start, _end, _start_1, _end_1);
    }

    @Override
    public int hashCode() {
      return this.name.hashCode();
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day22.Brick) {
        _matched=true;
        _switchResult = this.name.equals(((Day22.Brick)other).name);
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    @Override
    public String toString() {
      int _start = this.x.getStart();
      int _end = this.x.getEnd();
      Coordinate _coordinate = new Coordinate(_start, _end);
      String _plus = ((this.name + " ; ") + _coordinate);
      String _plus_1 = (_plus + " ; ");
      int _start_1 = this.y.getStart();
      int _end_1 = this.y.getEnd();
      Coordinate _coordinate_1 = new Coordinate(_start_1, _end_1);
      String _plus_2 = (_plus_1 + _coordinate_1);
      String _plus_3 = (_plus_2 + " ; ");
      int _start_2 = this.z.getStart();
      int _end_2 = this.z.getEnd();
      Coordinate _coordinate_2 = new Coordinate(_start_2, _end_2);
      return (_plus_3 + _coordinate_2);
    }
  }

  public static void main(final String[] args) {
    final Day22.Counter counter = new Day22.Counter();
    final Function1<String, Day22.Brick> _function = (String it) -> {
      char _next = counter.next();
      String _plus = (Character.valueOf(_next) + "");
      return new Day22.Brick(_plus, it);
    };
    final Function1<Day22.Brick, Integer> _function_1 = (Day22.Brick it) -> {
      return Integer.valueOf(it.minZ());
    };
    final List<Day22.Brick> bricks = IterableExtensions.<Day22.Brick, Integer>sortBy(ListExtensions.<String, Day22.Brick>map(new InputLoader(Integer.valueOf(2023), Integer.valueOf(22)).getInputs(), _function), _function_1);
    final Day22.Scene scene = new Day22.Scene(bricks);
    InputOutput.<Integer>println(Integer.valueOf(scene.numberOfBreakableBricks()));
    InputOutput.<Integer>println(scene.totalNumberOfReactions());
  }
}
