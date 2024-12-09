package adventutils.geometry;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Triplet {
  public final int x;

  public final int y;

  public final int z;

  private final int _hashCode;

  public Triplet(final String s) {
    this(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(s.split(","))), ((Function1<String, Integer>) (String it) -> {
      return Integer.valueOf(Integer.parseInt(it));
    })));
  }

  public Triplet(final List<Integer> input) {
    this((input.get(0)).intValue(), (input.get(1)).intValue(), (input.get(2)).intValue());
  }

  public Triplet(final int _x, final int _y, final int _z) {
    this.x = _x;
    this.y = _y;
    this.z = _z;
    this._hashCode = this.toString().hashCode();
  }

  @Override
  public String toString() {
    return (((((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ",") + Integer.valueOf(this.z)) + ")");
  }

  @Override
  public boolean equals(final Object other) {
    boolean _switchResult = false;
    boolean _matched = false;
    if (other instanceof Triplet) {
      _matched=true;
      _switchResult = (((((Triplet)other).x == this.x) && (((Triplet)other).y == this.y)) && (((Triplet)other).z == this.z));
    }
    if (!_matched) {
      _switchResult = false;
    }
    return _switchResult;
  }

  @Override
  public int hashCode() {
    return this._hashCode;
  }

  public HashSet<Triplet> face_neighbours() {
    return CollectionLiterals.<Triplet>newHashSet(this.incrX(), this.decrX(), this.incrY(), this.decrY(), this.incrZ(), this.decrZ());
  }

  public Triplet add(final Triplet other) {
    return new Triplet((this.x + other.x), (this.y + other.y), (this.z + other.z));
  }

  public Triplet addZ(final int dz) {
    return new Triplet(this.x, this.y, (this.z + dz));
  }

  public Triplet incrZ() {
    return new Triplet(this.x, this.y, (this.z + 1));
  }

  public Triplet decrZ() {
    return new Triplet(this.x, this.y, (this.z - 1));
  }

  public Triplet incrX() {
    return new Triplet((this.x + 1), this.y, this.z);
  }

  public Triplet decrX() {
    return new Triplet((this.x - 1), this.y, this.z);
  }

  public Triplet incrY() {
    return new Triplet(this.x, (this.y + 1), this.z);
  }

  public Triplet decrY() {
    return new Triplet(this.x, (this.y - 1), this.z);
  }

  public int manhattanDistanceTo(final Triplet other) {
    int _abs = Math.abs((other.x - this.x));
    int _abs_1 = Math.abs((other.y - this.y));
    int _plus = (_abs + _abs_1);
    int _abs_2 = Math.abs((other.z - this.z));
    return (_plus + _abs_2);
  }

  public Set<Triplet> line(final Triplet other) {
    Set<Triplet> _xifexpression = null;
    if ((other.x != this.x)) {
      final Function1<Integer, Triplet> _function = (Integer it) -> {
        return new Triplet((it).intValue(), this.y, this.z);
      };
      _xifexpression = IterableExtensions.<Triplet>toSet(IterableExtensions.<Integer, Triplet>map(new IntegerRange(other.x, this.x), _function));
    } else {
      Set<Triplet> _xifexpression_1 = null;
      if ((other.y != this.y)) {
        final Function1<Integer, Triplet> _function_1 = (Integer it) -> {
          return new Triplet(this.x, (it).intValue(), this.z);
        };
        _xifexpression_1 = IterableExtensions.<Triplet>toSet(IterableExtensions.<Integer, Triplet>map(new IntegerRange(other.y, this.y), _function_1));
      } else {
        final Function1<Integer, Triplet> _function_2 = (Integer it) -> {
          return new Triplet(this.x, this.y, (it).intValue());
        };
        _xifexpression_1 = IterableExtensions.<Triplet>toSet(IterableExtensions.<Integer, Triplet>map(new IntegerRange(other.z, this.z), _function_2));
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }
}
