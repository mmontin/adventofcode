package advent2016.puzzle17;

import java.util.HashMap;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Coordinates {
  private final int x;

  private final int y;

  private final int hCode;

  public Coordinates(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
    final int tmp = (this.y + ((this.x + 1) / 2));
    this.hCode = (this.x + (tmp * tmp));
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
    return this.hCode;
  }

  public HashMap<String, Coordinates> neighbours(final List<Boolean> bools) {
    HashMap<String, Coordinates> _xblockexpression = null;
    {
      final HashMap<String, Coordinates> output = CollectionLiterals.<String, Coordinates>newHashMap();
      if (((bools.get(0)).booleanValue() && (this.y != 0))) {
        Coordinates _coordinates = new Coordinates(this.x, (this.y - 1));
        output.put("U", _coordinates);
      }
      if (((bools.get(1)).booleanValue() && (this.y != 3))) {
        Coordinates _coordinates_1 = new Coordinates(this.x, (this.y + 1));
        output.put("D", _coordinates_1);
      }
      if (((bools.get(2)).booleanValue() && (this.x != 0))) {
        Coordinates _coordinates_2 = new Coordinates((this.x - 1), this.y);
        output.put("L", _coordinates_2);
      }
      if (((bools.get(3)).booleanValue() && (this.x != 3))) {
        Coordinates _coordinates_3 = new Coordinates((this.x + 1), this.y);
        output.put("R", _coordinates_3);
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public boolean isFinal() {
    return ((this.x == 3) && (this.y == 3));
  }

  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
