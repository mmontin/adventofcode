package advent2016.puzzle20;

import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Constellation {
  private static final long max_value = ((2L * Integer.MAX_VALUE) + 1L);

  private List<Interval> content;

  public Constellation() {
    this.content = CollectionLiterals.<Interval>newArrayList();
  }

  public void addInterval(final Interval itv) {
    int i = 0;
    int res_left = 1;
    while (((res_left == 1) && (i < this.content.size()))) {
      int _plusPlus = i++;
      res_left = this.content.get(_plusPlus).contains(itv.leftBound);
    }
    i--;
    if ((res_left == 1)) {
      this.content.add(itv);
      int _size = this.content.size();
      int _minus = (_size - 2);
      this.merge(_minus);
    } else {
      int j = i;
      int res_right = 1;
      while (((res_right == 1) && (j < this.content.size()))) {
        int _plusPlus = j++;
        res_right = this.content.get(_plusPlus).contains(itv.rightBound);
      }
      if ((res_right != 1)) {
        j--;
      }
      if ((res_left == 0)) {
        itv.leftBound = this.content.get(i).leftBound;
      }
      if ((res_right == 0)) {
        itv.rightBound = this.content.get(j).rightBound;
        j++;
      }
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(i, j, true);
      for (final Integer k : _doubleDotLessThan) {
        this.content.remove(i);
      }
      this.content.add(i, itv);
      this.merge(i);
      this.merge((i - 1));
    }
  }

  public void merge(final int index) {
    if ((((index >= 0) && ((index + 1) < this.content.size())) && 
      (this.content.get((index + 1)).leftBound == (this.content.get(index).rightBound + 1)))) {
      Interval _get = this.content.get(index);
      _get.rightBound = this.content.get((index + 1)).rightBound;
      this.content.remove((index + 1));
    }
  }

  @Override
  public String toString() {
    return this.content.toString();
  }

  public long firstValid() {
    return (this.content.get(0).rightBound + 1);
  }

  public Long nb_of_valids() {
    int _size = this.content.size();
    int _minus = (_size - 1);
    int _size_1 = this.content.size();
    int _minus_1 = (_size_1 - 1);
    final Function2<Long, Integer, Long> _function = (Long sum, Integer i) -> {
      return Long.valueOf(((sum).longValue() + ((this.content.get(((i).intValue() + 1)).leftBound - this.content.get((i).intValue()).rightBound) - 1)));
    };
    return IterableExtensions.<Integer, Long>fold(new ExclusiveRange(0, _minus, true), Long.valueOf(((this.content.get(0).leftBound + Constellation.max_value) - this.content.get(_minus_1).rightBound)), _function);
  }
}
