package advent2016.puzzle19;

import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static final int nb_of_elves = 3004953;
  
  public static void main(final String[] args) {
    InputOutput.<Integer>println(Integer.valueOf(Launcher.formula1(Launcher.nb_of_elves)));
    InputOutput.<Integer>println(Integer.valueOf(Launcher.formula2(Launcher.nb_of_elves)));
  }
  
  public static int log2(final int n) {
    int _numberOfLeadingZeros = Integer.numberOfLeadingZeros(n);
    return (31 - _numberOfLeadingZeros);
  }
  
  public static int log3(final int n) {
    double _log = Math.log(n);
    double _log_1 = Math.log(3);
    double _divide = (_log / _log_1);
    return ((int) _divide);
  }
  
  public static int pow2(final int n) {
    int _xifexpression = (int) 0;
    if ((n == 0)) {
      _xifexpression = 1;
    } else {
      _xifexpression = (2 << (n - 1));
    }
    return _xifexpression;
  }
  
  public static int pow3(final int n) {
    double _pow = Math.pow(3, n);
    return ((int) _pow);
  }
  
  public static int formula1(final int input) {
    int _pow2 = Launcher.pow2(Launcher.log2(input));
    int _minus = (input - _pow2);
    int _multiply = (2 * _minus);
    return (_multiply + 1);
  }
  
  public static int formula2(final int N) {
    int _xblockexpression = (int) 0;
    {
      int pow = Launcher.pow3(Launcher.log3(N));
      int _xifexpression = (int) 0;
      if ((N <= (2 * pow))) {
        _xifexpression = (N - pow);
      } else {
        _xifexpression = ((2 * N) - (3 * pow));
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
