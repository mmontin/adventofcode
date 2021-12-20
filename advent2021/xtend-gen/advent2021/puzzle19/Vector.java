package advent2021.puzzle19;

@SuppressWarnings("all")
public class Vector {
  protected int x;
  
  protected int y;
  
  protected int z;
  
  public Vector(final int x, final int y, final int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public Vector(final String s) {
    this(
      Integer.parseInt(s.split(",")[0]), 
      Integer.parseInt(s.split(",")[1]), 
      Integer.parseInt(s.split(",")[2]));
  }
  
  public Vector to(final Vector other) {
    return new Vector((other.x - this.x), (other.y - this.y), (other.z - this.z));
  }
  
  public String toString() {
    return (((((("[" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ",") + Integer.valueOf(this.z)) + "]");
  }
  
  public int size2() {
    return (((this.x * this.x) + (this.y * this.y)) + (this.z * this.z));
  }
}
