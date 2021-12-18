package advent2021.puzzle18;

import java.io.BufferedReader;
import org.eclipse.xtext.xbase.lib.Exceptions;

@SuppressWarnings("all")
public abstract class SNumber {
  public static final SNumber createSNumber(final BufferedReader br, final Pair parent_) {
    try {
      SNumber _xblockexpression = null;
      {
        br.mark(1);
        int _read = br.read();
        final String first = (Character.valueOf(((char) _read)) + "");
        br.reset();
        SNumber _xifexpression = null;
        boolean _equals = first.equals("[");
        if (_equals) {
          _xifexpression = new Pair(br, parent_);
        } else {
          _xifexpression = new Singleton(br, parent_);
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  protected Pair parent = null;
  
  public SNumber(final Pair parent_) {
    this.parent = parent_;
  }
  
  public Pair getParent() {
    return this.parent;
  }
  
  public int numberOfAncestors() {
    int _xifexpression = (int) 0;
    if ((this.parent == null)) {
      _xifexpression = 0;
    } else {
      int _numberOfAncestors = this.parent.numberOfAncestors();
      _xifexpression = (1 + _numberOfAncestors);
    }
    return _xifexpression;
  }
  
  public abstract Singleton findFirstToSplit();
  
  public abstract Pair findFirstToExplode();
  
  public abstract void updateValue(final boolean right, final int value);
  
  public abstract int magnitude();
}
