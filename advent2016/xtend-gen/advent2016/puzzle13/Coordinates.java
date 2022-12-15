package advent2016.puzzle13;

import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Coordinates {
  private static final int favourite_nb = 1358;

  private final int x;

  private final int y;

  private final int hCode;

  private final boolean passable;

  private int distance;

  public Coordinates(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
    final int tmp = (this.y + ((this.x + 1) / 2));
    this.hCode = (this.x + (tmp * tmp));
    final Function2<Integer, Character, Integer> _function = new Function2<Integer, Character, Integer>() {
      public Integer apply(final Integer v, final Character c) {
        int _xifexpression = (int) 0;
        boolean _equals = (c + "").equals("1");
        if (_equals) {
          _xifexpression = 1;
        } else {
          _xifexpression = 0;
        }
        return Integer.valueOf(((v).intValue() + _xifexpression));
      }
    };
    Integer _fold = IterableExtensions.<Character, Integer>fold(((Iterable<Character>)Conversions.doWrapArray(Integer.toBinaryString((((this.x * ((this.x + 3) + (2 * this.y))) + (this.y * (1 + this.y))) + Coordinates.favourite_nb)).toCharArray())), Integer.valueOf(0), _function);
    int _modulo = ((_fold).intValue() % 2);
    boolean _equals = (_modulo == 0);
    this.passable = _equals;
    this.distance = Integer.MAX_VALUE;
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

  public void step(final Set<Coordinates> visited, final Set<Coordinates> toVisit) {
    Coordinates _coordinates = new Coordinates((this.x - 1), this.y);
    Coordinates _coordinates_1 = new Coordinates((this.x + 1), this.y);
    Coordinates _coordinates_2 = new Coordinates(this.x, (this.y - 1));
    Coordinates _coordinates_3 = new Coordinates(this.x, (this.y + 1));
    final Function1<Coordinates, Boolean> _function = new Function1<Coordinates, Boolean>() {
      public Boolean apply(final Coordinates it) {
        return Boolean.valueOf((((it.passable && (it.x >= 0)) && (it.y >= 0)) && (!visited.contains(it))));
      }
    };
    final Consumer<Coordinates> _function_1 = new Consumer<Coordinates>() {
      public void accept(final Coordinates s) {
        final Function1<Coordinates, Boolean> _function = new Function1<Coordinates, Boolean>() {
          public Boolean apply(final Coordinates it) {
            return Boolean.valueOf(it.equals(s));
          }
        };
        Coordinates c = IterableExtensions.<Coordinates>findFirst(toVisit, _function);
        if ((c == null)) {
          c = s;
          toVisit.add(c);
        }
        c.updateDistance((Coordinates.this.distance + 1));
      }
    };
    IterableExtensions.<Coordinates>filter(CollectionLiterals.<Coordinates>newHashSet(_coordinates, _coordinates_1, _coordinates_2, _coordinates_3), _function).forEach(_function_1);
  }

  public int getDistance() {
    return this.distance;
  }

  public int updateDistance(final int newDistance) {
    return this.distance = Math.min(this.distance, newDistance);
  }

  public String toString() {
    return (((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ")");
  }
}
