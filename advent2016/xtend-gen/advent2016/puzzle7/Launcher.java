package advent2016.puzzle7;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2016), Integer.valueOf(7)).getInputs();
    final Function2<Integer, String, Integer> _function = new Function2<Integer, String, Integer>() {
      public Integer apply(final Integer v, final String e) {
        int _xifexpression = (int) 0;
        boolean _checkTLS = Launcher.checkTLS(e);
        if (_checkTLS) {
          _xifexpression = 1;
        } else {
          _xifexpression = 0;
        }
        return Integer.valueOf(((v).intValue() + _xifexpression));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Integer>fold(input, Integer.valueOf(0), _function));
    final Function2<Integer, String, Integer> _function_1 = new Function2<Integer, String, Integer>() {
      public Integer apply(final Integer v, final String e) {
        int _xifexpression = (int) 0;
        Boolean _checkSSL = Launcher.checkSSL(e);
        if ((_checkSSL).booleanValue()) {
          _xifexpression = 1;
        } else {
          _xifexpression = 0;
        }
        return Integer.valueOf(((v).intValue() + _xifexpression));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Integer>fold(input, Integer.valueOf(0), _function_1));
  }

  public static Boolean checkSSL(final String s) {
    Boolean _xblockexpression = null;
    {
      String tmp = s;
      final ArrayList<String> s1 = CollectionLiterals.<String>newArrayList();
      final ArrayList<String> s2 = CollectionLiterals.<String>newArrayList();
      while (tmp.contains("[")) {
        {
          int i = tmp.indexOf("[");
          int j = tmp.indexOf("]");
          s1.addAll(Launcher.getSSLPatterns(tmp.substring(0, i)));
          s2.addAll(Launcher.getSSLPatterns(tmp.substring((i + 1), j)));
          tmp = tmp.substring((j + 1));
        }
      }
      s1.addAll(Launcher.getSSLPatterns(tmp));
      final Function2<Boolean, String, Boolean> _function = new Function2<Boolean, String, Boolean>() {
        public Boolean apply(final Boolean b, final String e) {
          return Boolean.valueOf(((b).booleanValue() || (IterableExtensions.<String>findFirst(s2, new Function1<String, Boolean>() {
            public Boolean apply(final String it) {
              return Boolean.valueOf(Launcher.compatible(it, e));
            }
          }) != null)));
        }
      };
      _xblockexpression = IterableExtensions.<String, Boolean>fold(s1, Boolean.valueOf(false), _function);
    }
    return _xblockexpression;
  }

  public static boolean checkTLS(final String s) {
    boolean _xblockexpression = false;
    {
      String tmp = s;
      boolean s1 = false;
      boolean s2 = false;
      while (tmp.contains("[")) {
        {
          int i = tmp.indexOf("[");
          int j = tmp.indexOf("]");
          s1 = (s1 || Launcher.hasTLSPattern(tmp.substring(0, i)));
          s2 = (s2 || Launcher.hasTLSPattern(tmp.substring((i + 1), j)));
          tmp = tmp.substring((j + 1));
        }
      }
      s1 = (s1 || Launcher.hasTLSPattern(tmp));
      _xblockexpression = (s1 && (!s2));
    }
    return _xblockexpression;
  }

  public static ArrayList<String> getSSLPatterns(final String s) {
    ArrayList<String> _xblockexpression = null;
    {
      final ArrayList<String> ans = CollectionLiterals.<String>newArrayList();
      int _length = s.length();
      int _minus = (_length - 3);
      final Consumer<Integer> _function = new Consumer<Integer>() {
        public void accept(final Integer i) {
          boolean _smallHasSSLPatter = Launcher.smallHasSSLPatter(s.substring((i).intValue(), ((i).intValue() + 3)));
          if (_smallHasSSLPatter) {
            ans.add(s.substring((i).intValue(), ((i).intValue() + 3)));
          }
        }
      };
      new IntegerRange(0, _minus).forEach(_function);
      _xblockexpression = ans;
    }
    return _xblockexpression;
  }

  public static boolean hasTLSPattern(final String s) {
    boolean _xblockexpression = false;
    {
      int i = 0;
      boolean ans = false;
      while (((i <= (s.length() - 4)) && (!ans))) {
        {
          ans = (ans || Launcher.smallHasTLSPattern(s.substring(i, (i + 4))));
          i++;
        }
      }
      _xblockexpression = ans;
    }
    return _xblockexpression;
  }

  public static boolean smallHasSSLPatter(final String s) {
    return (Character.valueOf(s.charAt(0)).equals(Character.valueOf(s.charAt(2))) && 
      (!Character.valueOf(s.charAt(0)).equals(Character.valueOf(s.charAt(1)))));
  }

  public static boolean smallHasTLSPattern(final String s) {
    return ((Character.valueOf(s.charAt(0)).equals(Character.valueOf(s.charAt(3))) && 
      Character.valueOf(s.charAt(1)).equals(Character.valueOf(s.charAt(2)))) && 
      (!Character.valueOf(s.charAt(0)).equals(Character.valueOf(s.charAt(1)))));
  }

  public static boolean compatible(final String s1, final String s2) {
    return (Character.valueOf(s1.charAt(0)).equals(Character.valueOf(s2.charAt(1))) && 
      Character.valueOf(s2.charAt(0)).equals(Character.valueOf(s1.charAt(1))));
  }
}
