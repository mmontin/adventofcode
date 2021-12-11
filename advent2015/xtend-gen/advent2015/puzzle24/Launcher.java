package advent2015.puzzle24;

import advent2015.Utils;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Set<Set<Integer>> possible_subsets = CollectionLiterals.<Set<Integer>>newHashSet();
  
  private static int min_size = Integer.MAX_VALUE;
  
  public static void main(final String[] args) {
    try {
      final Function1<String, Integer> _function = new Function1<String, Integer>() {
        public Integer apply(final String it) {
          return Integer.valueOf(Integer.parseInt(it));
        }
      };
      final List<Integer> packages = IterableExtensions.<Integer>toList(ListExtensions.<String, Integer>map(ListExtensions.<String>reverse(((List<String>)Conversions.doWrapArray(Utils.getInputs(24).get(0).split(" ")))), _function));
      final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
        public Integer apply(final Integer x, final Integer y) {
          return Integer.valueOf(((x).intValue() + (y).intValue()));
        }
      };
      Integer _fold = IterableExtensions.<Integer, Integer>fold(packages, Integer.valueOf(0), _function_1);
      int _divide = ((_fold).intValue() / 4);
      Launcher.compute(packages, Integer.valueOf(_divide), CollectionLiterals.<Integer>newHashSet());
      final Function2<Long, Set<Integer>, Long> _function_2 = new Function2<Long, Set<Integer>, Long>() {
        public Long apply(final Long min, final Set<Integer> s) {
          final Function2<Long, Integer, Long> _function = new Function2<Long, Integer, Long>() {
            public Long apply(final Long v, final Integer e) {
              return Long.valueOf(((v).longValue() * (e).intValue()));
            }
          };
          return Long.valueOf(Math.min((min).longValue(), (IterableExtensions.<Integer, Long>fold(s, Long.valueOf(1), _function)).longValue()));
        }
      };
      InputOutput.<Long>println(IterableExtensions.<Set<Integer>, Long>fold(Launcher.possible_subsets, Long.valueOf(Long.MAX_VALUE), _function_2));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static boolean update(final Set<Integer> packages) {
    boolean _xblockexpression = false;
    {
      Launcher.possible_subsets.add(packages);
      final Function2<Integer, Set<Integer>, Integer> _function = new Function2<Integer, Set<Integer>, Integer>() {
        public Integer apply(final Integer min, final Set<Integer> s) {
          return Integer.valueOf(Math.min((min).intValue(), s.size()));
        }
      };
      Launcher.min_size = (IterableExtensions.<Set<Integer>, Integer>fold(Launcher.possible_subsets, Integer.valueOf(Integer.MAX_VALUE), _function)).intValue();
      final Predicate<Set<Integer>> _function_1 = new Predicate<Set<Integer>>() {
        public boolean test(final Set<Integer> it) {
          int _size = it.size();
          return (_size > Launcher.min_size);
        }
      };
      _xblockexpression = Launcher.possible_subsets.removeIf(_function_1);
    }
    return _xblockexpression;
  }
  
  public static void compute(final List<Integer> remaining_candidates, final Integer remaining_weight, final Set<Integer> packages_already_taken) {
    int _size = packages_already_taken.size();
    boolean _lessEqualsThan = (_size <= Launcher.min_size);
    if (_lessEqualsThan) {
      if (((remaining_weight).intValue() == 0)) {
        Launcher.update(packages_already_taken);
      } else {
        final ArrayList<Integer> candidates_refined = new ArrayList<Integer>(remaining_candidates);
        final Predicate<Integer> _function = new Predicate<Integer>() {
          public boolean test(final Integer x) {
            return (x.compareTo(remaining_weight) > 0);
          }
        };
        candidates_refined.removeIf(_function);
        final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
          public Integer apply(final Integer v, final Integer x) {
            return Integer.valueOf(((v).intValue() + (x).intValue()));
          }
        };
        Integer _fold = IterableExtensions.<Integer, Integer>fold(candidates_refined, Integer.valueOf(0), _function_1);
        final int difference = ((_fold).intValue() - (remaining_weight).intValue());
        if ((difference == 0)) {
          packages_already_taken.addAll(candidates_refined);
          Launcher.update(packages_already_taken);
        } else {
          if ((difference > 0)) {
            final Integer first = candidates_refined.get(0);
            candidates_refined.remove(0);
            final HashSet<Integer> new_pat = new HashSet<Integer>(packages_already_taken);
            new_pat.add(first);
            Launcher.compute(candidates_refined, Integer.valueOf(((remaining_weight).intValue() - (first).intValue())), new_pat);
            HashSet<Integer> _hashSet = new HashSet<Integer>(packages_already_taken);
            Launcher.compute(candidates_refined, remaining_weight, _hashSet);
          }
        }
      }
    }
  }
}