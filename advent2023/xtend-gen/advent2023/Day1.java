package advent2023;

import adventutils.input.InputLoader;
import adventutils.string.StringUtils;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day1 {
  private static final Set<Pair<String, String>> numbers = CollectionLiterals.<Pair<String, String>>newHashSet(
    Pair.<String, String>of("1", "one"), 
    Pair.<String, String>of("2", "two"), 
    Pair.<String, String>of("3", "three"), 
    Pair.<String, String>of("4", "four"), 
    Pair.<String, String>of("5", "five"), 
    Pair.<String, String>of("6", "six"), 
    Pair.<String, String>of("7", "seven"), 
    Pair.<String, String>of("8", "eight"), 
    Pair.<String, String>of("9", "nine"));

  private static final Set<Pair<String, String>> srebmun = IterableExtensions.<Pair<String, String>>toSet(IterableExtensions.<Pair<String, String>, Pair<String, String>>map(Day1.numbers, new Function1<Pair<String, String>, Pair<String, String>>() {
    public Pair<String, String> apply(final Pair<String, String> x) {
      String _key = x.getKey();
      String _reverse = StringUtils.reverse(x.getValue());
      return Pair.<String, String>of(_key, _reverse);
    }
  }));

  public static void main(final String[] args) {
    List<String> _inputs = new InputLoader(Integer.valueOf(2023), Integer.valueOf(1)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>>() {
      public Pair<Integer, Integer> apply(final Pair<Integer, Integer> e, final String v) {
        Pair<Integer, Integer> _xblockexpression = null;
        {
          final String revV = StringUtils.reverse(v);
          Integer _key = e.getKey();
          String _findFirst = Day1.findFirst(v, false, Day1.numbers);
          String _findFirst_1 = Day1.findFirst(revV, false, Day1.srebmun);
          String _plus = (_findFirst + _findFirst_1);
          int _parseInt = Integer.parseInt(_plus);
          final int left = ((_key).intValue() + _parseInt);
          Integer _value = e.getValue();
          String _findFirst_2 = Day1.findFirst(v, true, Day1.numbers);
          String _findFirst_3 = Day1.findFirst(revV, true, Day1.srebmun);
          String _plus_1 = (_findFirst_2 + _findFirst_3);
          int _parseInt_1 = Integer.parseInt(_plus_1);
          final int right = ((_value).intValue() + _parseInt_1);
          _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(left), Integer.valueOf(right));
        }
        return _xblockexpression;
      }
    };
    InputOutput.<Pair<Integer, Integer>>println(IterableExtensions.<String, Pair<Integer, Integer>>fold(_inputs, _mappedTo, _function));
  }

  public static String findFirst(final String s, final boolean withLetters, final Set<Pair<String, String>> candidates) {
    String _xblockexpression = null;
    {
      int i = 0;
      final int sLength = s.length();
      String res = null;
      while ((res == null)) {
        {
          final String currentString = s.substring(i, sLength);
          final Function1<Pair<String, String>, Boolean> _function = new Function1<Pair<String, String>, Boolean>() {
            public Boolean apply(final Pair<String, String> x) {
              return Boolean.valueOf((currentString.startsWith(x.getKey()) || (withLetters && currentString.startsWith(x.getValue()))));
            }
          };
          final Pair<String, String> element = IterableExtensions.<Pair<String, String>>findFirst(candidates, _function);
          if ((element != null)) {
            res = element.getKey();
          }
          i++;
        }
      }
      _xblockexpression = res;
    }
    return _xblockexpression;
  }
}
