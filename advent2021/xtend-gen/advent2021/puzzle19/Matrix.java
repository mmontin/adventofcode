package advent2021.puzzle19;

@SuppressWarnings("all")
public class Matrix {
  protected int[][] coeffs;
  
  public Matrix(final int[][] coeffs) {
    this.coeffs = coeffs;
  }
  
  public Matrix(final Vector v1, final Vector v2) {
    int _xifexpression = (int) 0;
    if ((v1.x == v2.x)) {
      _xifexpression = 1;
    } else {
      int _xifexpression_1 = (int) 0;
      if ((v1.x == (-v2.x))) {
        _xifexpression_1 = (-1);
      } else {
        _xifexpression_1 = 0;
      }
      _xifexpression = _xifexpression_1;
    }
    final int a11 = _xifexpression;
    int _xifexpression_2 = (int) 0;
    if ((v1.y == v2.x)) {
      _xifexpression_2 = 1;
    } else {
      int _xifexpression_3 = (int) 0;
      if ((v1.y == (-v2.x))) {
        _xifexpression_3 = (-1);
      } else {
        _xifexpression_3 = 0;
      }
      _xifexpression_2 = _xifexpression_3;
    }
    final int a12 = _xifexpression_2;
    int _xifexpression_4 = (int) 0;
    if ((v1.z == v2.x)) {
      _xifexpression_4 = 1;
    } else {
      int _xifexpression_5 = (int) 0;
      if ((v1.z == (-v2.x))) {
        _xifexpression_5 = (-1);
      } else {
        _xifexpression_5 = 0;
      }
      _xifexpression_4 = _xifexpression_5;
    }
    final int a13 = _xifexpression_4;
    int _xifexpression_6 = (int) 0;
    if ((v1.x == v2.y)) {
      _xifexpression_6 = 1;
    } else {
      int _xifexpression_7 = (int) 0;
      if ((v1.x == (-v2.y))) {
        _xifexpression_7 = (-1);
      } else {
        _xifexpression_7 = 0;
      }
      _xifexpression_6 = _xifexpression_7;
    }
    final int a21 = _xifexpression_6;
    int _xifexpression_8 = (int) 0;
    if ((v1.y == v2.y)) {
      _xifexpression_8 = 1;
    } else {
      int _xifexpression_9 = (int) 0;
      if ((v1.y == (-v2.y))) {
        _xifexpression_9 = (-1);
      } else {
        _xifexpression_9 = 0;
      }
      _xifexpression_8 = _xifexpression_9;
    }
    final int a22 = _xifexpression_8;
    int _xifexpression_10 = (int) 0;
    if ((v1.z == v2.y)) {
      _xifexpression_10 = 1;
    } else {
      int _xifexpression_11 = (int) 0;
      if ((v1.z == (-v2.y))) {
        _xifexpression_11 = (-1);
      } else {
        _xifexpression_11 = 0;
      }
      _xifexpression_10 = _xifexpression_11;
    }
    final int a23 = _xifexpression_10;
    int _xifexpression_12 = (int) 0;
    if ((v1.x == v2.z)) {
      _xifexpression_12 = 1;
    } else {
      int _xifexpression_13 = (int) 0;
      if ((v1.x == (-v2.z))) {
        _xifexpression_13 = (-1);
      } else {
        _xifexpression_13 = 0;
      }
      _xifexpression_12 = _xifexpression_13;
    }
    final int a31 = _xifexpression_12;
    int _xifexpression_14 = (int) 0;
    if ((v1.y == v2.z)) {
      _xifexpression_14 = 1;
    } else {
      int _xifexpression_15 = (int) 0;
      if ((v1.y == (-v2.z))) {
        _xifexpression_15 = (-1);
      } else {
        _xifexpression_15 = 0;
      }
      _xifexpression_14 = _xifexpression_15;
    }
    final int a32 = _xifexpression_14;
    int _xifexpression_16 = (int) 0;
    if ((v1.z == v2.z)) {
      _xifexpression_16 = 1;
    } else {
      int _xifexpression_17 = (int) 0;
      if ((v1.z == (-v2.z))) {
        _xifexpression_17 = (-1);
      } else {
        _xifexpression_17 = 0;
      }
      _xifexpression_16 = _xifexpression_17;
    }
    final int a33 = _xifexpression_16;
    this.coeffs = new int[][] { new int[] { a11, a12, a13 }, new int[] { a21, a22, a23 }, new int[] { a31, a32, a33 } };
  }
}
