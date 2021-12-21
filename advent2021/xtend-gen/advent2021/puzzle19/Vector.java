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
  
  public int hashCode() {
    return ((this.x + this.y) + this.z);
  }
  
  public String toString() {
    return (((((("[" + Integer.valueOf(this.x)) + ",") + Integer.valueOf(this.y)) + ",") + Integer.valueOf(this.z)) + "]");
  }
  
  public int size2() {
    return (((this.x * this.x) + (this.y * this.y)) + (this.z * this.z));
  }
  
  public int multiplyBy(final Matrix m) {
    int _xblockexpression = (int) 0;
    {
      int _get = (m.coeffs[0])[0];
      int _multiply = (_get * this.x);
      int _get_1 = (m.coeffs[1])[0];
      int _multiply_1 = (_get_1 * this.y);
      int _plus = (_multiply + _multiply_1);
      int _get_2 = (m.coeffs[2])[0];
      int _multiply_2 = (_get_2 * this.z);
      final int newx = (_plus + _multiply_2);
      int _get_3 = (m.coeffs[0])[1];
      int _multiply_3 = (_get_3 * this.x);
      int _get_4 = (m.coeffs[1])[1];
      int _multiply_4 = (_get_4 * this.y);
      int _plus_1 = (_multiply_3 + _multiply_4);
      int _get_5 = (m.coeffs[2])[1];
      int _multiply_5 = (_get_5 * this.z);
      final int newy = (_plus_1 + _multiply_5);
      int _get_6 = (m.coeffs[0])[2];
      int _multiply_6 = (_get_6 * this.x);
      int _get_7 = (m.coeffs[1])[2];
      int _multiply_7 = (_get_7 * this.y);
      int _plus_2 = (_multiply_6 + _multiply_7);
      int _get_8 = (m.coeffs[2])[2];
      int _multiply_8 = (_get_8 * this.z);
      final int newz = (_plus_2 + _multiply_8);
      this.x = newx;
      this.y = newy;
      _xblockexpression = this.z = newz;
    }
    return _xblockexpression;
  }
  
  public int add(final Vector v) {
    int _xblockexpression = (int) 0;
    {
      int _x = this.x;
      this.x = (_x + v.x);
      int _y = this.y;
      this.y = (_y + v.y);
      int _z = this.z;
      _xblockexpression = this.z = (_z + v.z);
    }
    return _xblockexpression;
  }
  
  public boolean equals(final Object o) {
    boolean _xblockexpression = false;
    {
      final Vector v = ((Vector) o);
      _xblockexpression = (((v.x == this.x) && (v.y == this.y)) && (v.z == this.z));
    }
    return _xblockexpression;
  }
}
