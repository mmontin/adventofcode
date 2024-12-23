package advent2023;

import adventutils.geometry.Interval;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
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
    final Function1<String, Rule> _function = (String it) -> {
      return Rules.createRule(it);
    };
    this.rules = ListExtensions.<String, Rule>map(IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray(p.split(",")))), _function);
    Rules.all_rules.put(name, this);
  }

  public static Rule createRule(final String s) {
    Rule _switchResult = null;
    boolean _matched = false;
    if (Objects.equals(s, "R")) {
      _matched=true;
      _switchResult = new RejectRule();
    }
    if (!_matched) {
      if (Objects.equals(s, "A")) {
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

  @Override
  public boolean process(final List<Integer> values, final List<List<Integer>> accepted) {
    boolean _xblockexpression = false;
    {
      boolean finished = false;
      int i = 0;
      while (((i < this.rules.size()) && (!finished))) {
        int _plusPlus = i++;
        finished = this.rules.get(_plusPlus).process(values, accepted);
      }
      _xblockexpression = finished;
    }
    return _xblockexpression;
  }

  @Override
  public Pair<Set<List<Interval>>, List<Interval>> processItvs(final List<Interval> itvs) {
    Pair<Set<List<Interval>>, List<Interval>> _xblockexpression = null;
    {
      int i = 0;
      List<Interval> res = itvs;
      final HashSet<List<Interval>> output = CollectionLiterals.<List<Interval>>newHashSet();
      while (((i < this.rules.size()) && (!res.isEmpty()))) {
        {
          int _plusPlus = i++;
          final Pair<Set<List<Interval>>, List<Interval>> apply = this.rules.get(_plusPlus).processItvs(res);
          res = apply.getValue();
          output.addAll(apply.getKey());
        }
      }
      ArrayList<Interval> _newArrayList = CollectionLiterals.<Interval>newArrayList();
      _xblockexpression = Pair.<Set<List<Interval>>, List<Interval>>of(output, _newArrayList);
    }
    return _xblockexpression;
  }

  public static int getRank(final String s) {
    int _switchResult = (int) 0;
    if (s != null) {
      switch (s) {
        case "x":
          _switchResult = 0;
          break;
        case "m":
          _switchResult = 1;
          break;
        case "a":
          _switchResult = 2;
          break;
        default:
          _switchResult = 3;
          break;
      }
    } else {
      _switchResult = 3;
    }
    return _switchResult;
  }
}
