package advent2021.puzzle5;

@SuppressWarnings("all")
public class Point {
  private int x;

  private int y;

  public Point(final Point p, final int slopeX, final int slopeY) {
    this.x = (p.x + slopeX);
    this.y = (p.y + slopeY);
  }

  public Point(final String toSplit) {
    final String[] split = toSplit.split(",");
    this.x = Integer.parseInt(split[0]);
    this.y = Integer.parseInt(split[1]);
  }

  public boolean sameLine(final Point p) {
    return ((p.x == this.x) || (p.y == this.y));
  }

  public boolean smaller(final Point p) {
    return ((this.x < p.x) || ((this.x == p.x) && (this.y <= p.y)));
  }

  public int xDiff(final Point p) {
    return (p.x - this.x);
  }

  public int yDiff(final Point p) {
    return (p.y - this.y);
  }

  @Override
  public boolean equals(final Object p) {
    return ((((Point) p).x == this.x) && (((Point) p).y == this.y));
  }

  @Override
  public int hashCode() {
    return (this.x + this.y);
  }
}
