package adventutils.geometry;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Rectangle implements Comparable<Rectangle> {
  private final IntegerRange x;

  private final IntegerRange y;

  public final int minX;

  public final int maxX;

  public final int minY;

  public final int maxY;

  public final Coordinate top_left;

  public final Coordinate top_right;

  public final Coordinate bot_left;

  public final Coordinate bot_right;

  public Rectangle(final int x1, final int x2, final int y1, final int y2) {
    IntegerRange _xifexpression = null;
    if ((x1 <= x2)) {
      _xifexpression = new IntegerRange(x1, x2);
    } else {
      _xifexpression = new IntegerRange(x2, x1);
    }
    this.x = _xifexpression;
    IntegerRange _xifexpression_1 = null;
    if ((y1 <= y2)) {
      _xifexpression_1 = new IntegerRange(y1, y2);
    } else {
      _xifexpression_1 = new IntegerRange(y2, y1);
    }
    this.y = _xifexpression_1;
    this.minX = this.x.getStart();
    this.maxX = this.x.getEnd();
    this.minY = this.y.getStart();
    this.maxY = this.y.getEnd();
    Coordinate _coordinate = new Coordinate(this.minX, this.minY);
    this.top_left = _coordinate;
    Coordinate _coordinate_1 = new Coordinate(this.minX, this.maxY);
    this.top_right = _coordinate_1;
    Coordinate _coordinate_2 = new Coordinate(this.maxX, this.minY);
    this.bot_left = _coordinate_2;
    Coordinate _coordinate_3 = new Coordinate(this.maxX, this.maxY);
    this.bot_right = _coordinate_3;
  }

  public BigInteger area() {
    BigInteger _valueOf = BigInteger.valueOf((this.maxY + 1));
    BigInteger _valueOf_1 = BigInteger.valueOf(this.minY);
    BigInteger _minus = _valueOf.subtract(_valueOf_1);
    BigInteger _valueOf_2 = BigInteger.valueOf((this.maxX + 1));
    BigInteger _valueOf_3 = BigInteger.valueOf(this.minX);
    BigInteger _minus_1 = _valueOf_2.subtract(_valueOf_3);
    return _minus.multiply(_minus_1);
  }

  public BigInteger innerArea() {
    BigInteger _valueOf = BigInteger.valueOf(this.maxY);
    BigInteger _valueOf_1 = BigInteger.valueOf((this.minY + 1));
    BigInteger _minus = _valueOf.subtract(_valueOf_1);
    BigInteger _valueOf_2 = BigInteger.valueOf(this.maxX);
    BigInteger _valueOf_3 = BigInteger.valueOf((this.minX + 1));
    BigInteger _minus_1 = _valueOf_2.subtract(_valueOf_3);
    return _minus.multiply(_minus_1);
  }

  public boolean contains(final Coordinate c) {
    return ((((this.minX <= c.getX()) && (c.getX() <= this.maxX)) && (this.minY <= c.getY())) && (c.getY() <= this.maxY));
  }

  public boolean strictlyContains(final Coordinate c) {
    return ((((this.minX < c.getX()) && (c.getX() < this.maxX)) && (this.minY < c.getY())) && (c.getY() < this.maxY));
  }

  public HashSet<HashSet<Coordinate>> borders() {
    return CollectionLiterals.<HashSet<Coordinate>>newHashSet(
      CollectionLiterals.<Coordinate>newHashSet(this.top_left, this.top_right), 
      CollectionLiterals.<Coordinate>newHashSet(this.bot_left, this.bot_right), 
      CollectionLiterals.<Coordinate>newHashSet(this.top_left, this.bot_left), 
      CollectionLiterals.<Coordinate>newHashSet(this.top_right, this.bot_right));
  }

  public Pair<HashSet<Coordinate>, HashSet<HashSet<Coordinate>>> bordersAndCorners() {
    HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet(this.top_left, this.top_right, this.bot_left, this.bot_right);
    HashSet<HashSet<Coordinate>> _newHashSet_1 = CollectionLiterals.<HashSet<Coordinate>>newHashSet(
      CollectionLiterals.<Coordinate>newHashSet(this.top_left.addY(1), this.top_right.addY((-1))), 
      CollectionLiterals.<Coordinate>newHashSet(this.bot_left.addY(1), this.bot_right.addY((-1))), 
      CollectionLiterals.<Coordinate>newHashSet(this.top_left.addX(1), this.bot_left.addX((-1))), 
      CollectionLiterals.<Coordinate>newHashSet(this.top_right.addX(1), this.bot_right.addX((-1))));
    return Pair.<HashSet<Coordinate>, HashSet<HashSet<Coordinate>>>of(_newHashSet, _newHashSet_1);
  }

  public HashSet<Coordinate> allCoordinates() {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      final Consumer<Integer> _function = (Integer i) -> {
        final Consumer<Integer> _function_1 = (Integer j) -> {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          output.add(_coordinate);
        };
        this.y.forEach(_function_1);
      };
      this.x.forEach(_function);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  @Override
  public int hashCode() {
    return ((this.minX * this.maxX) + (this.minY * this.maxY));
  }

  @Override
  public boolean equals(final Object other) {
    boolean _xblockexpression = false;
    {
      final Rectangle o = ((Rectangle) other);
      _xblockexpression = ((((this.minX == o.minX) && (this.maxY == o.maxY)) && (this.minY == o.minY)) && (this.maxY == o.maxY));
    }
    return _xblockexpression;
  }

  @Override
  public int compareTo(final Rectangle other) {
    int _xblockexpression = (int) 0;
    {
      final int one = this.top_left.compareTo(other.top_left);
      int _xifexpression = (int) 0;
      if ((one == 0)) {
        _xifexpression = this.bot_right.compareTo(other.bot_right);
      } else {
        _xifexpression = one;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
