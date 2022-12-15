package advent2016.puzzle4;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static class Tuple implements Comparable<Launcher.Tuple> {
    private String s;

    private int occurrences;

    public Tuple(final String s_, final int occurrences_) {
      this.s = s_;
      this.occurrences = occurrences_;
    }

    public int compareTo(final Launcher.Tuple other) {
      int _xifexpression = (int) 0;
      if ((this.occurrences > other.occurrences)) {
        _xifexpression = (-1);
      } else {
        int _xifexpression_1 = (int) 0;
        if ((this.occurrences < other.occurrences)) {
          _xifexpression_1 = 1;
        } else {
          _xifexpression_1 = this.s.compareTo(other.s);
        }
        _xifexpression = _xifexpression_1;
      }
      return _xifexpression;
    }

    public String toString() {
      return (((("(" + this.s) + ",") + Integer.valueOf(this.occurrences)) + ")");
    }
  }

  public static class Entry {
    private static final String alphabet = "abcdefghijklmnopqrstuvwxyz";

    private List<String> encrypted_name;

    private Integer sector_id;

    private String checksum;

    public Entry(final String s) {
      final List<String> split = IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray(s.split("-"))));
      final String[] split1 = IterableExtensions.<String>last(split).split("\\[");
      this.sector_id = Integer.valueOf(Integer.parseInt(split1[0]));
      this.checksum = (split1[1]).split("\\]")[0];
      int _size = split.size();
      int _minus = (_size - 1);
      this.encrypted_name = IterableExtensions.<String>toList(IterableExtensions.<String>take(split, _minus));
    }

    public boolean verifyChecksum() {
      boolean _xblockexpression = false;
      {
        final Function2<ArrayList<String>, String, ArrayList<String>> _function = new Function2<ArrayList<String>, String, ArrayList<String>>() {
          public ArrayList<String> apply(final ArrayList<String> l, final String v) {
            ArrayList<String> _xblockexpression = null;
            {
              final Function1<Character, String> _function = new Function1<Character, String>() {
                public String apply(final Character it) {
                  return (it + "");
                }
              };
              l.addAll(ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(v.toCharArray())), _function));
              _xblockexpression = l;
            }
            return _xblockexpression;
          }
        };
        final ArrayList<String> encrypted_name_sampled = IterableExtensions.<String, ArrayList<String>>fold(this.encrypted_name, CollectionLiterals.<String>newArrayList(), _function);
        final Function2<ArrayList<Launcher.Tuple>, String, ArrayList<Launcher.Tuple>> _function_1 = new Function2<ArrayList<Launcher.Tuple>, String, ArrayList<Launcher.Tuple>>() {
          public ArrayList<Launcher.Tuple> apply(final ArrayList<Launcher.Tuple> l, final String e) {
            ArrayList<Launcher.Tuple> _xblockexpression = null;
            {
              int _frequency = Collections.frequency(encrypted_name_sampled, e);
              Launcher.Tuple _tuple = new Launcher.Tuple(e, _frequency);
              l.add(_tuple);
              _xblockexpression = l;
            }
            return _xblockexpression;
          }
        };
        final Function1<Launcher.Tuple, String> _function_2 = new Function1<Launcher.Tuple, String>() {
          public String apply(final Launcher.Tuple it) {
            return it.s;
          }
        };
        _xblockexpression = IterableExtensions.join(IterableExtensions.<Launcher.Tuple, String>map(IterableExtensions.<Launcher.Tuple>take(IterableExtensions.<Launcher.Tuple>sort(IterableExtensions.<String, ArrayList<Launcher.Tuple>>fold(IterableExtensions.<String>toSet(encrypted_name_sampled), CollectionLiterals.<Launcher.Tuple>newArrayList(), _function_1)), 5), _function_2)).equals(this.checksum);
      }
      return _xblockexpression;
    }

    public String decode() {
      final Function1<String, String> _function = new Function1<String, String>() {
        public String apply(final String it) {
          final Function2<String, Character, String> _function = new Function2<String, Character, String>() {
            public String apply(final String s, final Character v) {
              int _indexOf = Launcher.Entry.alphabet.indexOf((v).charValue());
              int _plus = (_indexOf + (Entry.this.sector_id).intValue());
              int _modulo = (_plus % 26);
              char _charAt = Launcher.Entry.alphabet.charAt(_modulo);
              return (s + Character.valueOf(_charAt));
            }
          };
          return IterableExtensions.<Character, String>fold(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())), "", _function);
        }
      };
      return IterableExtensions.join(ListExtensions.<String, String>map(this.encrypted_name, _function), "-");
    }
  }

  public static void main(final String[] args) {
    final Function1<String, Launcher.Entry> _function = new Function1<String, Launcher.Entry>() {
      public Launcher.Entry apply(final String it) {
        return new Launcher.Entry(it);
      }
    };
    final List<Launcher.Entry> entries = new InputLoader(Integer.valueOf(2016), Integer.valueOf(4)).<Launcher.Entry>getInputs(_function);
    final Function2<Integer, Launcher.Entry, Integer> _function_1 = new Function2<Integer, Launcher.Entry, Integer>() {
      public Integer apply(final Integer sum, final Launcher.Entry e) {
        Integer _xifexpression = null;
        boolean _verifyChecksum = e.verifyChecksum();
        if (_verifyChecksum) {
          _xifexpression = Integer.valueOf(((sum).intValue() + (e.sector_id).intValue()));
        } else {
          _xifexpression = sum;
        }
        return _xifexpression;
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Launcher.Entry, Integer>fold(entries, Integer.valueOf(0), _function_1));
    final Function1<Launcher.Entry, Boolean> _function_2 = new Function1<Launcher.Entry, Boolean>() {
      public Boolean apply(final Launcher.Entry it) {
        return Boolean.valueOf(it.verifyChecksum());
      }
    };
    final Function1<Launcher.Entry, Boolean> _function_3 = new Function1<Launcher.Entry, Boolean>() {
      public Boolean apply(final Launcher.Entry it) {
        return Boolean.valueOf(it.decode().contains("north"));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Launcher.Entry>findFirst(IterableExtensions.<Launcher.Entry>filter(entries, _function_2), _function_3).sector_id);
  }
}
