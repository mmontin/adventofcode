package utils;

@SuppressWarnings("all")
public class Interval {
  private int x;
  
  private int y;
  
  public Interval(final String s) {
    final String[] split1 = s.split("-");
    this.x = Integer.parseInt(split1[0]);
    this.y = Integer.parseInt(split1[1]);
  }
  
  public boolean contains(final int e) {
    return ((e >= this.x) && (e <= this.y));
  }
  
  public boolean includedIn(final Interval other) {
    return (other.contains(this.x) && other.contains(this.y));
  }
  
  public boolean overlapsWith(final Interval other) {
    return (other.contains(this.x) || other.contains(this.y));
  }
}
