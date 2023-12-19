package advent2023;

import adventutils.geometry.Interval;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class CompareRule implements Rule {
  private boolean isLower;

  private int rank;

  private int value;

  private Rule next;

  public CompareRule(final String s) {
    this.isLower = s.contains("<");
    String[] _xifexpression = null;
    if (this.isLower) {
      _xifexpression = s.split("[<:]");
    } else {
      _xifexpression = s.split("[>:]");
    }
    final String[] split = _xifexpression;
    this.rank = Rules.getRank(split[0]);
    this.value = Integer.parseInt(split[1]);
    this.next = Rules.createRule(split[2]);
  }

  public boolean process(final List<Integer> values, final List<List<Integer>> accepted) {
    boolean _xifexpression = false;
    boolean _xifexpression_1 = false;
    if (this.isLower) {
      Integer _get = values.get(this.rank);
      _xifexpression_1 = ((_get).intValue() < this.value);
    } else {
      Integer _get_1 = values.get(this.rank);
      _xifexpression_1 = ((_get_1).intValue() > this.value);
    }
    if (_xifexpression_1) {
      boolean _xblockexpression = false;
      {
        this.next.process(values, accepted);
        _xblockexpression = true;
      }
      _xifexpression = _xblockexpression;
    } else {
      _xifexpression = false;
    }
    return _xifexpression;
  }

  public Pair<Set<List<Interval>>, List<Interval>> processItvs(final List<Interval> itvs) {
    Pair<Set<List<Interval>>, List<Interval>> _xblockexpression = null;
    {
      final ArrayList<Interval> left = CollectionLiterals.<Interval>newArrayList();
      final ArrayList<Interval> right = CollectionLiterals.<Interval>newArrayList();
      final Consumer<Integer> _function = new Consumer<Integer>() {
        public void accept(final Integer it) {
          final Interval current = itvs.get((it).intValue());
          if (((it).intValue() == CompareRule.this.rank)) {
            final Pair<Interval, Interval> split = current.split(CompareRule.this.value, (!CompareRule.this.isLower));
            Interval _xifexpression = null;
            if (CompareRule.this.isLower) {
              _xifexpression = split.getKey();
            } else {
              _xifexpression = split.getValue();
            }
            left.add(_xifexpression);
            Interval _xifexpression_1 = null;
            if (CompareRule.this.isLower) {
              _xifexpression_1 = split.getValue();
            } else {
              _xifexpression_1 = split.getKey();
            }
            right.add(_xifexpression_1);
          } else {
            Interval _interval = new Interval(current);
            right.add(_interval);
            Interval _interval_1 = new Interval(current);
            left.add(_interval_1);
          }
        }
      };
      new ExclusiveRange(0, 4, true).forEach(_function);
      Set<List<Interval>> _key = this.next.processItvs(left).getKey();
      _xblockexpression = Pair.<Set<List<Interval>>, List<Interval>>of(_key, right);
    }
    return _xblockexpression;
  }
}
