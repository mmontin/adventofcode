package adventutils.geometry;

import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;

@SuppressWarnings("all")
public class Intervals {
  public List<Interval> content;

  public Intervals() {
    this.content = CollectionLiterals.<Interval>newArrayList();
  }

  public Interval addInterval(final Interval itv) {
    Interval _xblockexpression = null;
    {
      int i = 0;
      int res_left = 1;
      while (((res_left == 1) && (i < this.content.size()))) {
        int _plusPlus = i++;
        res_left = this.content.get(_plusPlus).position(itv.leftBound);
      }
      i--;
      Interval _xifexpression = null;
      if ((res_left == 1)) {
        Interval _xblockexpression_1 = null;
        {
          this.content.add(itv);
          int _size = this.content.size();
          int _minus = (_size - 2);
          _xblockexpression_1 = this.merge(_minus);
        }
        _xifexpression = _xblockexpression_1;
      } else {
        Interval _xblockexpression_2 = null;
        {
          int j = i;
          int res_right = 1;
          while (((res_right == 1) && (j < this.content.size()))) {
            int _plusPlus = j++;
            res_right = this.content.get(_plusPlus).position(itv.rightBound);
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
          _xblockexpression_2 = this.merge((i - 1));
        }
        _xifexpression = _xblockexpression_2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  private Interval merge(final int index) {
    Interval _xifexpression = null;
    if ((((index >= 0) && ((index + 1) < this.content.size())) && 
      (this.content.get((index + 1)).leftBound == (this.content.get(index).rightBound + 1)))) {
      Interval _xblockexpression = null;
      {
        Interval _get = this.content.get(index);
        _get.rightBound = this.content.get((index + 1)).rightBound;
        _xblockexpression = this.content.remove((index + 1));
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }

  @Override
  public String toString() {
    return this.content.toString();
  }
}
