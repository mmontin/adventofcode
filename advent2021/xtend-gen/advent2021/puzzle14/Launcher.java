package advent2021.puzzle14;

import advent2021.Utils;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.IntPredicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final int nb_of_steps = 40;
  
  private static final String sample = "CVKKFSSNNHNPSPPKBHPB";
  
  private static final Map<String, Set<String>> transformations = IterableExtensions.<String, HashMap<String, Set<String>>>fold(Utils.getInputs(14), CollectionLiterals.<String, Set<String>>newHashMap(), new Function2<HashMap<String, Set<String>>, String, HashMap<String, Set<String>>>() {
    public HashMap<String, Set<String>> apply(final HashMap<String, Set<String>> trans, final String v) {
      HashMap<String, Set<String>> _xblockexpression = null;
      {
        final String[] split = v.split(" -> ");
        final String left = split[0];
        final String right = split[1];
        String _substring = left.substring(0, 1);
        String _plus = (_substring + right);
        String _substring_1 = left.substring(1, 2);
        String _plus_1 = (right + _substring_1);
        trans.put(left, CollectionLiterals.<String>newHashSet(_plus, _plus_1));
        _xblockexpression = trans;
      }
      return _xblockexpression;
    }
  });
  
  private static final Set<Character> set_of_letters = IterableExtensions.<Map.Entry<String, Set<String>>, HashSet<Character>>fold(Launcher.transformations.entrySet(), CollectionLiterals.<Character>newHashSet(), new Function2<HashSet<Character>, Map.Entry<String, Set<String>>, HashSet<Character>>() {
    public HashSet<Character> apply(final HashSet<Character> set, final Map.Entry<String, Set<String>> e) {
      HashSet<Character> _xblockexpression = null;
      {
        set.addAll(((Collection<? extends Character>)Conversions.doWrapArray(e.getKey().toCharArray())));
        set.addAll(((Collection<? extends Character>)Conversions.doWrapArray((((String[])Conversions.unwrapArray(e.getValue(), String.class))[0]).toCharArray())));
        set.addAll(((Collection<? extends Character>)Conversions.doWrapArray((((String[])Conversions.unwrapArray(e.getValue(), String.class))[1]).toCharArray())));
        _xblockexpression = set;
      }
      return _xblockexpression;
    }
  });
  
  public static void main(final String[] args) {
    final HashMap<String, Long> sample_mapped = CollectionLiterals.<String, Long>newHashMap();
    int _length = Launcher.sample.length();
    int _minus = (_length - 2);
    IntegerRange _upTo = new IntegerRange(0, _minus);
    for (final Integer i : _upTo) {
      final BiFunction<Long, Long, Long> _function = new BiFunction<Long, Long, Long>() {
        public Long apply(final Long v, final Long w) {
          return Long.valueOf(((v).longValue() + (w).longValue()));
        }
      };
      sample_mapped.merge(Launcher.sample.substring((i).intValue(), ((i).intValue() + 2)), Long.valueOf(1L), _function);
    }
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Launcher.nb_of_steps, true);
    for (final Integer i_1 : _doubleDotLessThan) {
      {
        Set<Map.Entry<String, Long>> _entrySet = sample_mapped.entrySet();
        final HashSet<Map.Entry<String, Long>> entrySet = new HashSet<Map.Entry<String, Long>>(_entrySet);
        sample_mapped.clear();
        final Consumer<Map.Entry<String, Long>> _function_1 = new Consumer<Map.Entry<String, Long>>() {
          public void accept(final Map.Entry<String, Long> e) {
            final Consumer<String> _function = new Consumer<String>() {
              public void accept(final String s) {
                final BiFunction<Long, Long, Long> _function = new BiFunction<Long, Long, Long>() {
                  public Long apply(final Long v, final Long w) {
                    return Long.valueOf(((v).longValue() + (w).longValue()));
                  }
                };
                sample_mapped.merge(s, e.getValue(), _function);
              }
            };
            Launcher.transformations.get(e.getKey()).forEach(_function);
          }
        };
        entrySet.forEach(_function_1);
      }
    }
    final Function1<Character, Character> _function_1 = new Function1<Character, Character>() {
      public Character apply(final Character it) {
        return it;
      }
    };
    final Function1<Character, Long> _function_2 = new Function1<Character, Long>() {
      public Long apply(final Character c) {
        final Function2<Long, Map.Entry<String, Long>, Long> _function = new Function2<Long, Map.Entry<String, Long>, Long>() {
          public Long apply(final Long nb, final Map.Entry<String, Long> e) {
            final IntPredicate _function = new IntPredicate() {
              public boolean test(final int it) {
                return (it == (c).charValue());
              }
            };
            long _count = e.getKey().chars().filter(_function).count();
            Long _value = e.getValue();
            long _multiply = (_count * (_value).longValue());
            return Long.valueOf(((nb).longValue() + _multiply));
          }
        };
        Long _fold = IterableExtensions.<Map.Entry<String, Long>, Long>fold(sample_mapped.entrySet(), Long.valueOf(0L), _function);
        int _xifexpression = (int) 0;
        if ((((c).charValue() == Launcher.sample.charAt(0)) || ((c).charValue() == Launcher.sample.charAt((Launcher.sample.length() - 1))))) {
          _xifexpression = 1;
        } else {
          _xifexpression = 0;
        }
        long _plus = ((_fold).longValue() + _xifexpression);
        return Long.valueOf((_plus / 2));
      }
    };
    final List<Long> occurrences = IterableExtensions.<Long>sort(IterableExtensions.<Character, Long>map(IterableExtensions.<Character, Character>map(Launcher.set_of_letters, _function_1), _function_2));
    Long _last = IterableExtensions.<Long>last(occurrences);
    Long _get = occurrences.get(0);
    long _minus_1 = ((_last).longValue() - (_get).longValue());
    InputOutput.<Long>println(Long.valueOf(_minus_1));
  }
}
