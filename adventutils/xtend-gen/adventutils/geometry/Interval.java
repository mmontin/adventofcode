package adventutils.geometry;

import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Interval {
  public long leftBound;

  public long rightBound;

  public Interval(final long lb, final long rb) {
    this.leftBound = lb;
    this.rightBound = rb;
  }

  public Interval(final Interval other) {
    this(other.leftBound, other.rightBound);
  }

  public Interval(final String s) {
    this(Long.parseLong(s.split("-")[0]), Long.parseLong(s.split("-")[1]));
  }

  public Interval translate(final long t) {
    return new Interval((this.leftBound + t), (this.rightBound + t));
  }

  public int position(final long dot) {
    int _xifexpression = (int) 0;
    if ((dot < this.leftBound)) {
      _xifexpression = (-1);
    } else {
      int _xifexpression_1 = (int) 0;
      if ((dot > this.rightBound)) {
        _xifexpression_1 = 1;
      } else {
        _xifexpression_1 = 0;
      }
      _xifexpression = _xifexpression_1;
    }
    return _xifexpression;
  }

  public boolean contains(final long dot) {
    int _position = this.position(dot);
    return (_position == 0);
  }

  public boolean includedIn(final Interval other) {
    return (other.contains(this.leftBound) && other.contains(this.rightBound));
  }

  public boolean overlapsWith(final Interval other) {
    return (other.contains(this.leftBound) || other.contains(this.rightBound));
  }

  public Interval intersection(final Interval other) {
    long _max = Math.max(this.leftBound, other.leftBound);
    long _min = Math.min(this.rightBound, other.rightBound);
    return new Interval(_max, _min);
  }

  public long length() {
    return (this.rightBound - this.leftBound);
  }

  public boolean isUnity() {
    long _length = this.length();
    return (_length == 0);
  }

  public boolean isEmpty() {
    long _length = this.length();
    return (_length < 0);
  }

  public Pair<Interval, Interval> split(final long limit, final boolean includeLeft) {
    long _xifexpression = (long) 0;
    if (includeLeft) {
      _xifexpression = limit;
    } else {
      _xifexpression = (limit - 1);
    }
    Interval _interval = new Interval(this.leftBound, _xifexpression);
    long _xifexpression_1 = (long) 0;
    if (includeLeft) {
      _xifexpression_1 = (limit + 1);
    } else {
      _xifexpression_1 = limit;
    }
    Interval _interval_1 = new Interval(_xifexpression_1, this.rightBound);
    return Pair.<Interval, Interval>of(_interval, _interval_1);
  }

  @Override
  public String toString() {
    return (((("[" + Long.valueOf(this.leftBound)) + ",") + Long.valueOf(this.rightBound)) + "]");
  }
}
