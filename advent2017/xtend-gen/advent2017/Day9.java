package advent2017;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.List;
import java.util.Stack;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day9 {
  public static void main(final String[] args) {
    final Function1<Character, String> _function = new Function1<Character, String>() {
      public String apply(final Character it) {
        return (it + "");
      }
    };
    final List<String> stream = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(9)).getInputs()).toCharArray())), _function);
    int i = 0;
    boolean inGarbage = false;
    final Stack<Integer> scores = new Stack<Integer>();
    int totalScore = 0;
    int nbGarbage = 0;
    while ((i < stream.size())) {
      {
        String _get = stream.get(i);
        boolean _matched = false;
        if (Objects.equal(_get, "<")) {
          _matched=true;
          if ((!inGarbage)) {
            inGarbage = true;
          } else {
            nbGarbage++;
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, ">")) {
            _matched=true;
            inGarbage = false;
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "{")) {
            _matched=true;
            if ((!inGarbage)) {
              int _xifexpression = (int) 0;
              boolean _isEmpty = scores.isEmpty();
              if (_isEmpty) {
                _xifexpression = 1;
              } else {
                Integer _peek = scores.peek();
                _xifexpression = ((_peek).intValue() + 1);
              }
              scores.push(Integer.valueOf(_xifexpression));
            } else {
              nbGarbage++;
            }
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "}")) {
            _matched=true;
            if ((!inGarbage)) {
              int _talScore = totalScore;
              Integer _pop = scores.pop();
              totalScore = (_talScore + (_pop).intValue());
            } else {
              nbGarbage++;
            }
          }
        }
        if (!_matched) {
          if (Objects.equal(_get, "!")) {
            _matched=true;
            if (inGarbage) {
              i++;
            }
          }
        }
        if (!_matched) {
          if (inGarbage) {
            nbGarbage++;
          }
        }
        i++;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(totalScore));
    InputOutput.<Integer>println(Integer.valueOf(nbGarbage));
  }
}
