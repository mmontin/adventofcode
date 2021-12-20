package advent2021.puzzle19;

@SuppressWarnings("all")
public class Matrix {
  private int[][] coeffs;
  
  public Matrix(final int[][] coeffs) {
    this.coeffs = coeffs;
  }
  
  public Vector multiply(final Vector v) {
    int _get = (this.coeffs[0])[0];
    int _multiply = (_get * v.x);
    int _get_1 = (this.coeffs[1])[0];
    int _multiply_1 = (_get_1 * v.y);
    int _plus = (_multiply + _multiply_1);
    int _get_2 = (this.coeffs[2])[0];
    int _multiply_2 = (_get_2 * v.z);
    int _plus_1 = (_plus + _multiply_2);
    int _get_3 = (this.coeffs[0])[1];
    int _multiply_3 = (_get_3 * v.x);
    int _get_4 = (this.coeffs[1])[1];
    int _multiply_4 = (_get_4 * v.y);
    int _plus_2 = (_multiply_3 + _multiply_4);
    int _get_5 = (this.coeffs[2])[1];
    int _multiply_5 = (_get_5 * v.z);
    int _plus_3 = (_plus_2 + _multiply_5);
    int _get_6 = (this.coeffs[0])[2];
    int _multiply_6 = (_get_6 * v.x);
    int _get_7 = (this.coeffs[1])[2];
    int _multiply_7 = (_get_7 * v.y);
    int _plus_4 = (_multiply_6 + _multiply_7);
    int _get_8 = (this.coeffs[2])[2];
    int _multiply_8 = (_get_8 * v.z);
    int _plus_5 = (_plus_4 + _multiply_8);
    return new Vector(_plus_1, _plus_3, _plus_5);
  }
}
