package advent2017;

import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Day15 {
  private static final long a_start = 289;

  private static final long b_start = 629;

  private static final long a_factor = 16807;

  private static final long b_factor = 48271;

  private static final long a_multiple = 4;

  private static final long b_multiple = 8;

  private static final long divisor = 2147483647;

  public static void main(final String[] args) {
    long a_current = Day15.a_start;
    long b_current = Day15.b_start;
    int nb_of_matches = 0;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 40000000, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        a_current = ((a_current * Day15.a_factor) % Day15.divisor);
        b_current = ((b_current * Day15.b_factor) % Day15.divisor);
        String a_string = Day15.pad_and_trim(Long.toString(a_current, 2));
        String b_string = Day15.pad_and_trim(Long.toString(b_current, 2));
        boolean _equals = a_string.equals(b_string);
        if (_equals) {
          nb_of_matches++;
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(nb_of_matches));
    a_current = Day15.a_start;
    b_current = Day15.b_start;
    nb_of_matches = 0;
    ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, 5000000, true);
    for (final Integer i_1 : _doubleDotLessThan_1) {
      {
        do {
          a_current = ((a_current * Day15.a_factor) % Day15.divisor);
        } while(((a_current % Day15.a_multiple) != 0));
        do {
          b_current = ((b_current * Day15.b_factor) % Day15.divisor);
        } while(((b_current % Day15.b_multiple) != 0));
        String a_string = Day15.pad_and_trim(Long.toString(a_current, 2));
        String b_string = Day15.pad_and_trim(Long.toString(b_current, 2));
        boolean _equals = a_string.equals(b_string);
        if (_equals) {
          nb_of_matches++;
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(nb_of_matches));
  }

  public static String pad_and_trim(final String s) {
    String _xifexpression = null;
    int _length = s.length();
    boolean _greaterEqualsThan = (_length >= 16);
    if (_greaterEqualsThan) {
      int _length_1 = s.length();
      int _minus = (_length_1 - 16);
      _xifexpression = s.substring(_minus, s.length());
    } else {
      _xifexpression = String.format((("%1$" + Integer.valueOf(16)) + "s"), s).replace(" ", "0");
    }
    return _xifexpression;
  }
}
