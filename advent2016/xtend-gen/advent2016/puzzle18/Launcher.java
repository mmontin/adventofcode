package advent2016.puzzle18;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final List<Boolean> input = ListExtensions.<Character, Boolean>map(IterableExtensions.<Character>toList(((Iterable<Character>)Conversions.doWrapArray(".^^..^...^..^^.^^^.^^^.^^^^^^.^.^^^^.^^.^^^^^^.^...^......^...^^^..^^^.....^^^^^^^^^....^^...^^^^..^".toCharArray()))), 
    new Function1<Character, Boolean>() {
      public Boolean apply(final Character it) {
        boolean _xifexpression = false;
        boolean _equals = ("" + it).equals(".");
        if (_equals) {
          _xifexpression = false;
        } else {
          _xifexpression = true;
        }
        return Boolean.valueOf(_xifexpression);
      }
    });
  
  public static void main(final String[] args) {
    final Function1<Boolean, Boolean> _function = new Function1<Boolean, Boolean>() {
      public Boolean apply(final Boolean it) {
        return Boolean.valueOf((!(it).booleanValue()));
      }
    };
    int sum = IterableExtensions.size(IterableExtensions.<Boolean>filter(Launcher.input, _function));
    List<Boolean> current = Launcher.input;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(1, 400000, true);
    for (final Integer i : _doubleDotLessThan) {
      int _sum = sum;
      final Function1<Boolean, Boolean> _function_1 = new Function1<Boolean, Boolean>() {
        public Boolean apply(final Boolean it) {
          return Boolean.valueOf((!(it).booleanValue()));
        }
      };
      int _size = IterableExtensions.size(IterableExtensions.<Boolean>filter((current = Launcher.computeRow(current)), _function_1));
      sum = (_sum + _size);
    }
    InputOutput.<Integer>println(Integer.valueOf(sum));
  }
  
  public static List<Boolean> computeRow(final List<Boolean> booleans) {
    int _size = booleans.size();
    final Function2<ArrayList<Boolean>, Integer, ArrayList<Boolean>> _function = new Function2<ArrayList<Boolean>, Integer, ArrayList<Boolean>>() {
      public ArrayList<Boolean> apply(final ArrayList<Boolean> l, final Integer i) {
        ArrayList<Boolean> _xblockexpression = null;
        {
          Boolean _xifexpression = null;
          if (((i).intValue() == 0)) {
            _xifexpression = Boolean.valueOf(false);
          } else {
            _xifexpression = booleans.get(((i).intValue() - 1));
          }
          Boolean left = _xifexpression;
          Boolean center = booleans.get((i).intValue());
          Boolean _xifexpression_1 = null;
          int _size = booleans.size();
          int _minus = (_size - 1);
          boolean _equals = ((i).intValue() == _minus);
          if (_equals) {
            _xifexpression_1 = Boolean.valueOf(false);
          } else {
            _xifexpression_1 = booleans.get(((i).intValue() + 1));
          }
          Boolean right = _xifexpression_1;
          l.add(Boolean.valueOf(((((((left).booleanValue() && (!(center).booleanValue())) && (!(right).booleanValue())) || (((right).booleanValue() && (!(center).booleanValue())) && (!(left).booleanValue()))) || (((left).booleanValue() && (center).booleanValue()) && (!(right).booleanValue()))) || (((!(left).booleanValue()) && (center).booleanValue()) && (right).booleanValue()))));
          _xblockexpression = l;
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Integer, ArrayList<Boolean>>fold(new ExclusiveRange(0, _size, true), CollectionLiterals.<Boolean>newArrayList(), _function);
  }
}
