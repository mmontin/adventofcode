package advent2022;

import adventutils.geometry.Coordinate;
import adventutils.geometry.Dir;
import adventutils.geometry.Direction;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Day9 {
  private static Coordinate head = new Coordinate();

  private static Coordinate tail = new Coordinate();

  private static Set<Coordinate> tail_positions = CollectionLiterals.<Coordinate>newHashSet(Day9.tail);

  private static ArrayList<Coordinate> rope = new Function0<ArrayList<Coordinate>>() {
    @Override
    public ArrayList<Coordinate> apply() {
      ArrayList<Coordinate> _xblockexpression = null;
      {
        final ArrayList<Coordinate> ans = CollectionLiterals.<Coordinate>newArrayList();
        final Consumer<Integer> _function = (Integer it) -> {
          Coordinate _coordinate = new Coordinate();
          ans.add(_coordinate);
        };
        new IntegerRange(1, 10).forEach(_function);
        _xblockexpression = ans;
      }
      return _xblockexpression;
    }
  }.apply();

  private static Set<Coordinate> long_tail_positions = CollectionLiterals.<Coordinate>newHashSet(Day9.rope.get(9));

  public static void main(final String[] args) {
    final Consumer<String> _function = (String it) -> {
      final String[] split = it.split(" ");
      final Direction direction = Dir.directionFromString(split[0]);
      int _parseInt = Integer.parseInt(split[1]);
      final Consumer<Integer> _function_1 = (Integer i) -> {
        Day9.head = Day9.head.move(direction);
        Day9.tail = Day9.newPosition(Day9.head, Day9.tail);
        Day9.tail_positions.add(Day9.tail);
        Day9.rope.set(0, Day9.rope.get(0).move(direction));
        final Consumer<Integer> _function_2 = (Integer j) -> {
          Day9.rope.set(((j).intValue() + 1), Day9.newPosition(Day9.rope.get((j).intValue()), Day9.rope.get(((j).intValue() + 1))));
        };
        new ExclusiveRange(0, 9, true).forEach(_function_2);
        Day9.long_tail_positions.add(Day9.rope.get(9));
      };
      new ExclusiveRange(0, _parseInt, true).forEach(_function_1);
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(9)).getInputs().forEach(_function);
    InputOutput.<Integer>println(Integer.valueOf(Day9.tail_positions.size()));
    InputOutput.<Integer>print(Integer.valueOf(Day9.long_tail_positions.size()));
  }

  public static Coordinate newPosition(final Coordinate _head, final Coordinate _tail) {
    Coordinate _xblockexpression = null;
    {
      final int distance = _head.manhattanDistanceTo(_tail);
      Coordinate _xifexpression = null;
      if (((_tail.getX() == (_head.getX() - 2)) && (distance < 4))) {
        int _x = _head.getX();
        int _minus = (_x - 1);
        int _y = _head.getY();
        _xifexpression = new Coordinate(_minus, _y);
      } else {
        Coordinate _xifexpression_1 = null;
        if (((_tail.getX() == (_head.getX() + 2)) && (distance < 4))) {
          int _x_1 = _head.getX();
          int _plus = (_x_1 + 1);
          int _y_1 = _head.getY();
          _xifexpression_1 = new Coordinate(_plus, _y_1);
        } else {
          Coordinate _xifexpression_2 = null;
          if (((_tail.getY() == (_head.getY() - 2)) && (distance < 4))) {
            int _x_2 = _head.getX();
            int _y_2 = _head.getY();
            int _minus_1 = (_y_2 - 1);
            _xifexpression_2 = new Coordinate(_x_2, _minus_1);
          } else {
            Coordinate _xifexpression_3 = null;
            if (((_tail.getY() == (_head.getY() + 2)) && (distance < 4))) {
              int _x_3 = _head.getX();
              int _y_3 = _head.getY();
              int _plus_1 = (_y_3 + 1);
              _xifexpression_3 = new Coordinate(_x_3, _plus_1);
            } else {
              Coordinate _xifexpression_4 = null;
              if ((distance == 4)) {
                int _x_4 = _head.getX();
                int _x_5 = _tail.getX();
                int _plus_2 = (_x_4 + _x_5);
                int _divide = (_plus_2 / 2);
                int _y_4 = _head.getY();
                int _y_5 = _tail.getY();
                int _plus_3 = (_y_4 + _y_5);
                int _divide_1 = (_plus_3 / 2);
                _xifexpression_4 = new Coordinate(_divide, _divide_1);
              } else {
                _xifexpression_4 = _tail;
              }
              _xifexpression_3 = _xifexpression_4;
            }
            _xifexpression_2 = _xifexpression_3;
          }
          _xifexpression_1 = _xifexpression_2;
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
