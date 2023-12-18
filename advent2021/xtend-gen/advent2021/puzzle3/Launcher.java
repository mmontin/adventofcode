package advent2021.puzzle3;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Predicate;

import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

import com.google.common.base.Objects;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Launcher {
  public static class Pair {
    private int nbOfZeros;

    private int nbOfOnes;

    public Pair() {
      this.nbOfZeros = 0;
      this.nbOfOnes = 0;
    }

    public Launcher.Pair add(final char c) {
      Launcher.Pair _xblockexpression = null;
      {
        String _plus = (Character.valueOf(c) + "");
        boolean _equals = Objects.equal(_plus, "0");
        if (_equals) {
          this.nbOfZeros++;
        } else {
          this.nbOfOnes++;
        }
        _xblockexpression = this;
      }
      return _xblockexpression;
    }

    public int most() {
      int _xifexpression = (int) 0;
      if ((this.nbOfOnes >= this.nbOfZeros)) {
        _xifexpression = 1;
      } else {
        _xifexpression = 0;
      }
      return _xifexpression;
    }
  }

  public static void main(final String[] args) {
    final Function1<String, char[]> _function = new Function1<String, char[]>() {
      public char[] apply(final String it) {
        return it.toCharArray();
      }
    };
    final List<char[]> input = new InputLoader(Integer.valueOf(2021), Integer.valueOf(3)).<char[]>getInputs(_function);
    ArrayList<Launcher.Pair> _arrayList = new ArrayList<Launcher.Pair>();
    final Function2<ArrayList<Launcher.Pair>, char[], ArrayList<Launcher.Pair>> _function_1 = new Function2<ArrayList<Launcher.Pair>, char[], ArrayList<Launcher.Pair>>() {
      public ArrayList<Launcher.Pair> apply(final ArrayList<Launcher.Pair> v, final char[] l) {
        ArrayList<Launcher.Pair> _xblockexpression = null;
        {
          boolean _isEmpty = v.isEmpty();
          if (_isEmpty) {
            int _size = ((List<Character>)Conversions.doWrapArray(l)).size();
            final Consumer<Integer> _function = new Consumer<Integer>() {
              public void accept(final Integer it) {
                Launcher.Pair _pair = new Launcher.Pair();
                v.add(_pair);
              }
            };
            new ExclusiveRange(0, _size, true).forEach(_function);
          }
          int _size_1 = ((List<Character>)Conversions.doWrapArray(l)).size();
          ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size_1, true);
          for (final Integer i : _doubleDotLessThan) {
            v.get((i).intValue()).add(l[(i).intValue()]);
          }
          _xblockexpression = v;
        }
        return _xblockexpression;
      }
    };
    final ArrayList<Launcher.Pair> list = IterableExtensions.<char[], ArrayList<Launcher.Pair>>fold(input, _arrayList, _function_1);
    final Function2<String, Launcher.Pair, String> _function_2 = new Function2<String, Launcher.Pair, String>() {
      public String apply(final String v, final Launcher.Pair l) {
        int _most = l.most();
        return (v + Integer.valueOf(_most));
      }
    };
    int _parseInt = Integer.parseInt(IterableExtensions.<Launcher.Pair, String>fold(list, "", _function_2), 2);
    final Function2<String, Launcher.Pair, String> _function_3 = new Function2<String, Launcher.Pair, String>() {
      public String apply(final String v, final Launcher.Pair l) {
        int _most = l.most();
        int _minus = (1 - _most);
        return (v + Integer.valueOf(_minus));
      }
    };
    int _parseInt_1 = Integer.parseInt(IterableExtensions.<Launcher.Pair, String>fold(list, "", _function_3), 2);
    int _multiply = (_parseInt * _parseInt_1);
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
    int _parseInt_2 = Integer.parseInt(String.valueOf(Launcher.helper(input, true)), 2);
    int _parseInt_3 = Integer.parseInt(String.valueOf(Launcher.helper(input, false)), 2);
    int _multiply_1 = (_parseInt_2 * _parseInt_3);
    InputOutput.<Integer>println(Integer.valueOf(_multiply_1));
  }

  public static char[] helper(final List<char[]> input, final boolean most) {
    char[] _xblockexpression = null;
    {
      ArrayList<char[]> myL = new ArrayList<char[]>(input);
      int i = 0;
      while (((i < ((List<Character>)Conversions.doWrapArray(input.get(0))).size()) && (myL.size() > 1))) {
        {
          final int loop = i;
          Launcher.Pair _pair = new Launcher.Pair();
          final Function2<Launcher.Pair, char[], Launcher.Pair> _function = new Function2<Launcher.Pair, char[], Launcher.Pair>() {
            public Launcher.Pair apply(final Launcher.Pair v, final char[] l) {
              return v.add(l[loop]);
            }
          };
          final Launcher.Pair p = IterableExtensions.<char[], Launcher.Pair>fold(myL, _pair, _function);
          final Predicate<char[]> _function_1 = new Predicate<char[]>() {
            public boolean test(final char[] l) {
              int _parseInt = Integer.parseInt(String.valueOf(l[loop]));
              int _xifexpression = (int) 0;
              if (most) {
                _xifexpression = p.most();
              } else {
                int _most = p.most();
                _xifexpression = (1 - _most);
              }
              return (_parseInt != _xifexpression);
            }
          };
          myL.removeIf(_function_1);
          i++;
        }
      }
      _xblockexpression = myL.get(0);
    }
    return _xblockexpression;
  }
}
