package advent2017;

import java.util.Set;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

import com.google.common.base.Objects;

@SuppressWarnings("all")
public class Day25 {
  private static String state = "A";

  private static int position = 0;

  private static Set<Integer> ons = CollectionLiterals.<Integer>newHashSet();

  public static void main(final String[] args) {
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day25.step();
      }
    };
    new ExclusiveRange(0, 12683008, true).forEach(_function);
    InputOutput.<Integer>println(Integer.valueOf(Day25.ons.size()));
  }

  public static void step() {
    final String state = Day25.state;
    boolean _matched = false;
    if (Objects.equal(state, "A")) {
      _matched=true;
      boolean _contains = Day25.ons.contains(Integer.valueOf(Day25.position));
      boolean _not = (!_contains);
      if (_not) {
        Day25.ons.add(Integer.valueOf(Day25.position));
        Day25.position++;
        Day25.state = "B";
      } else {
        Day25.ons.remove(Integer.valueOf(Day25.position));
        Day25.position--;
        Day25.state = "B";
      }
    }
    if (!_matched) {
      if (Objects.equal(state, "B")) {
        _matched=true;
        boolean _contains_1 = Day25.ons.contains(Integer.valueOf(Day25.position));
        boolean _not_1 = (!_contains_1);
        if (_not_1) {
          Day25.ons.add(Integer.valueOf(Day25.position));
          Day25.position--;
          Day25.state = "C";
        } else {
          Day25.ons.remove(Integer.valueOf(Day25.position));
          Day25.position++;
          Day25.state = "E";
        }
      }
    }
    if (!_matched) {
      if (Objects.equal(state, "C")) {
        _matched=true;
        boolean _contains_2 = Day25.ons.contains(Integer.valueOf(Day25.position));
        boolean _not_2 = (!_contains_2);
        if (_not_2) {
          Day25.ons.add(Integer.valueOf(Day25.position));
          Day25.position++;
          Day25.state = "E";
        } else {
          Day25.ons.remove(Integer.valueOf(Day25.position));
          Day25.position--;
          Day25.state = "D";
        }
      }
    }
    if (!_matched) {
      if (Objects.equal(state, "D")) {
        _matched=true;
        boolean _contains_3 = Day25.ons.contains(Integer.valueOf(Day25.position));
        boolean _not_3 = (!_contains_3);
        if (_not_3) {
          Day25.ons.add(Integer.valueOf(Day25.position));
          Day25.position--;
          Day25.state = "A";
        } else {
          Day25.position--;
          Day25.state = "A";
        }
      }
    }
    if (!_matched) {
      if (Objects.equal(state, "E")) {
        _matched=true;
        boolean _contains_4 = Day25.ons.contains(Integer.valueOf(Day25.position));
        boolean _not_4 = (!_contains_4);
        if (_not_4) {
          Day25.position++;
          Day25.state = "A";
        } else {
          Day25.ons.remove(Integer.valueOf(Day25.position));
          Day25.position++;
          Day25.state = "F";
        }
      }
    }
    if (!_matched) {
      boolean _contains_5 = Day25.ons.contains(Integer.valueOf(Day25.position));
      boolean _not_5 = (!_contains_5);
      if (_not_5) {
        Day25.ons.add(Integer.valueOf(Day25.position));
        Day25.position++;
        Day25.state = "E";
      } else {
        Day25.position++;
        Day25.state = "A";
      }
    }
  }
}
