package advent2020.puzzle19;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final HashMap<Integer, List<List<Integer>>> all_rules = CollectionLiterals.<Integer, List<List<Integer>>>newHashMap();

  private static Integer rule_a = null;

  private static Integer rule_b = null;

  public static void main(final String[] args) {
    final List<String> lines = new InputLoader(Integer.valueOf(2020), Integer.valueOf(19)).getInputs();
    final int empty_line = lines.indexOf("");
    final List<String> rules = lines.subList(0, empty_line);
    final List<String> words = lines.subList((empty_line + 1), lines.size());
    for (final String r : rules) {
      {
        final String[] split = r.split(": ");
        final int number = Integer.parseInt(split[0]);
        final String matches = split[1];
        boolean _matched = false;
        if (Objects.equal(matches, "\"a\"")) {
          _matched=true;
          Launcher.rule_a = Integer.valueOf(number);
        }
        if (!_matched) {
          if (Objects.equal(matches, "\"b\"")) {
            _matched=true;
            Launcher.rule_b = Integer.valueOf(number);
          }
        }
        if (!_matched) {
          final Function1<String, List<Integer>> _function = new Function1<String, List<Integer>>() {
            public List<Integer> apply(final String it) {
              final Function1<String, Integer> _function = new Function1<String, Integer>() {
                public Integer apply(final String it_1) {
                  return Integer.valueOf(Integer.parseInt(it_1));
                }
              };
              return ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(it.split(" "))), _function);
            }
          };
          Launcher.all_rules.put(Integer.valueOf(number), ListExtensions.<String, List<Integer>>map(((List<String>)Conversions.doWrapArray(matches.split(" \\| "))), _function));
        }
      }
    }
    final Function1<String, Boolean> _function = new Function1<String, Boolean>() {
      public Boolean apply(final String it) {
        return Boolean.valueOf(Launcher.matches(it, CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0))));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<String>filter(words, _function))));
    Launcher.all_rules.put(Integer.valueOf(8), CollectionLiterals.<List<Integer>>newArrayList(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(42)), CollectionLiterals.<Integer>newArrayList(Integer.valueOf(42), Integer.valueOf(8))));
    Launcher.all_rules.put(Integer.valueOf(11), CollectionLiterals.<List<Integer>>newArrayList(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(42), Integer.valueOf(31)), CollectionLiterals.<Integer>newArrayList(Integer.valueOf(42), Integer.valueOf(11), Integer.valueOf(31))));
    final Function1<String, Boolean> _function_1 = new Function1<String, Boolean>() {
      public Boolean apply(final String it) {
        return Boolean.valueOf(Launcher.matches(it, CollectionLiterals.<Integer>newArrayList(Integer.valueOf(0))));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<String>filter(words, _function_1))));
  }

  public static boolean matches(final String word, final List<Integer> rules) {
    boolean _switchResult = false;
    Integer _head = IterableExtensions.<Integer>head(rules);
    final Integer r = _head;
    boolean _matched = false;
    if (Objects.equal(r, null)) {
      _matched=true;
      _switchResult = word.isEmpty();
    }
    if (!_matched) {
      boolean _isEmpty = word.isEmpty();
      if (_isEmpty) {
        _matched=true;
        _switchResult = false;
      }
    }
    if (!_matched) {
      if (Objects.equal(r, Launcher.rule_a)) {
        _matched=true;
        boolean _xifexpression = false;
        boolean _startsWith = word.startsWith("a");
        if (_startsWith) {
          _xifexpression = Launcher.matches(word.substring(1), IterableExtensions.<Integer>toList(IterableExtensions.<Integer>drop(rules, 1)));
        } else {
          _xifexpression = false;
        }
        _switchResult = _xifexpression;
      }
    }
    if (!_matched) {
      if (Objects.equal(r, Launcher.rule_b)) {
        _matched=true;
        boolean _xifexpression_1 = false;
        boolean _startsWith_1 = word.startsWith("b");
        if (_startsWith_1) {
          _xifexpression_1 = Launcher.matches(word.substring(1), IterableExtensions.<Integer>toList(IterableExtensions.<Integer>drop(rules, 1)));
        } else {
          _xifexpression_1 = false;
        }
        _switchResult = _xifexpression_1;
      }
    }
    if (!_matched) {
      final Function1<List<Integer>, Boolean> _function = new Function1<List<Integer>, Boolean>() {
        public Boolean apply(final List<Integer> it) {
          boolean _xblockexpression = false;
          {
            final ArrayList<Integer> next_rules = new ArrayList<Integer>(it);
            Iterables.<Integer>addAll(next_rules, IterableExtensions.<Integer>drop(rules, 1));
            _xblockexpression = Launcher.matches(word, next_rules);
          }
          return Boolean.valueOf(_xblockexpression);
        }
      };
      List<Integer> _findFirst = IterableExtensions.<List<Integer>>findFirst(Launcher.all_rules.get(r), _function);
      _switchResult = (_findFirst != null);
    }
    return _switchResult;
  }
}
