package adventutils.geometry;

import adventutils.maths.Arithmetics;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Coordinate implements Comparable<Coordinate> {
  private final int x;

  private final int y;

  private final int code;

  private final String representation;

  public Coordinate(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
    final int tmp = (this.y + ((this.x + 1) / 2));
    this.code = (this.x + (tmp * tmp));
    this.representation = (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }

  public Coordinate(final String s) {
    this(Integer.parseInt((s.split(",")[0]).trim()), Integer.parseInt((s.split(",")[1]).trim()));
  }

  public Coordinate(final Coordinate c) {
    this(c.x, c.y);
  }

  public Coordinate() {
    this(0, 0);
  }

  public int getX() {
    return this.x;
  }

  public Coordinate addX(final int x_) {
    return new Coordinate((this.x + x_), this.y);
  }

  public Coordinate addY(final int y_) {
    return new Coordinate(this.x, (this.y + y_));
  }

  public int getY() {
    return this.y;
  }

  public Coordinate right(final int max) {
    Coordinate _xifexpression = null;
    if (((this.y + 1) == max)) {
      _xifexpression = new Coordinate(this.x, 0);
    } else {
      _xifexpression = this.addY(1);
    }
    return _xifexpression;
  }

  public Coordinate down(final int max) {
    Coordinate _xifexpression = null;
    if (((this.x + 1) == max)) {
      _xifexpression = new Coordinate(0, this.y);
    } else {
      _xifexpression = this.addX(1);
    }
    return _xifexpression;
  }

  public Coordinate symByY(final int offset) {
    return new Coordinate(this.x, ((2 * offset) - this.y));
  }

  public Coordinate symByX(final int offset) {
    return new Coordinate(((2 * offset) - this.x), this.y);
  }

  public Coordinate scale(final int factor) {
    return new Coordinate((factor * this.x), (factor * this.y));
  }

  public Coordinate negate() {
    return new Coordinate((-this.x), (-this.y));
  }

  public Coordinate add(final Coordinate other) {
    return new Coordinate((this.x + other.x), (this.y + other.y));
  }

  public Coordinate subtract(final Coordinate other) {
    return new Coordinate((this.x - other.x), (this.y - other.y));
  }

  public Coordinate reduce() {
    Coordinate _xifexpression = null;
    if ((this.x == 0)) {
      float _signum = Math.signum(this.y);
      _xifexpression = new Coordinate(0, ((int) _signum));
    } else {
      Coordinate _xifexpression_1 = null;
      if ((this.y == 0)) {
        float _signum_1 = Math.signum(this.x);
        _xifexpression_1 = new Coordinate(((int) _signum_1), 0);
      } else {
        Coordinate _xblockexpression = null;
        {
          final int gcd = Math.abs(Arithmetics.gcd(this.x, this.y));
          _xblockexpression = new Coordinate((this.x / gcd), (this.y / gcd));
        }
        _xifexpression_1 = _xblockexpression;
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }

  public HashSet<Coordinate> allAroundUnboundedNeighbours() {
    Coordinate _coordinate = new Coordinate((this.x - 1), (this.y - 1));
    Coordinate _coordinate_1 = new Coordinate((this.x - 1), this.y);
    Coordinate _coordinate_2 = new Coordinate((this.x - 1), (this.y + 1));
    Coordinate _coordinate_3 = new Coordinate(this.x, (this.y - 1));
    Coordinate _coordinate_4 = new Coordinate(this.x, (this.y + 1));
    Coordinate _coordinate_5 = new Coordinate((this.x + 1), (this.y - 1));
    Coordinate _coordinate_6 = new Coordinate((this.x + 1), this.y);
    Coordinate _coordinate_7 = new Coordinate((this.x + 1), (this.y + 1));
    return CollectionLiterals.<Coordinate>newHashSet(_coordinate, _coordinate_1, _coordinate_2, _coordinate_3, _coordinate_4, _coordinate_5, _coordinate_6, _coordinate_7);
  }

  public HashSet<Coordinate> allAroundFilteredNeighbours(final Set<Coordinate> candidates) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final HashSet<Coordinate> output = this.allAroundUnboundedNeighbours();
      output.retainAll(candidates);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public Set<Coordinate> noDiagonalFilteredNeighbours(final Set<Coordinate> candidates) {
    Set<Coordinate> _xblockexpression = null;
    {
      final Set<Coordinate> output = this.noDiagonalUnboundedNeighbours();
      output.retainAll(candidates);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public Set<Coordinate> noDiagonalUnboundedNeighbours() {
    final Function1<Pair<Coordinate, Direction>, Coordinate> _function = (Pair<Coordinate, Direction> it) -> {
      return it.getKey();
    };
    return IterableExtensions.<Coordinate>toSet(IterableExtensions.<Pair<Coordinate, Direction>, Coordinate>map(this.noDiagonalUnboundedNeighboursWithDirection(), _function));
  }

  public HashSet<Pair<Coordinate, Direction>> noDiagonalUnboundedNeighboursWithDirection() {
    Coordinate _coordinate = new Coordinate((this.x - 1), this.y);
    Pair<Coordinate, Direction> _mappedTo = Pair.<Coordinate, Direction>of(_coordinate, Direction.UP);
    Coordinate _coordinate_1 = new Coordinate((this.x + 1), this.y);
    Pair<Coordinate, Direction> _mappedTo_1 = Pair.<Coordinate, Direction>of(_coordinate_1, Direction.DOWN);
    Coordinate _coordinate_2 = new Coordinate(this.x, (this.y - 1));
    Pair<Coordinate, Direction> _mappedTo_2 = Pair.<Coordinate, Direction>of(_coordinate_2, Direction.LEFT);
    Coordinate _coordinate_3 = new Coordinate(this.x, (this.y + 1));
    Pair<Coordinate, Direction> _mappedTo_3 = Pair.<Coordinate, Direction>of(_coordinate_3, Direction.RIGHT);
    return CollectionLiterals.<Pair<Coordinate, Direction>>newHashSet(_mappedTo, _mappedTo_1, _mappedTo_2, _mappedTo_3);
  }

  public HashSet<Coordinate> noDiagonalBoundedNeighbours(final int lowerBound, final int higherBound) {
    return this.noDiagonalBoundedNeighbours(lowerBound, higherBound, lowerBound, higherBound);
  }

  public HashSet<Coordinate> noDiagonalBoundedNeighbours(final int min_x, final int max_x, final int min_y, final int max_y) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      if ((this.x > min_x)) {
        Coordinate _coordinate = new Coordinate((this.x - 1), this.y);
        output.add(_coordinate);
      }
      if ((this.x < max_x)) {
        Coordinate _coordinate_1 = new Coordinate((this.x + 1), this.y);
        output.add(_coordinate_1);
      }
      if ((this.y > min_y)) {
        Coordinate _coordinate_2 = new Coordinate(this.x, (this.y - 1));
        output.add(_coordinate_2);
      }
      if ((this.y < max_y)) {
        Coordinate _coordinate_3 = new Coordinate(this.x, (this.y + 1));
        output.add(_coordinate_3);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public Iterable<Coordinate> allAroundBoundedNeighbours(final Coordinate upperLeft, final Coordinate bottomRight) {
    final Function1<Coordinate, Boolean> _function = (Coordinate c) -> {
      return Boolean.valueOf(((((c.x >= upperLeft.x) && (c.x < bottomRight.x)) && (c.y >= upperLeft.y)) && (c.y < bottomRight.y)));
    };
    return IterableExtensions.<Coordinate>filter(this.allAroundUnboundedNeighbours(), _function);
  }

  public int manhattanDistanceTo(final Coordinate other) {
    int _abs = Math.abs((other.x - this.x));
    int _abs_1 = Math.abs((other.y - this.y));
    return (_abs + _abs_1);
  }

  public double length() {
    double _pow = Math.pow(this.x, 2);
    double _pow_1 = Math.pow(this.y, 2);
    double _plus = (_pow + _pow_1);
    return Math.sqrt(_plus);
  }

  public int manhattanDistanceToZero() {
    Coordinate _coordinate = new Coordinate(0, 0);
    return this.manhattanDistanceTo(_coordinate);
  }

  public int distanceSquared(final Coordinate other) {
    int _xblockexpression = (int) 0;
    {
      final int side1 = (other.x - this.x);
      final int side2 = (other.y - this.y);
      _xblockexpression = ((side1 * side1) + (side2 * side2));
    }
    return _xblockexpression;
  }

  @Override
  public String toString() {
    return this.representation;
  }

  @Override
  public boolean equals(final Object o) {
    boolean _xblockexpression = false;
    {
      final Coordinate other = ((Coordinate) o);
      _xblockexpression = ((this.x == other.x) && (this.y == other.y));
    }
    return _xblockexpression;
  }

  @Override
  public int hashCode() {
    return this.code;
  }

  public Coordinate move(final Direction d) {
    Coordinate _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = this.addY(1);
          break;
        case DOWN:
          _switchResult = this.addY((-1));
          break;
        case RIGHT:
          _switchResult = this.addX(1);
          break;
        case LEFT:
          _switchResult = this.addX((-1));
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public Coordinate otherMove(final Direction d) {
    return this.otherMove(d, 1);
  }

  public Coordinate otherMove(final Direction d, final int distance) {
    Coordinate _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = this.addX((-distance));
          break;
        case DOWN:
          _switchResult = this.addX(distance);
          break;
        case RIGHT:
          _switchResult = this.addY(distance);
          break;
        case LEFT:
          _switchResult = this.addY((-distance));
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public Set<Coordinate> directedNeighbours(final Direction d) {
    HashSet<Coordinate> _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          Coordinate _coordinate = new Coordinate((this.x - 1), (this.y - 1));
          Coordinate _coordinate_1 = new Coordinate((this.x - 1), this.y);
          Coordinate _coordinate_2 = new Coordinate((this.x - 1), (this.y + 1));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate, _coordinate_1, _coordinate_2);
          break;
        case DOWN:
          Coordinate _coordinate_3 = new Coordinate((this.x + 1), (this.y - 1));
          Coordinate _coordinate_4 = new Coordinate((this.x + 1), this.y);
          Coordinate _coordinate_5 = new Coordinate((this.x + 1), (this.y + 1));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_3, _coordinate_4, _coordinate_5);
          break;
        case RIGHT:
          Coordinate _coordinate_6 = new Coordinate((this.x - 1), (this.y + 1));
          Coordinate _coordinate_7 = new Coordinate(this.x, (this.y + 1));
          Coordinate _coordinate_8 = new Coordinate((this.x + 1), (this.y + 1));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_6, _coordinate_7, _coordinate_8);
          break;
        case LEFT:
          Coordinate _coordinate_9 = new Coordinate((this.x - 1), (this.y - 1));
          Coordinate _coordinate_10 = new Coordinate(this.x, (this.y - 1));
          Coordinate _coordinate_11 = new Coordinate((this.x + 1), (this.y - 1));
          _switchResult = CollectionLiterals.<Coordinate>newHashSet(_coordinate_9, _coordinate_10, _coordinate_11);
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static HashSet<Coordinate> getAllCoordsOnLine(final Coordinate coordinate, final Coordinate coordinate2) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      if ((coordinate.x == coordinate2.x)) {
        Coordinate _xifexpression = null;
        if ((coordinate.y <= coordinate2.y)) {
          _xifexpression = coordinate;
        } else {
          _xifexpression = coordinate2;
        }
        final Coordinate _left = _xifexpression;
        Coordinate _xifexpression_1 = null;
        boolean _equals = _left.equals(coordinate);
        if (_equals) {
          _xifexpression_1 = coordinate2;
        } else {
          _xifexpression_1 = coordinate;
        }
        final Coordinate _right = _xifexpression_1;
        final Consumer<Integer> _function = (Integer it) -> {
          Coordinate _coordinate = new Coordinate(coordinate.x, (it).intValue());
          output.add(_coordinate);
        };
        new IntegerRange(_left.y, _right.y).forEach(_function);
      } else {
        Coordinate _xifexpression_2 = null;
        if ((coordinate.x <= coordinate2.x)) {
          _xifexpression_2 = coordinate;
        } else {
          _xifexpression_2 = coordinate2;
        }
        final Coordinate _up = _xifexpression_2;
        Coordinate _xifexpression_3 = null;
        boolean _equals_1 = _up.equals(coordinate);
        if (_equals_1) {
          _xifexpression_3 = coordinate2;
        } else {
          _xifexpression_3 = coordinate;
        }
        final Coordinate _down = _xifexpression_3;
        final Consumer<Integer> _function_1 = (Integer it) -> {
          Coordinate _coordinate = new Coordinate((it).intValue(), coordinate.y);
          output.add(_coordinate);
        };
        new IntegerRange(_up.x, _down.x).forEach(_function_1);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  @Override
  public int compareTo(final Coordinate other) {
    int _switchResult = (int) 0;
    int _compareTo = Integer.valueOf(this.x).compareTo(Integer.valueOf(other.x));
    final int value = _compareTo;
    switch (value) {
      case 0:
        _switchResult = Integer.valueOf(this.y).compareTo(Integer.valueOf(other.y));
        break;
      default:
        _switchResult = value;
        break;
    }
    return _switchResult;
  }

  public boolean includedIn(final int min_x, final int max_x, final int min_y, final int max_y) {
    return ((((min_x <= this.x) && (this.x <= max_x)) && (min_y <= this.y)) && (this.y <= max_y));
  }
}
