package advent2021.puzzle18;

import com.google.common.base.Objects;
import java.io.BufferedReader;
import org.eclipse.xtext.xbase.lib.Exceptions;

@SuppressWarnings("all")
public class Pair extends SNumber {
  private SNumber left;

  private SNumber right;

  public Pair(final BufferedReader br, final Pair parent_) {
    super(parent_);
    try {
      br.read();
      this.left = SNumber.createSNumber(br, this);
      br.read();
      this.right = SNumber.createSNumber(br, this);
      br.read();
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public Pair(final SNumber s1, final SNumber s2, final Pair parent_) {
    super(parent_);
    this.left = s1;
    s1.parent = this;
    this.right = s2;
    s2.parent = this;
  }

  public Pair(final int v1, final int v2, final Pair parent_) {
    super(parent_);
    Singleton _singleton = new Singleton(v1, this);
    this.left = _singleton;
    Singleton _singleton_1 = new Singleton(v2, this);
    this.right = _singleton_1;
  }

  public SNumber update(final SNumber previousSN, final SNumber newSN) {
    SNumber _xifexpression = null;
    boolean _equals = Objects.equal(this.left, previousSN);
    if (_equals) {
      _xifexpression = this.left = newSN;
    } else {
      _xifexpression = this.right = newSN;
    }
    return _xifexpression;
  }

  public Pair reduce() {
    SNumber toProcess = null;
    do {
      {
        toProcess = this.findFirstToExplode();
        if ((toProcess != null)) {
          ((Pair) toProcess).explode();
        } else {
          toProcess = this.findFirstToSplit();
          if ((toProcess != null)) {
            ((Singleton) toProcess).split();
          }
        }
      }
    } while((toProcess != null));
    return this;
  }

  public Singleton findFirstToSplit() {
    Singleton _xblockexpression = null;
    {
      final Singleton ans = this.left.findFirstToSplit();
      Singleton _xifexpression = null;
      if ((ans == null)) {
        _xifexpression = this.right.findFirstToSplit();
      } else {
        _xifexpression = ans;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public Pair findFirstToExplode() {
    Pair _xifexpression = null;
    int _numberOfAncestors = this.numberOfAncestors();
    boolean _equals = (_numberOfAncestors == 4);
    if (_equals) {
      _xifexpression = this;
    } else {
      Pair _xblockexpression = null;
      {
        Pair leftFirst = this.left.findFirstToExplode();
        Pair _xifexpression_1 = null;
        if ((leftFirst != null)) {
          _xifexpression_1 = leftFirst;
        } else {
          _xifexpression_1 = this.right.findFirstToExplode();
        }
        _xblockexpression = _xifexpression_1;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }

  public SNumber findFirst(final SNumber nb, final boolean b) {
    SNumber _xifexpression = null;
    SNumber _xifexpression_1 = null;
    if (b) {
      _xifexpression_1 = this.left;
    } else {
      _xifexpression_1 = this.right;
    }
    boolean _equals = Objects.equal(nb, _xifexpression_1);
    if (_equals) {
      SNumber _xifexpression_2 = null;
      if (b) {
        _xifexpression_2 = this.right;
      } else {
        _xifexpression_2 = this.left;
      }
      _xifexpression = _xifexpression_2;
    } else {
      SNumber _xifexpression_3 = null;
      if ((this.parent == null)) {
        _xifexpression_3 = null;
      } else {
        _xifexpression_3 = this.parent.findFirst(this, b);
      }
      _xifexpression = _xifexpression_3;
    }
    return _xifexpression;
  }

  public SNumber explode() {
    SNumber _xifexpression = null;
    if ((this.parent != null)) {
      SNumber _xblockexpression = null;
      {
        final int leftV = ((Singleton) this.left).value;
        final int rightV = ((Singleton) this.right).value;
        final SNumber findFirstLeft = this.parent.findFirst(this, false);
        if ((findFirstLeft != null)) {
          findFirstLeft.updateValue(true, leftV);
        }
        final SNumber findFirstRight = this.parent.findFirst(this, true);
        if ((findFirstRight != null)) {
          findFirstRight.updateValue(false, rightV);
        }
        Singleton _singleton = new Singleton(0, this.parent);
        _xblockexpression = this.parent.update(this, _singleton);
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }

  public String toString() {
    return (((("[" + this.left) + ",") + this.right) + "]");
  }

  public void updateValue(final boolean r, final int value) {
    if (r) {
      this.right.updateValue(r, value);
    } else {
      this.left.updateValue(r, value);
    }
  }

  public int magnitude() {
    int _magnitude = this.left.magnitude();
    int _multiply = (3 * _magnitude);
    int _magnitude_1 = this.right.magnitude();
    int _multiply_1 = (2 * _magnitude_1);
    return (_multiply + _multiply_1);
  }
}
