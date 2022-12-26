package advent2017;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Day16 {
  private static final List<String> moves = (List<String>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2017), Integer.valueOf(16)).getInputs().get(0).split(","));

  private static final String input = "abcdefghijklmnop";

  private static StringBuffer initial;

  public static StringBuffer init() {
    StringBuffer _stringBuffer = new StringBuffer(Day16.input);
    return Day16.initial = _stringBuffer;
  }

  public static void main(final String[] args) {
    Day16.init();
    Day16.round();
    InputOutput.<StringBuffer>println(Day16.initial);
    Day16.init();
    int i = 0;
    do {
      {
        Day16.round();
        i++;
      }
    } while((!Day16.initial.toString().equals(Day16.input)));
    Day16.init();
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day16.round();
      }
    };
    new ExclusiveRange(0, (1000000000 % 42), true).forEach(_function);
    InputOutput.<StringBuffer>println(Day16.initial);
  }

  public static void round() {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String first = it.substring(0, 1);
        final String[] others = it.substring(1, it.length()).split("/");
        boolean _matched = false;
        if (Objects.equal(first, "s")) {
          _matched=true;
          final int size = Integer.parseInt(others[0]);
          int _length = Day16.initial.length();
          int _minus = (_length - size);
          final String to_move = Day16.initial.substring(_minus);
          int _length_1 = Day16.initial.length();
          int _minus_1 = (_length_1 - size);
          Day16.initial.delete(_minus_1, Day16.initial.length());
          Day16.initial.insert(0, to_move);
        }
        if (!_matched) {
          if (Objects.equal(first, "x")) {
            _matched=true;
            final int first_position = Integer.parseInt(others[0]);
            final int second_position = Integer.parseInt(others[1]);
            final char first_prog = Day16.initial.charAt(first_position);
            final char second_prog = Day16.initial.charAt(second_position);
            Day16.initial.setCharAt(first_position, second_prog);
            Day16.initial.setCharAt(second_position, first_prog);
          }
        }
        if (!_matched) {
          if (Objects.equal(first, "p")) {
            _matched=true;
            final char first_prog_1 = (others[0]).charAt(0);
            final char second_prog_1 = (others[1]).charAt(0);
            final int first_position_1 = Day16.initial.indexOf(others[0]);
            final int second_position_1 = Day16.initial.indexOf(others[1]);
            Day16.initial.setCharAt(first_position_1, second_prog_1);
            Day16.initial.setCharAt(second_position_1, first_prog_1);
          }
        }
      }
    };
    Day16.moves.forEach(_function);
  }
}
