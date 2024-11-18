package advent2016.puzzle8;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
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
  private static final int width = 50;

  private static final int height = 6;

  private static HashMap<Coordinate, Boolean> screen = CollectionLiterals.<Coordinate, Boolean>newHashMap();

  public static void main(final String[] args) {
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Launcher.width, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, Launcher.height, true);
      for (final Integer j : _doubleDotLessThan_1) {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        Launcher.screen.put(_coordinate, Boolean.valueOf(false));
      }
    }
    final Consumer<String> _function = (String it) -> {
      Launcher.step(it);
    };
    new InputLoader(Integer.valueOf(2016), Integer.valueOf(8)).getInputs().forEach(_function);
    ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange(0, Launcher.height, true);
    for (final Integer i_1 : _doubleDotLessThan_2) {
      final Function2<String, Integer, String> _function_1 = (String v, Integer j_1) -> {
        String _xifexpression = null;
        Coordinate _coordinate_1 = new Coordinate((j_1).intValue(), (i_1).intValue());
        Boolean _get = Launcher.screen.get(_coordinate_1);
        if ((_get).booleanValue()) {
          _xifexpression = "Y";
        } else {
          _xifexpression = ".";
        }
        return (v + _xifexpression);
      };
      InputOutput.<String>println(IterableExtensions.<Integer, String>fold(new ExclusiveRange(0, Launcher.width, true), "", _function_1));
    }
    final Function1<Boolean, Boolean> _function_2 = (Boolean it) -> {
      return it;
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Boolean>filter(Launcher.screen.values(), _function_2))));
  }

  public static void step(final String s) {
    final String[] split = s.split(" ");
    int _size = ((List<String>)Conversions.doWrapArray(split)).size();
    boolean _equals = (_size == 2);
    if (_equals) {
      final Function1<String, Integer> _function = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final List<Integer> size = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray((split[1]).split("x"))), _function);
      Launcher.rectangle((size.get(0)).intValue(), (size.get(1)).intValue());
    } else {
      boolean _equals_1 = (split[1]).equals("row");
      if (_equals_1) {
        Launcher.shift_row(Integer.parseInt((split[2]).split("=")[1]), Integer.parseInt(split[4]));
      } else {
        Launcher.shift_column(Integer.parseInt((split[2]).split("=")[1]), Integer.parseInt(split[4]));
      }
    }
  }

  public static void rectangle(final int x, final int y) {
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, x, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, y, true);
      for (final Integer j : _doubleDotLessThan_1) {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        Launcher.screen.replace(_coordinate, Boolean.valueOf(true));
      }
    }
  }

  public static void shift_row(final int y, final int offset) {
    Set<Map.Entry<Coordinate, Boolean>> _entrySet = Launcher.screen.entrySet();
    final Function1<Map.Entry<Coordinate, Boolean>, Boolean> _function = (Map.Entry<Coordinate, Boolean> it) -> {
      int _y = it.getKey().getY();
      return Boolean.valueOf((_y == y));
    };
    final Iterable<Map.Entry<Coordinate, Boolean>> entries = IterableExtensions.<Map.Entry<Coordinate, Boolean>>filter(new HashSet<Map.Entry<Coordinate, Boolean>>(_entrySet), _function);
    final Function1<Map.Entry<Coordinate, Boolean>, Coordinate> _function_1 = (Map.Entry<Coordinate, Boolean> it) -> {
      return it.getKey();
    };
    final Consumer<Coordinate> _function_2 = (Coordinate it) -> {
      Launcher.screen.remove(it);
    };
    IterableExtensions.<Map.Entry<Coordinate, Boolean>, Coordinate>map(entries, _function_1).forEach(_function_2);
    final Consumer<Map.Entry<Coordinate, Boolean>> _function_3 = (Map.Entry<Coordinate, Boolean> it) -> {
      int _x = it.getKey().getX();
      int _plus = (_x + offset);
      int _modulo = (_plus % Launcher.width);
      int _y = it.getKey().getY();
      Coordinate _coordinate = new Coordinate(_modulo, _y);
      Launcher.screen.put(_coordinate, it.getValue());
    };
    entries.forEach(_function_3);
  }

  public static void shift_column(final int x, final int offset) {
    Set<Map.Entry<Coordinate, Boolean>> _entrySet = Launcher.screen.entrySet();
    final Function1<Map.Entry<Coordinate, Boolean>, Boolean> _function = (Map.Entry<Coordinate, Boolean> it) -> {
      int _x = it.getKey().getX();
      return Boolean.valueOf((_x == x));
    };
    final Iterable<Map.Entry<Coordinate, Boolean>> entries = IterableExtensions.<Map.Entry<Coordinate, Boolean>>filter(new HashSet<Map.Entry<Coordinate, Boolean>>(_entrySet), _function);
    final Function1<Map.Entry<Coordinate, Boolean>, Coordinate> _function_1 = (Map.Entry<Coordinate, Boolean> it) -> {
      return it.getKey();
    };
    final Consumer<Coordinate> _function_2 = (Coordinate it) -> {
      Launcher.screen.remove(it);
    };
    IterableExtensions.<Map.Entry<Coordinate, Boolean>, Coordinate>map(entries, _function_1).forEach(_function_2);
    final Consumer<Map.Entry<Coordinate, Boolean>> _function_3 = (Map.Entry<Coordinate, Boolean> it) -> {
      int _x = it.getKey().getX();
      int _y = it.getKey().getY();
      int _plus = (_y + offset);
      int _modulo = (_plus % Launcher.height);
      Coordinate _coordinate = new Coordinate(_x, _modulo);
      Launcher.screen.put(_coordinate, it.getValue());
    };
    entries.forEach(_function_3);
  }
}
