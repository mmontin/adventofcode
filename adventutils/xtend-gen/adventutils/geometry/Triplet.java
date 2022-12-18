package adventutils.geometry;

import java.util.HashSet;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Triplet {
  public final int x;

  public final int y;

  public final int z;

  private final int _hashCode;

  public Triplet(final String s) {
    this(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(s.split(","))), new Function1<String, Integer>() {
      public Integer apply(final String it) {
        return Integer.valueOf(Integer.parseInt(it));
      }
    }));
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

  public String toString() {
    return (((((("(" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ",") + Integer.valueOf(this.z)) + ")");
  }

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

  public int hashCode() {
    return this._hashCode;
  }

  public HashSet<Triplet> face_neighbours() {
    return CollectionLiterals.<Triplet>newHashSet(this.incrX(), this.decrX(), this.incrY(), this.decrY(), this.incrZ(), this.decrZ());
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
}
