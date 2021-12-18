package advent2021.puzzle4;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Board {
  private List<List<Square>> grid;
  
  public Board(final BufferedReader br) {
    try {
      br.readLine();
      ArrayList<List<Square>> _arrayList = new ArrayList<List<Square>>(5);
      this.grid = _arrayList;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 5, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          final ArrayList<Square> s = new ArrayList<Square>(5);
          final Consumer<String> _function = new Consumer<String>() {
            public void accept(final String x) {
              boolean _isEmpty = x.isEmpty();
              boolean _not = (!_isEmpty);
              if (_not) {
                int _parseInt = Integer.parseInt(x);
                Square _square = new Square(_parseInt);
                s.add(_square);
              }
            }
          };
          ((List<String>)Conversions.doWrapArray(br.readLine().split(" "))).forEach(_function);
          this.grid.add(s);
        }
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public void play(final int number) throws CompletedException {
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 5, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, 5, true);
      for (final Integer j : _doubleDotLessThan_1) {
        this.grid.get((i).intValue()).get((j).intValue()).call(number);
      }
    }
    boolean _completed = this.completed();
    if (_completed) {
      Integer _count = this.count();
      throw new CompletedException((_count).intValue(), number);
    }
  }
  
  public boolean completed() {
    boolean _xblockexpression = false;
    {
      boolean ans = false;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, 5, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          boolean b0 = true;
          boolean b1 = true;
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, 5, true);
          for (final Integer j : _doubleDotLessThan_1) {
            {
              b0 = (b0 && this.grid.get((i).intValue()).get((j).intValue()).called);
              b1 = (b1 && this.grid.get((j).intValue()).get((i).intValue()).called);
            }
          }
          ans = ((ans || b0) || b1);
        }
      }
      _xblockexpression = ans;
    }
    return _xblockexpression;
  }
  
  public Integer count() {
    final Function2<Integer, List<Square>, Integer> _function = new Function2<Integer, List<Square>, Integer>() {
      public Integer apply(final Integer v, final List<Square> l) {
        final Function2<Integer, Square, Integer> _function = new Function2<Integer, Square, Integer>() {
          public Integer apply(final Integer w, final Square x) {
            int _xifexpression = (int) 0;
            if (x.called) {
              _xifexpression = 0;
            } else {
              _xifexpression = x.number;
            }
            return Integer.valueOf(((w).intValue() + _xifexpression));
          }
        };
        return IterableExtensions.<Square, Integer>fold(l, v, _function);
      }
    };
    return IterableExtensions.<List<Square>, Integer>fold(this.grid, Integer.valueOf(0), _function);
  }
}
