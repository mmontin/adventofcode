package advent2016.puzzle20;

@SuppressWarnings("all")
public class Interval {
  protected long leftBound;

  protected long rightBound;

  public Interval(final String s) {
    String[] split = s.split("-");
    this.leftBound = Long.parseLong(split[0]);
    this.rightBound = Long.parseLong(split[1]);
  }

  public int contains(final long dot) {
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

  public String toString() {
    return (((("[" + Long.valueOf(this.leftBound)) + ",") + Long.valueOf(this.rightBound)) + "]");
  }
}
