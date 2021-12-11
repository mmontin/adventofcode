package advent2016.puzzle1;

@SuppressWarnings("all")
public class Coordinates {
  private int x;
  
  private int y;
  
  public Coordinates(final Coordinates other) {
    this(other.x, other.y);
  }
  
  public Coordinates(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
  }
  
  public int addX(final int add) {
    int _x = this.x;
    return this.x = (_x + add);
  }
  
  public int addY(final int add) {
    int _y = this.y;
    return this.y = (_y + add);
  }
  
  public boolean equals(final Object o) {
    boolean _xblockexpression = false;
    {
      final Coordinates other = ((Coordinates) o);
      _xblockexpression = ((this.x == other.x) && (this.y == other.y));
    }
    return _xblockexpression;
  }
  
  public int hashCode() {
    final int tmp = (this.y + ((this.x + 1) / 2));
    return (this.x + (tmp * tmp));
  }
  
  public int blocks() {
    int _abs = Math.abs(this.x);
    int _abs_1 = Math.abs(this.y);
    return (_abs + _abs_1);
  }
  
  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
