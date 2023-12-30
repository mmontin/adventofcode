package advent2017;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day12 {
  public static void main(final String[] args) {
    final ArrayList<HashSet<Integer>> sets = CollectionLiterals.<HashSet<Integer>>newArrayList();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = it.split(" <-> ");
        final HashSet<Integer> currentSet = CollectionLiterals.<Integer>newHashSet();
        currentSet.add(Integer.valueOf(Integer.parseInt(split[0])));
        final Function1<String, Integer> _function = new Function1<String, Integer>() {
          public Integer apply(final String it_1) {
            return Integer.valueOf(Integer.parseInt(it_1));
          }
        };
        currentSet.addAll(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray((split[1]).split(", "))), _function));
        sets.add(currentSet);
      }
    };
    new InputLoader(Integer.valueOf(2017), Integer.valueOf(12)).getInputs().forEach(_function);
    final HashSet<HashSet<Integer>> disjoint_sets = CollectionLiterals.<HashSet<Integer>>newHashSet();
    while ((sets.size() != 0)) {
      {
        final HashSet<Integer> current = sets.remove(0);
        final Function1<HashSet<Integer>, Boolean> _function_1 = new Function1<HashSet<Integer>, Boolean>() {
          public Boolean apply(final HashSet<Integer> s) {
            final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
              public Boolean apply(final Integer it) {
                return Boolean.valueOf(current.contains(it));
              }
            };
            Integer _findFirst = IterableExtensions.<Integer>findFirst(s, _function);
            return Boolean.valueOf((_findFirst != null));
          }
        };
        final HashSet<Integer> toFill = IterableExtensions.<HashSet<Integer>>findFirst(sets, _function_1);
        if ((toFill == null)) {
          disjoint_sets.add(current);
        } else {
          toFill.addAll(current);
        }
      }
    }
    final Function1<HashSet<Integer>, Boolean> _function_1 = new Function1<HashSet<Integer>, Boolean>() {
      public Boolean apply(final HashSet<Integer> it) {
        return Boolean.valueOf(it.contains(Integer.valueOf(0)));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<HashSet<Integer>>findFirst(disjoint_sets, _function_1).size()));
    InputOutput.<Integer>print(Integer.valueOf(disjoint_sets.size()));
  }
}
