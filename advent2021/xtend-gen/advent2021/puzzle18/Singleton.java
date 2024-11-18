package advent2021.puzzle18;

import java.io.BufferedReader;
import org.eclipse.xtext.xbase.lib.Exceptions;

@SuppressWarnings("all")
public class Singleton extends SNumber {
  protected int value;

  public Singleton(final BufferedReader br, final Pair parent_) {
    super(parent_);
    try {
      String number = "";
      String character = "";
      do {
        {
          String _number = number;
          number = (_number + character);
          br.mark(1);
          int _read = br.read();
          String _plus = (Character.valueOf(((char) _read)) + "");
          character = _plus;
        }
      } while((!",]".contains(character)));
      br.reset();
      this.value = Integer.parseInt(number);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public Singleton(final int v, final Pair parent_) {
    super(parent_);
    this.value = v;
  }

  public SNumber split() {
    SNumber _xifexpression = null;
    if ((this.parent != null)) {
      SNumber _xblockexpression = null;
      {
        final int div2 = (this.value / 2);
        int _xifexpression_1 = (int) 0;
        if (((this.value % 2) == 0)) {
          _xifexpression_1 = div2;
        } else {
          _xifexpression_1 = (div2 + 1);
        }
        Pair _pair = new Pair(div2, _xifexpression_1, this.parent);
        _xblockexpression = this.parent.update(this, _pair);
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }

  @Override
  public String toString() {
    return (Integer.valueOf(this.value) + "");
  }

  @Override
  public Singleton findFirstToSplit() {
    Singleton _xifexpression = null;
    if ((this.value >= 10)) {
      _xifexpression = this;
    } else {
      _xifexpression = null;
    }
    return _xifexpression;
  }

  @Override
  public Pair findFirstToExplode() {
    return null;
  }

  @Override
  public void updateValue(final boolean right, final int value_) {
    int _value = this.value;
    this.value = (_value + value_);
  }

  @Override
  public int magnitude() {
    return this.value;
  }
}
