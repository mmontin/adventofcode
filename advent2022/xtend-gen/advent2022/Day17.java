package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.math.BigInteger;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day17 {
  public static class Rock {
    private static int current_rock = 0;

    public static Day17.Rock next_rock() {
      Day17.Rock _xblockexpression = null;
      {
        final Day17.Rock output = new Day17.Rock(Day17.Rock.current_rock);
        Day17.Rock.current_rock = ((Day17.Rock.current_rock + 1) % 5);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    private Set<Coordinate> shape;

    public Rock(final int i) {
      final int starting_y = (Day17.max_y + 4);
      final int starting_x = 3;
      HashSet<Coordinate> _switchResult = null;
      switch (i) {
        case 0:
          Coordinate _coordinate = new Coordinate(starting_x, starting_y);
          Coordinate _coordinate_1 = new Coordinate((starting_x + 1), starting_y);
          Coordinate _coordinate_2 = new Coordinate((starting_x + 2), starting_y);
          Coordinate _coordinate_3 = new Coordinate((starting_x + 3), starting_y);
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate, _coordinate_1, _coordinate_2, _coordinate_3);
          break;
        case 1:
          Coordinate _coordinate_4 = new Coordinate(starting_x, (starting_y + 1));
          Coordinate _coordinate_5 = new Coordinate((starting_x + 1), (starting_y + 1));
          Coordinate _coordinate_6 = new Coordinate((starting_x + 2), (starting_y + 1));
          Coordinate _coordinate_7 = new Coordinate((starting_x + 1), starting_y);
          Coordinate _coordinate_8 = new Coordinate((starting_x + 1), (starting_y + 2));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_4, _coordinate_5, _coordinate_6, _coordinate_7, _coordinate_8);
          break;
        case 2:
          Coordinate _coordinate_9 = new Coordinate(starting_x, starting_y);
          Coordinate _coordinate_10 = new Coordinate((starting_x + 1), starting_y);
          Coordinate _coordinate_11 = new Coordinate((starting_x + 2), starting_y);
          Coordinate _coordinate_12 = new Coordinate((starting_x + 2), (starting_y + 1));
          Coordinate _coordinate_13 = new Coordinate((starting_x + 2), (starting_y + 2));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_9, _coordinate_10, _coordinate_11, _coordinate_12, _coordinate_13);
          break;
        case 3:
          Coordinate _coordinate_14 = new Coordinate(starting_x, starting_y);
          Coordinate _coordinate_15 = new Coordinate(starting_x, (starting_y + 1));
          Coordinate _coordinate_16 = new Coordinate(starting_x, (starting_y + 2));
          Coordinate _coordinate_17 = new Coordinate(starting_x, (starting_y + 3));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_14, _coordinate_15, _coordinate_16, _coordinate_17);
          break;
        default:
          Coordinate _coordinate_18 = new Coordinate(starting_x, starting_y);
          Coordinate _coordinate_19 = new Coordinate(starting_x, (starting_y + 1));
          Coordinate _coordinate_20 = new Coordinate((starting_x + 1), starting_y);
          Coordinate _coordinate_21 = new Coordinate((starting_x + 1), (starting_y + 1));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_18, _coordinate_19, _coordinate_20, _coordinate_21);
          break;
      }
      this.shape = _switchResult;
    }

    public boolean move(final Direction d) {
      boolean _xblockexpression = false;
      {
        final Function1<Coordinate, Coordinate> _function = new Function1<Coordinate, Coordinate>() {
          public Coordinate apply(final Coordinate it) {
            return it.move(d);
          }
        };
        final Set<Coordinate> new_shape = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(this.shape, _function));
        final Function1<Coordinate, Boolean> _function_1 = new Function1<Coordinate, Boolean>() {
          public Boolean apply(final Coordinate it) {
            return Boolean.valueOf((((Day17.filled.contains(it) || (it.getX() <= Day17.left_border)) || (it.getX() >= Day17.right_border)) || (it.getY() <= 0)));
          }
        };
        final boolean intersects = IterableExtensions.<Coordinate>exists(new_shape, _function_1);
        if ((!intersects)) {
          this.shape = new_shape;
        }
        _xblockexpression = (!intersects);
      }
      return _xblockexpression;
    }

    public int cement() {
      int _xblockexpression = (int) 0;
      {
        Day17.filled.addAll(this.shape);
        final Function1<Coordinate, Integer> _function = new Function1<Coordinate, Integer>() {
          public Integer apply(final Coordinate it) {
            return Integer.valueOf(it.getY());
          }
        };
        _xblockexpression = Day17.max_y = Math.max(Day17.max_y, IterableExtensions.<Coordinate, Integer>maxBy(this.shape, _function).getY());
      }
      return _xblockexpression;
    }
  }

  private static final List<Direction> movements = ListExtensions.<Character, Direction>map(((List<Character>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2022), Integer.valueOf(17)).getInputs()).toCharArray())), new Function1<Character, Direction>() {
    public Direction apply(final Character it) {
      String _plus = (it + "");
      return Dir.fromLeftRight(_plus);
    }
  });

  private static final int movements_size = Day17.movements.size();

  private static final int left_border = 0;

  private static final int right_border = 8;

  private static final Set<Coordinate> filled = CollectionLiterals.<Coordinate>newHashSet();

  private static int max_y = 0;

  public static void main(final String[] args) {
    Day17.initialize_simulation();
    Day17.simulate(2022);
    InputOutput.<Integer>println(Integer.valueOf(Day17.max_y));
    Day17.initialize_simulation();
    final BigInteger to_reach = new BigInteger("1000000000000");
    final BigInteger first = BigInteger.valueOf(1724);
    final BigInteger without_first = to_reach.subtract(first);
    final BigInteger size_repeat = BigInteger.valueOf(1725);
    final BigInteger remainder = without_first.mod(size_repeat);
    final BigInteger divisor = without_first.divide(size_repeat);
    int _intValue = remainder.intValue();
    int _plus = (1724 + _intValue);
    Day17.simulate(_plus);
    InputOutput.<BigInteger>println(BigInteger.valueOf(Day17.max_y).add(divisor.multiply(BigInteger.valueOf(2630))));
  }

  public static int find_sweet_spot() {
    int _xblockexpression = (int) 0;
    {
      int number_of_rocks = 0;
      int current_movement = 0;
      do {
        {
          current_movement = Day17.simulation_step(current_movement);
          number_of_rocks++;
          if ((current_movement == 0)) {
            String _plus = (Integer.valueOf(number_of_rocks) + " ; ");
            String _plus_1 = (_plus + Integer.valueOf(Day17.max_y));
            InputOutput.<String>println(_plus_1);
          }
        }
      } while((!(((number_of_rocks % 5) == 0) && (current_movement == 0))));
      _xblockexpression = number_of_rocks;
    }
    return _xblockexpression;
  }

  public static int initialize_simulation() {
    int _xblockexpression = (int) 0;
    {
      Day17.filled.clear();
      Day17.max_y = 0;
      _xblockexpression = Day17.Rock.current_rock = 0;
    }
    return _xblockexpression;
  }

  public static int simulation_step(final int next_movement) {
    int _xblockexpression = (int) 0;
    {
      int current_movement = next_movement;
      Day17.Rock current_rock = Day17.Rock.next_rock();
      boolean has_moved = true;
      while (has_moved) {
        {
          current_rock.move(Day17.movements.get(current_movement));
          current_movement = ((current_movement + 1) % Day17.movements_size);
          has_moved = current_rock.move(Direction.DOWN);
        }
      }
      current_rock.cement();
      _xblockexpression = current_movement;
    }
    return _xblockexpression;
  }

  public static void simulate(final int number_of_rocks) {
    int current_movement = 0;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, number_of_rocks, true);
    for (final Integer i : _doubleDotLessThan) {
      current_movement = Day17.simulation_step(current_movement);
    }
  }
}
