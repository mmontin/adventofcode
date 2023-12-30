package advent2023;

import adventutils.geometry.Interval;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class RedirectRule implements Rule {
  private String where;

  public RedirectRule(final String where_) {
    this.where = where_;
  }

  @Override
  public boolean process(final List<Integer> values, final List<List<Integer>> accepted) {
    boolean _xblockexpression = false;
    {
      Rules.all_rules.get(this.where).process(values, accepted);
      _xblockexpression = true;
    }
    return _xblockexpression;
  }

  @Override
  public Pair<Set<List<Interval>>, List<Interval>> processItvs(final List<Interval> itvs) {
    return Rules.all_rules.get(this.where).processItvs(itvs);
  }
}
