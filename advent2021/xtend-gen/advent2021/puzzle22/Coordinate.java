package advent2021.puzzle22;

@SuppressWarnings("all")
public class Coordinate {
  protected int x;
  
  protected int y;
  
  protected int z;
  
  public Coordinate(final int x_, final int y_, final int z_) {
    this.x = x_;
    this.y = y_;
    this.z = z_;
  }
  
  public boolean equals(final Object o) {
    boolean _xblockexpression = false;
    {
      final Coordinate other = ((Coordinate) o);
      _xblockexpression = (((this.x == other.x) && (this.y == other.y)) && (this.z == other.z));
    }
    return _xblockexpression;
  }
  
  public int hashCode() {
    return ((this.x + this.y) + this.z);
  }
  
  public String toString() {
    return (((((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ",") + Integer.valueOf(this.z)) + ")");
  }
}
