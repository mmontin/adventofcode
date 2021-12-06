package advent2021.puzzle5;

import java.util.Map;
import java.util.function.BiFunction;

@SuppressWarnings("all")
public class Segment {
  private Point p1;
  
  private Point p2;
  
  private int slopeX;
  
  private int slopeY;
  
  public Segment(final String s) {
    final String[] split = s.split(" -> ");
    String _get = split[0];
    final Point p3 = new Point(_get);
    String _get_1 = split[1];
    final Point p4 = new Point(_get_1);
    boolean _smaller = p3.smaller(p4);
    if (_smaller) {
      this.p1 = p3;
      this.p2 = p4;
    } else {
      this.p1 = p4;
      this.p2 = p3;
    }
    final int sY = this.p1.yDiff(this.p2);
    final int sX = this.p1.xDiff(this.p2);
    final int pgcd = this.gcd(Math.abs(sY), Math.abs(sX));
    this.slopeY = (sY / pgcd);
    this.slopeX = (sX / pgcd);
  }
  
  public boolean line() {
    return this.p1.sameLine(this.p2);
  }
  
  public void addPointsOnGrid(final Map<Point, Integer> points) {
    Point p = this.p1;
    while (p.smaller(this.p2)) {
      {
        final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
          public Integer apply(final Integer x, final Integer y) {
            return Integer.valueOf(((x).intValue() + (y).intValue()));
          }
        };
        points.merge(p, Integer.valueOf(1), _function);
        Point _point = new Point(p, this.slopeX, this.slopeY);
        p = _point;
      }
    }
  }
  
  private int gcd(final int a, final int b) {
    int _xifexpression = (int) 0;
    if ((b == 0)) {
      _xifexpression = a;
    } else {
      _xifexpression = this.gcd(b, (a % b));
    }
    return _xifexpression;
  }
}
