package advent2021.puzzle9;

import java.util.HashSet;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Coordinates {
  private int x;
  
  private int y;
  
  public Coordinates(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
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
  
  public HashSet<Coordinates> neighbours() {
    Coordinates _coordinates = new Coordinates((this.x - 1), this.y);
    Coordinates _coordinates_1 = new Coordinates((this.x + 1), this.y);
    Coordinates _coordinates_2 = new Coordinates(this.x, (this.y - 1));
    Coordinates _coordinates_3 = new Coordinates(this.x, (this.y + 1));
    return CollectionLiterals.<Coordinates>newHashSet(_coordinates, _coordinates_1, _coordinates_2, _coordinates_3);
  }
  
  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
