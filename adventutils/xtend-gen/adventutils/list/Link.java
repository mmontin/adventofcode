package adventutils.list;

import org.eclipse.xtext.xbase.lib.ExclusiveRange;

@SuppressWarnings("all")
public class Link<T extends Object> {
  public T value;

  public Link<T> next;

  public Link<T> previous;

  public Link(final T _value, final Link<T> _previous) {
    this.value = _value;
    this.next = null;
    if ((_previous != null)) {
      _previous.next = this;
    }
    this.previous = _previous;
  }

  public Link<T> updateNext(final Link<T> _next) {
    Link<T> _xblockexpression = null;
    {
      this.next = _next;
      _xblockexpression = _next.previous = this;
    }
    return _xblockexpression;
  }

  public Link<T> get(final int offset) {
    Link<T> _xblockexpression = null;
    {
      Link<T> output = this;
      if ((offset < 0)) {
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, (-offset), true);
        for (final Integer i : _doubleDotLessThan) {
          output = output.previous;
        }
      } else {
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, offset, true);
        for (final Integer i_1 : _doubleDotLessThan_1) {
          output = output.next;
        }
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public Link<T> insertRight(final Link<T> to_insert) {
    Link<T> _xblockexpression = null;
    {
      Link<T> prev = this.next;
      this.updateNext(to_insert);
      _xblockexpression = to_insert.updateNext(prev);
    }
    return _xblockexpression;
  }

  public T removeRight() {
    T _xblockexpression = null;
    {
      final Link<T> new_right = this.next.next;
      final T output = this.next.value;
      this.updateNext(new_right);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public String toString() {
    return this.value.toString();
  }
}
