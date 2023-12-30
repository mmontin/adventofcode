package advent2021.puzzle10;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final Function1<String, List<Character>> _function = new Function1<String, List<Character>>() {
      public List<Character> apply(final String it) {
        return IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())));
      }
    };
    final Function2<ArrayList<BigInteger>, List<Character>, ArrayList<BigInteger>> _function_1 = new Function2<ArrayList<BigInteger>, List<Character>, ArrayList<BigInteger>>() {
      public ArrayList<BigInteger> apply(final ArrayList<BigInteger> list, final List<Character> input) {
        ArrayList<BigInteger> _xblockexpression = null;
        {
          final Function1<Character, String> _function = new Function1<Character, String>() {
            public String apply(final Character it) {
              return (it + "");
            }
          };
          BigInteger processed = Launcher.process(ListExtensions.<Character, String>map(input, _function));
          int _compareTo = processed.compareTo(BigInteger.valueOf(0));
          boolean _greaterThan = (_compareTo > 0);
          if (_greaterThan) {
            list.add(processed);
          }
          _xblockexpression = list;
        }
        return _xblockexpression;
      }
    };
    final List<BigInteger> output = IterableExtensions.<BigInteger>sort(IterableExtensions.<List<Character>, ArrayList<BigInteger>>fold(new InputLoader(Integer.valueOf(2021), Integer.valueOf(10)).<List<Character>>getInputs(_function), CollectionLiterals.<BigInteger>newArrayList(), _function_1));
    int _size = output.size();
    int _divide = (_size / 2);
    InputOutput.<BigInteger>println(output.get(_divide));
  }

  public static BigInteger process(final List<String> input) {
    BigInteger _xblockexpression = null;
    {
      final Stack<String> stack = new Stack<String>();
      int error = 0;
      int i = 0;
      while (((error == 0) && (i < input.size()))) {
        {
          int _plusPlus = i++;
          final String v = input.get(_plusPlus);
          boolean _matched = false;
          if (Objects.equal(v, "<")) {
            _matched=true;
          }
          if (!_matched) {
            if (Objects.equal(v, "(")) {
              _matched=true;
            }
          }
          if (!_matched) {
            if (Objects.equal(v, "{")) {
              _matched=true;
            }
          }
          if (!_matched) {
            if (Objects.equal(v, "[")) {
              _matched=true;
            }
          }
          if (_matched) {
            stack.push(v);
          }
          if (!_matched) {
            if (Objects.equal(v, ">")) {
              _matched=true;
              boolean _equals = stack.pop().equals("<");
              boolean _not = (!_equals);
              if (_not) {
                error = 25137;
              }
            }
          }
          if (!_matched) {
            if (Objects.equal(v, ")")) {
              _matched=true;
              boolean _equals_1 = stack.pop().equals("(");
              boolean _not_1 = (!_equals_1);
              if (_not_1) {
                error = 3;
              }
            }
          }
          if (!_matched) {
            if (Objects.equal(v, "}")) {
              _matched=true;
              boolean _equals_2 = stack.pop().equals("{");
              boolean _not_2 = (!_equals_2);
              if (_not_2) {
                error = 1197;
              }
            }
          }
          if (!_matched) {
            boolean _equals_3 = stack.pop().equals("[");
            boolean _not_3 = (!_equals_3);
            if (_not_3) {
              error = 57;
            }
          }
        }
      }
      BigInteger _xifexpression = null;
      if ((error != 0)) {
        _xifexpression = BigInteger.valueOf((-1));
      } else {
        BigInteger _xblockexpression_1 = null;
        {
          BigInteger score = BigInteger.valueOf(0);
          while ((!stack.empty())) {
            {
              int value = 0;
              String _pop = stack.pop();
              boolean _matched = false;
              if (Objects.equal(_pop, "<")) {
                _matched=true;
                value = 4;
              }
              if (!_matched) {
                if (Objects.equal(_pop, "(")) {
                  _matched=true;
                  value = 1;
                }
              }
              if (!_matched) {
                if (Objects.equal(_pop, "{")) {
                  _matched=true;
                  value = 3;
                }
              }
              if (!_matched) {
                value = 2;
              }
              score = BigInteger.valueOf(5).multiply(score).add(BigInteger.valueOf(value));
            }
          }
          _xblockexpression_1 = score;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
