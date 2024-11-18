package advent2016.puzzle16;

import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Launcher {
  private static final Map<Integer, Boolean> data = CollectionLiterals.<Integer, Boolean>newHashMap();

  private static final String input = "10001001100000001";

  private static final int disk_size = 35651584;

  public static void main(final String[] args) {
    int _length = Launcher.input.length();
    final Consumer<Integer> _function = (Integer i) -> {
      boolean _xifexpression = false;
      char _charAt = Launcher.input.charAt((i).intValue());
      boolean _equals = ("" + Character.valueOf(_charAt)).equals("1");
      if (_equals) {
        _xifexpression = true;
      } else {
        _xifexpression = false;
      }
      Launcher.data.put(i, Boolean.valueOf(_xifexpression));
    };
    new ExclusiveRange(0, _length, true).forEach(_function);
    while ((Launcher.data.size() < Launcher.disk_size)) {
      {
        Launcher.data.put(Integer.valueOf(Launcher.data.size()), Boolean.valueOf(false));
        int _size = Launcher.data.size();
        final int pivot = (_size - 1);
        IntegerRange _upTo = new IntegerRange(1, pivot);
        for (final Integer i : _upTo) {
          Boolean _get = Launcher.data.get(Integer.valueOf((pivot - (i).intValue())));
          boolean _not = (!(_get).booleanValue());
          Launcher.data.put(Integer.valueOf((pivot + (i).intValue())), Boolean.valueOf(_not));
        }
      }
    }
    int _size = Launcher.data.size();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(Launcher.disk_size, _size, true);
    for (final Integer i : _doubleDotLessThan) {
      Launcher.data.remove(i);
    }
    while (((Launcher.data.size() % 2) == 0)) {
      int _size_1 = Launcher.data.size();
      int _divide = (_size_1 / 2);
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, _divide, true);
      for (final Integer i_1 : _doubleDotLessThan_1) {
        {
          final int prod = (2 * (i_1).intValue());
          Boolean _get = Launcher.data.get(Integer.valueOf(prod));
          Boolean _get_1 = Launcher.data.get(Integer.valueOf((prod + 1)));
          final boolean b = Objects.equals(_get, _get_1);
          Launcher.data.remove(Integer.valueOf(prod));
          Launcher.data.remove(Integer.valueOf((prod + 1)));
          Launcher.data.put(i_1, Boolean.valueOf(b));
        }
      }
    }
    int _size_1 = Launcher.data.size();
    ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, _size_1, true);
    for (final Integer i_1 : _doubleDotLessThan_1) {
      int _xifexpression = (int) 0;
      Boolean _get = Launcher.data.get(i_1);
      if ((_get).booleanValue()) {
        _xifexpression = 1;
      } else {
        _xifexpression = 0;
      }
      InputOutput.<Integer>print(Integer.valueOf(_xifexpression));
    }
  }
}
