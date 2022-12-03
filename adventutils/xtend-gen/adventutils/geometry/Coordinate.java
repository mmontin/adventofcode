package adventutils.geometry;

import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Coordinate {
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
    this(Integer.parseInt(s.split(",")[0]), Integer.parseInt(s.split(",")[1]));
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
  
  public HashSet<Coordinate> noDiagonalUnboundedNeighbours() {
    Coordinate _coordinate = new Coordinate((this.x - 1), this.y);
    Coordinate _coordinate_1 = new Coordinate((this.x + 1), this.y);
    Coordinate _coordinate_2 = new Coordinate(this.x, (this.y - 1));
    Coordinate _coordinate_3 = new Coordinate(this.x, (this.y + 1));
    return CollectionLiterals.<Coordinate>newHashSet(_coordinate, _coordinate_1, _coordinate_2, _coordinate_3);
  }
  
  public HashSet<Coordinate> noDiagonalBoundedNeighbours(final int lowerBound, final int higherBound) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      if ((this.x > lowerBound)) {
        Coordinate _coordinate = new Coordinate((this.x - 1), this.y);
        output.add(_coordinate);
      }
      if ((this.x < higherBound)) {
        Coordinate _coordinate_1 = new Coordinate((this.x + 1), this.y);
        output.add(_coordinate_1);
      }
      if ((this.y > lowerBound)) {
        Coordinate _coordinate_2 = new Coordinate(this.x, (this.y - 1));
        output.add(_coordinate_2);
      }
      if ((this.y < higherBound)) {
        Coordinate _coordinate_3 = new Coordinate(this.x, (this.y + 1));
        output.add(_coordinate_3);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }
  
  public int manhattanDistanceTo(final Coordinate other) {
    int _abs = Math.abs((other.x - this.x));
    int _abs_1 = Math.abs((other.y - this.y));
    return (_abs + _abs_1);
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
  
  public String toString() {
    return this.representation;
  }
  
  public boolean equals(final Object o) {
    boolean _xblockexpression = false;
    {
      final Coordinate other = ((Coordinate) o);
      _xblockexpression = ((this.x == other.x) && (this.y == other.y));
    }
    return _xblockexpression;
  }
  
  public int hashCode() {
    return this.code;
  }
}
