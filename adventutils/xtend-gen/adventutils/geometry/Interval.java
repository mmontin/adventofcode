package adventutils.geometry;

@SuppressWarnings("all")
public class Interval {
  public long leftBound;

  public long rightBound;

  public Interval(final long lb, final long rb) {
    this.leftBound = lb;
    this.rightBound = rb;
  }

  public Interval(final String s) {
    this(Long.parseLong(s.split("-")[0]), Long.parseLong(s.split("-")[1]));
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

  public String toString() {
    return (((("[" + Long.valueOf(this.leftBound)) + ",") + Long.valueOf(this.rightBound)) + "]");
  }
}
