package advent2016.puzzle1;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public enum Instruction {
    R,

    L,

    A;
  }

  public enum Direction {
    N,

    S,

    E,

    O;
  }

  private static final List<Launcher.Direction> directions = CollectionLiterals.<Launcher.Direction>newArrayList(Launcher.Direction.N, Launcher.Direction.E, Launcher.Direction.S, Launcher.Direction.O);

  private static Set<Coordinate> visited = CollectionLiterals.<Coordinate>newHashSet();

  private static Coordinate position = new Coordinate(0, 0);

  private static Launcher.Direction direction = Launcher.Direction.N;

  public static void main(final String[] args) {
    try {
      final List<String> input = IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2016), Integer.valueOf(1)).getInputReader().readLine().split(", "))));
      final Function2<ArrayList<Launcher.Instruction>, String, ArrayList<Launcher.Instruction>> _function = new Function2<ArrayList<Launcher.Instruction>, String, ArrayList<Launcher.Instruction>>() {
        public ArrayList<Launcher.Instruction> apply(final ArrayList<Launcher.Instruction> l, final String v) {
          ArrayList<Launcher.Instruction> _xblockexpression = null;
          {
            Launcher.Instruction _xifexpression = null;
            boolean _equals = v.substring(0, 1).equals("R");
            if (_equals) {
              _xifexpression = Launcher.Instruction.R;
            } else {
              _xifexpression = Launcher.Instruction.L;
            }
            l.add(_xifexpression);
            int _parseInt = Integer.parseInt(v.substring(1));
            final Consumer<Integer> _function = new Consumer<Integer>() {
              public void accept(final Integer it) {
                l.add(Launcher.Instruction.A);
              }
            };
            new ExclusiveRange(0, _parseInt, true).forEach(_function);
            _xblockexpression = l;
          }
          return _xblockexpression;
        }
      };
      final ArrayList<Launcher.Instruction> steps = IterableExtensions.<String, ArrayList<Launcher.Instruction>>fold(input, CollectionLiterals.<Launcher.Instruction>newArrayList(), _function);
      int i = 0;
      while ((!Launcher.visited.contains(Launcher.position))) {
        {
          Launcher.Instruction _get = steps.get(i);
          if (_get != null) {
            switch (_get) {
              case R:
                Launcher.turnRight();
                break;
              case L:
                Launcher.turnLeft();
                break;
              default:
                {
                  Launcher.visited.add(Launcher.position);
                  Launcher.advance(1);
                }
                break;
            }
          } else {
            {
              Launcher.visited.add(Launcher.position);
              Launcher.advance(1);
            }
          }
          i++;
        }
      }
      InputOutput.<Integer>println(Integer.valueOf(Launcher.position.manhattanDistanceToZero()));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public static Coordinate advance(final int length) {
    Coordinate _switchResult = null;
    final Launcher.Direction direction = Launcher.direction;
    if (direction != null) {
      switch (direction) {
        case N:
          _switchResult = Launcher.position.addX(length);
          break;
        case S:
          _switchResult = Launcher.position.addX((-length));
          break;
        case E:
          _switchResult = Launcher.position.addY(length);
          break;
        default:
          _switchResult = Launcher.position.addY((-length));
          break;
      }
    } else {
      _switchResult = Launcher.position.addY((-length));
    }
    return Launcher.position = _switchResult;
  }

  public static Launcher.Direction turnRight() {
    Launcher.Direction _xblockexpression = null;
    {
      int _indexOf = Launcher.directions.indexOf(Launcher.direction);
      final int pos = (_indexOf + 1);
      int _xifexpression = (int) 0;
      if ((pos == 4)) {
        _xifexpression = 0;
      } else {
        _xifexpression = pos;
      }
      _xblockexpression = Launcher.direction = Launcher.directions.get(_xifexpression);
    }
    return _xblockexpression;
  }

  public static Launcher.Direction turnLeft() {
    Launcher.Direction _xblockexpression = null;
    {
      int _indexOf = Launcher.directions.indexOf(Launcher.direction);
      final int pos = (_indexOf - 1);
      int _xifexpression = (int) 0;
      if ((pos == (-1))) {
        _xifexpression = 3;
      } else {
        _xifexpression = pos;
      }
      _xblockexpression = Launcher.direction = Launcher.directions.get(_xifexpression);
    }
    return _xblockexpression;
  }
}
