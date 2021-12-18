package advent2016.puzzle19;

import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static final int nb_of_elves = 3004953;
  
  public static void main(final String[] args) {
    InputOutput.<Integer>println(Integer.valueOf(Launcher.formula(Launcher.nb_of_elves)));
  }
  
  public static int log2(final int n) {
    int _numberOfLeadingZeros = Integer.numberOfLeadingZeros(n);
    return (31 - _numberOfLeadingZeros);
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
  
  public static int formula(final int input) {
    int _pow2 = Launcher.pow2(Launcher.log2(input));
    int _minus = (input - _pow2);
    int _multiply = (2 * _minus);
    return (_multiply + 1);
  }
}
