package advent2023;

import adventutils.geometry.Interval;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class RejectRule implements Rule {
  @Override
  public boolean process(final List<Integer> values, final List<List<Integer>> accepted) {
    return true;
  }

  @Override
  public Pair<Set<List<Interval>>, List<Interval>> processItvs(final List<Interval> itvs) {
    HashSet<List<Interval>> _newHashSet = CollectionLiterals.<List<Interval>>newHashSet();
    ArrayList<Interval> _newArrayList = CollectionLiterals.<Interval>newArrayList();
    return Pair.<Set<List<Interval>>, List<Interval>>of(_newHashSet, _newArrayList);
  }
}
