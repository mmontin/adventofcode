package advent2021.puzzle20;

@SuppressWarnings("all")
public class Coordinate {
  protected int x;
  
  protected int y;
  
  public Coordinate(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
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
  
  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
