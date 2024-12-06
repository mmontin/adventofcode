package advent2019;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day18 {
  public static class MyState extends Coordinate implements State {
    private Set<Character> current_keys;

    public MyState(final Coordinate c, final Set<Character> current_keys_) {
      super(c);
      this.current_keys = current_keys_;
    }

    @Override
    public String toString() {
      String _string = super.toString();
      String _plus = ("[" + _string);
      String _plus_1 = (_plus + " ; ");
      String _plus_2 = (_plus_1 + this.current_keys);
      return (_plus_2 + "]");
    }

    @Override
    public int hashCode() {
      int _hashCode = super.hashCode();
      int _hashCode_1 = this.current_keys.hashCode();
      return (_hashCode * _hashCode_1);
    }

    @Override
    public boolean equals(final Object other) {
      boolean _xblockexpression = false;
      {
        final Day18.MyState otherState = ((Day18.MyState) other);
        _xblockexpression = (super.equals(otherState) && this.current_keys.equals(otherState.current_keys));
      }
      return _xblockexpression;
    }

    @Override
    public boolean isGoal() {
      return Integer.valueOf(this.current_keys.size()).equals(Integer.valueOf(Day18.keys.size()));
    }

    @Override
    public int minToGoal() {
      int _size = Day18.keys.size();
      int _size_1 = this.current_keys.size();
      return (_size - _size_1);
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      HashSet<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        final HashSet<Pair<? extends State, Integer>> output = CollectionLiterals.<Pair<? extends State, Integer>>newHashSet();
        final Consumer<Coordinate> _function = (Coordinate it) -> {
          final HashSet<Character> next_keys = new HashSet<Character>(this.current_keys);
          boolean _containsKey = Day18.keys.containsKey(it);
          if (_containsKey) {
            next_keys.add(Day18.keys.get(it));
            Day18.MyState _myState = new Day18.MyState(it, next_keys);
            Pair<Day18.MyState, Integer> _mappedTo = Pair.<Day18.MyState, Integer>of(_myState, Integer.valueOf(1));
            output.add(_mappedTo);
          } else {
            boolean _contains = Day18.free.contains(it);
            if (_contains) {
              Day18.MyState _myState_1 = new Day18.MyState(it, next_keys);
              Pair<Day18.MyState, Integer> _mappedTo_1 = Pair.<Day18.MyState, Integer>of(_myState_1, Integer.valueOf(1));
              output.add(_mappedTo_1);
            } else {
              if ((Day18.doors.containsKey(it) && IterableExtensions.<Character>exists(this.current_keys, ((Function1<Character, Boolean>) (Character k) -> {
                return Boolean.valueOf(Day18.doors.get(it).equals(Character.valueOf(Character.toUpperCase((k).charValue()))));
              })))) {
                Day18.MyState _myState_2 = new Day18.MyState(it, next_keys);
                Pair<Day18.MyState, Integer> _mappedTo_2 = Pair.<Day18.MyState, Integer>of(_myState_2, Integer.valueOf(1));
                output.add(_mappedTo_2);
              }
            }
          }
        };
        super.noDiagonalUnboundedNeighbours().forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }

  private static final List<List<Character>> inputs = ListExtensions.<String, List<Character>>map(new InputLoader(Integer.valueOf(2019), Integer.valueOf(18)).getInputs(), ((Function1<String, List<Character>>) (String it) -> {
    return IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())));
  }));

  private static final int rows = Day18.inputs.size();

  private static final int cols = Day18.inputs.get(0).size();

  private static Coordinate start;

  private static final Map<Coordinate, Character> keys = CollectionLiterals.<Coordinate, Character>newHashMap();

  private static final Map<Coordinate, Character> doors = CollectionLiterals.<Coordinate, Character>newHashMap();

  private static final Set<Coordinate> free = new Function0<Set<Coordinate>>() {
    @Override
    public Set<Coordinate> apply() {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final HashSet<Coordinate> ans = CollectionLiterals.<Coordinate>newHashSet();
        List<Character> current_line = null;
        Coordinate current_coord = null;
        IntegerRange _upTo = new IntegerRange(0, (Day18.rows - 1));
        for (final Integer i : _upTo) {
          {
            current_line = Day18.inputs.get((i).intValue());
            IntegerRange _upTo_1 = new IntegerRange(0, (Day18.cols - 1));
            for (final Integer j : _upTo_1) {
              {
                Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
                current_coord = _coordinate;
                Character _get = current_line.get((j).intValue());
                final Character c = _get;
                boolean _matched = false;
                boolean _equals = (c + "").equals(".");
                if (_equals) {
                  _matched=true;
                  ans.add(current_coord);
                }
                if (!_matched) {
                  boolean _equals_1 = (c + "").equals("@");
                  if (_equals_1) {
                    _matched=true;
                    Day18.start = current_coord;
                    ans.add(current_coord);
                  }
                }
                if (!_matched) {
                  boolean _isLowerCase = Character.isLowerCase((c).charValue());
                  if (_isLowerCase) {
                    _matched=true;
                    Day18.keys.put(current_coord, c);
                    ans.add(current_coord);
                  }
                }
                if (!_matched) {
                  boolean _isUpperCase = Character.isUpperCase((c).charValue());
                  if (_isUpperCase) {
                    _matched=true;
                    Day18.doors.put(current_coord, c);
                  }
                }
              }
            }
          }
        }
        _xblockexpression = ans;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    HashSet<Character> _newHashSet = CollectionLiterals.<Character>newHashSet();
    Day18.MyState _myState = new Day18.MyState(Day18.start, _newHashSet);
    final AStar runner = new AStar(_myState);
    runner.run();
    InputOutput.<Integer>println(runner.run().getMinDistance());
  }
}
