package advent2023;

import adventutils.geometry.Interval;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Rules implements Rule {
  public static final Map<String, Rules> all_rules = CollectionLiterals.<String, Rules>newHashMap();

  private List<Rule> rules;

  public Rules(final String s) {
    final String[] split = s.split("\\{");
    final String name = split[0];
    int _length = (split[1]).length();
    int _minus = (_length - 1);
    final String p = (split[1]).substring(0, _minus);
    final Function1<String, Rule> _function = new Function1<String, Rule>() {
      public Rule apply(final String it) {
        return Rules.createRule(it);
      }
    };
    this.rules = ListExtensions.<String, Rule>map(IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray(p.split(",")))), _function);
    Rules.all_rules.put(name, this);
  }

  public static Rule createRule(final String s) {
    Rule _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "R")) {
      _matched=true;
      _switchResult = new RejectRule();
    }
    if (!_matched) {
      if (Objects.equal(s, "A")) {
        _matched=true;
        _switchResult = new AcceptRule();
      }
    }
    if (!_matched) {
      if ((s.contains("<") || s.contains(">"))) {
        _matched=true;
        _switchResult = new CompareRule(s);
      }
    }
    if (!_matched) {
      _switchResult = new RedirectRule(s);
    }
    return _switchResult;
  }

  public boolean process(final List<Integer> values, final List<List<Integer>> accepted) {
    boolean _xblockexpression = false;
    {
      boolean finished = false;
      int i = 0;
      while (((i < this.rules.size()) && (!finished))) {
        {
          finished = this.rules.get(i).process(values, accepted);
          i++;
        }
      }
      _xblockexpression = finished;
    }
    return _xblockexpression;
  }

  public Pair<Set<List<Interval>>, List<Interval>> processItvs(final List<Interval> itvs) {
    Pair<Set<List<Interval>>, List<Interval>> _xblockexpression = null;
    {
      int i = 0;
      List<Interval> res = itvs;
      final HashSet<List<Interval>> output = CollectionLiterals.<List<Interval>>newHashSet();
      while (((i < this.rules.size()) && (!res.isEmpty()))) {
        {
          final Pair<Set<List<Interval>>, List<Interval>> apply = this.rules.get(i).processItvs(res);
          res = apply.getValue();
          output.addAll(apply.getKey());
          i++;
        }
      }
      ArrayList<Interval> _newArrayList = CollectionLiterals.<Interval>newArrayList();
      _xblockexpression = Pair.<Set<List<Interval>>, List<Interval>>of(output, _newArrayList);
    }
    return _xblockexpression;
  }

  public static int getRank(final String s) {
    int _switchResult = (int) 0;
    boolean _matched = false;
    if (Objects.equal(s, "x")) {
      _matched=true;
      _switchResult = 0;
    }
    if (!_matched) {
      if (Objects.equal(s, "m")) {
        _matched=true;
        _switchResult = 1;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "a")) {
        _matched=true;
        _switchResult = 2;
      }
    }
    if (!_matched) {
      _switchResult = 3;
    }
    return _switchResult;
  }
}
