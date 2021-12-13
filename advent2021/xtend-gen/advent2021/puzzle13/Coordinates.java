package advent2021.puzzle13;

@SuppressWarnings("all")
public class Coordinates {
  private int x;
  
  private int y;
  
  public Coordinates(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
  }
  
  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public Coordinates(final String s) {
    this.x = Integer.parseInt(s.split(",")[0]);
    this.y = Integer.parseInt(s.split(",")[1]);
  }
  
  public Coordinates symByY(final int offset) {
    return new Coordinates(this.x, ((-this.y) + (2 * offset)));
  }
  
  public Coordinates symByX(final int offset) {
    return new Coordinates(((-this.x) + (2 * offset)), this.y);
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
  
  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
