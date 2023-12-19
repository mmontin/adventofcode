package advent2023;

import adventutils.geometry.Interval;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public interface Rule {
  boolean process(final List<Integer> values, final List<List<Integer>> accepted);

  Pair<Set<List<Interval>>, List<Interval>> processItvs(final List<Interval> itvs);
}
