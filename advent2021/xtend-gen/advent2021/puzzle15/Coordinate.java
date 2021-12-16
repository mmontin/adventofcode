package advent2021.puzzle15;

import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Coordinate {
  private int x;
  
  private int y;
  
  private int distance;
  
  private int height;
  
  public Coordinate(final int x_, final int y_, final int height_) {
    this.x = x_;
    this.y = y_;
    int _xifexpression = (int) 0;
    if (((this.x == 0) && (this.y == 0))) {
      _xifexpression = 0;
    } else {
      _xifexpression = Integer.MAX_VALUE;
    }
    this.distance = _xifexpression;
    this.height = height_;
  }
  
  public int getDistance() {
    return this.distance;
  }
  
  public int updateDistance(final Coordinate previous) {
    int _xifexpression = (int) 0;
    if (((previous.distance + this.height) < this.distance)) {
      _xifexpression = this.distance = (previous.distance + this.height);
    }
    return _xifexpression;
  }
  
  public int getHeight() {
    return this.height;
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
    final int tmp = (this.y + ((this.x + 1) / 2));
    return (this.x + (tmp * tmp));
  }
  
  public Iterable<Coordinate> neighbours(final Set<Coordinate> possible) {
    final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
      public Boolean apply(final Coordinate it) {
        return Boolean.valueOf((((it.x == Coordinate.this.x) && ((it.y == (Coordinate.this.y + 1)) || (it.y == (Coordinate.this.y - 1)))) || ((it.y == Coordinate.this.y) && ((it.x == (Coordinate.this.x + 1)) || (it.x == (Coordinate.this.x - 1))))));
      }
    };
    return IterableExtensions.<Coordinate>filter(possible, _function);
  }
  
  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
