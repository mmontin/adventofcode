package advent2018;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day18 {
  public static class Map {
    private final Set<Coordinate> lumberjacks;

    private final Set<Coordinate> trees;

    private final String rep;

    private final int code;

    public Map(final Set<Coordinate> _lumberjacks, final Set<Coordinate> _trees) {
      this.lumberjacks = _lumberjacks;
      this.trees = _trees;
      this.rep = this.toString();
      this.code = this.rep.hashCode();
    }

    public Map() {
      this.lumberjacks = CollectionLiterals.<Coordinate>newHashSet();
      this.trees = CollectionLiterals.<Coordinate>newHashSet();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Day18.lines, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          final char[] line = Day18.input.get((i).intValue()).toCharArray();
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, Day18.cols, true);
          for (final Integer j : _doubleDotLessThan_1) {
            char _get = line[(j).intValue()];
            String _plus = (Character.valueOf(_get) + "");
            if (_plus != null) {
              switch (_plus) {
                case "|":
                  Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
                  this.trees.add(_coordinate);
                  break;
                case "#":
                  Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
                  this.lumberjacks.add(_coordinate_1);
                  break;
              }
            }
          }
        }
      }
      this.rep = this.toString();
      this.code = this.rep.hashCode();
    }

    public int value() {
      int _size = this.lumberjacks.size();
      int _size_1 = this.trees.size();
      return (_size * _size_1);
    }

    @Override
    public String toString() {
      String _xblockexpression = null;
      {
        String s = "";
        IntegerRange _upTo = new IntegerRange(0, (Day18.lines - 1));
        for (final Integer i : _upTo) {
          {
            String line = "";
            IntegerRange _upTo_1 = new IntegerRange(0, (Day18.cols - 1));
            for (final Integer j : _upTo_1) {
              {
                Coordinate current = new Coordinate((i).intValue(), (j).intValue());
                String _line = line;
                String _xifexpression = null;
                boolean _contains = this.trees.contains(current);
                if (_contains) {
                  _xifexpression = "|";
                } else {
                  String _xifexpression_1 = null;
                  boolean _contains_1 = this.lumberjacks.contains(current);
                  if (_contains_1) {
                    _xifexpression_1 = "#";
                  } else {
                    _xifexpression_1 = ".";
                  }
                  _xifexpression = _xifexpression_1;
                }
                line = (_line + _xifexpression);
              }
            }
            String _s = s;
            s = (_s + (line + "\n"));
          }
        }
        _xblockexpression = s;
      }
      return _xblockexpression;
    }

    @Override
    public int hashCode() {
      return this.code;
    }

    @Override
    public boolean equals(final Object other) {
      return ((other instanceof Day18.Map) && ((Day18.Map) other).rep.equals(this.rep));
    }

    public Day18.Map round() {
      Day18.Map _xblockexpression = null;
      {
        final HashSet<Coordinate> newLumberjacks = CollectionLiterals.<Coordinate>newHashSet();
        final HashSet<Coordinate> newTrees = CollectionLiterals.<Coordinate>newHashSet();
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Day18.lines, true);
        for (final Integer i : _doubleDotLessThan) {
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, Day18.cols, true);
          for (final Integer j : _doubleDotLessThan_1) {
            {
              final Coordinate current = new Coordinate((i).intValue(), (j).intValue());
              final Iterable<Coordinate> neighbours = current.allAroundBoundedNeighbours(Day18.upperLeft, Day18.bottomRight);
              final Function1<Coordinate, Boolean> _function = (Coordinate c) -> {
                return Boolean.valueOf(this.trees.contains(c));
              };
              final int treeNeighbours = IterableExtensions.size(IterableExtensions.<Coordinate>filter(neighbours, _function));
              final Function1<Coordinate, Boolean> _function_1 = (Coordinate c) -> {
                return Boolean.valueOf(this.lumberjacks.contains(c));
              };
              final int lumberjackNeighbours = IterableExtensions.size(IterableExtensions.<Coordinate>filter(neighbours, _function_1));
              boolean _contains = this.trees.contains(current);
              if (_contains) {
                HashSet<Coordinate> _xifexpression = null;
                if ((lumberjackNeighbours >= 3)) {
                  _xifexpression = newLumberjacks;
                } else {
                  _xifexpression = newTrees;
                }
                _xifexpression.add(current);
              } else {
                boolean _contains_1 = this.lumberjacks.contains(current);
                if (_contains_1) {
                  if (((lumberjackNeighbours >= 1) && (treeNeighbours >= 1))) {
                    newLumberjacks.add(current);
                  }
                } else {
                  if ((treeNeighbours >= 3)) {
                    newTrees.add(current);
                  }
                }
              }
            }
          }
        }
        _xblockexpression = new Day18.Map(newLumberjacks, newTrees);
      }
      return _xblockexpression;
    }
  }

  private static final List<String> input = new InputLoader(Integer.valueOf(2018), Integer.valueOf(18)).getInputs();

  private static final int lines = Day18.input.size();

  private static final int cols = Day18.input.get(0).length();

  private static final Coordinate upperLeft = new Coordinate(0, 0);

  private static final Coordinate bottomRight = new Coordinate(Day18.lines, Day18.cols);

  public static void main(final String[] args) {
    Day18.Map current = new Day18.Map();
    ArrayList<Day18.Map> history = CollectionLiterals.<Day18.Map>newArrayList();
    while ((!history.contains(current))) {
      {
        history.add(current);
        current = current.round();
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(history.get(10).value()));
    final int offset = history.indexOf(current);
    int _size = history.size();
    final int slope = (_size - offset);
    InputOutput.<Integer>println(Integer.valueOf(history.get((((1000000000 - offset) % slope) + offset)).value()));
  }
}
