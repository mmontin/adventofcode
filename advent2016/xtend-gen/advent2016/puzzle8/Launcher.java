package advent2016.puzzle8;

import advent2016.Utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
  
  private static HashMap<Coordinates, Boolean> screen = CollectionLiterals.<Coordinates, Boolean>newHashMap();
  
  public static void main(final String[] args) {
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Launcher.width, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, Launcher.height, true);
      for (final Integer j : _doubleDotLessThan_1) {
        Coordinates _coordinates = new Coordinates((i).intValue(), (j).intValue());
        Launcher.screen.put(_coordinates, Boolean.valueOf(false));
      }
    }
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        Launcher.step(it);
      }
    };
    Utils.getInputs(8).forEach(_function);
    ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange(0, Launcher.height, true);
    for (final Integer i_1 : _doubleDotLessThan_2) {
      final Function2<String, Integer, String> _function_1 = new Function2<String, Integer, String>() {
        public String apply(final String v, final Integer j) {
          String _xifexpression = null;
          Coordinates _coordinates = new Coordinates((j).intValue(), (i_1).intValue());
          Boolean _get = Launcher.screen.get(_coordinates);
          if ((_get).booleanValue()) {
            _xifexpression = "Y";
          } else {
            _xifexpression = ".";
          }
          return (v + _xifexpression);
        }
      };
      InputOutput.<String>println(IterableExtensions.<Integer, String>fold(new ExclusiveRange(0, Launcher.width, true), "", _function_1));
    }
    final Function1<Boolean, Boolean> _function_2 = new Function1<Boolean, Boolean>() {
      public Boolean apply(final Boolean it) {
        return it;
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.size(IterableExtensions.<Boolean>filter(Launcher.screen.values(), _function_2))));
  }
  
  public static HashMap<Coordinates, Boolean> step(final String s) {
    HashMap<Coordinates, Boolean> _xblockexpression = null;
    {
      final String[] split = s.split(" ");
      HashMap<Coordinates, Boolean> _xifexpression = null;
      int _size = ((List<String>)Conversions.doWrapArray(split)).size();
      boolean _equals = (_size == 2);
      if (_equals) {
        final Function1<String, Integer> _function = new Function1<String, Integer>() {
          public Integer apply(final String it) {
            return Integer.valueOf(Integer.parseInt(it));
          }
        };
        final List<Integer> size = ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray((split[1]).split("x"))), _function);
        Launcher.rectangle((size.get(0)).intValue(), (size.get(1)).intValue());
      } else {
        HashMap<Coordinates, Boolean> _xifexpression_1 = null;
        boolean _equals_1 = (split[1]).equals("row");
        if (_equals_1) {
          _xifexpression_1 = Launcher.shift_row(Integer.parseInt((split[2]).split("=")[1]), Integer.parseInt(split[4]));
        } else {
          _xifexpression_1 = Launcher.shift_column(Integer.parseInt((split[2]).split("=")[1]), Integer.parseInt(split[4]));
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
  
  public static void rectangle(final int x, final int y) {
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, x, true);
    for (final Integer i : _doubleDotLessThan) {
      ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, y, true);
      for (final Integer j : _doubleDotLessThan_1) {
        Coordinates _coordinates = new Coordinates((i).intValue(), (j).intValue());
        Launcher.screen.replace(_coordinates, Boolean.valueOf(true));
      }
    }
  }
  
  public static HashMap<Coordinates, Boolean> shift_row(final int y, final int offset) {
    HashMap<Coordinates, Boolean> _xblockexpression = null;
    {
      final Function1<Map.Entry<Coordinates, Boolean>, Coordinates> _function = new Function1<Map.Entry<Coordinates, Boolean>, Coordinates>() {
        public Coordinates apply(final Map.Entry<Coordinates, Boolean> it) {
          return it.getKey();
        }
      };
      final Function1<Coordinates, Boolean> _function_1 = new Function1<Coordinates, Boolean>() {
        public Boolean apply(final Coordinates it) {
          int _y = it.getY();
          return Boolean.valueOf((_y == y));
        }
      };
      final Consumer<Coordinates> _function_2 = new Consumer<Coordinates>() {
        public void accept(final Coordinates it) {
          int _x = it.getX();
          int _plus = (_x + offset);
          int _modulo = (_plus % Launcher.width);
          it.setX(_modulo);
        }
      };
      IterableExtensions.<Coordinates>filter(IterableExtensions.<Map.Entry<Coordinates, Boolean>, Coordinates>map(Launcher.screen.entrySet(), _function), _function_1).forEach(_function_2);
      HashMap<Coordinates, Boolean> _hashMap = new HashMap<Coordinates, Boolean>(Launcher.screen);
      _xblockexpression = Launcher.screen = _hashMap;
    }
    return _xblockexpression;
  }
  
  public static HashMap<Coordinates, Boolean> shift_column(final int x, final int offset) {
    HashMap<Coordinates, Boolean> _xblockexpression = null;
    {
      final Function1<Map.Entry<Coordinates, Boolean>, Coordinates> _function = new Function1<Map.Entry<Coordinates, Boolean>, Coordinates>() {
        public Coordinates apply(final Map.Entry<Coordinates, Boolean> it) {
          return it.getKey();
        }
      };
      final Function1<Coordinates, Boolean> _function_1 = new Function1<Coordinates, Boolean>() {
        public Boolean apply(final Coordinates it) {
          int _x = it.getX();
          return Boolean.valueOf((_x == x));
        }
      };
      final Consumer<Coordinates> _function_2 = new Consumer<Coordinates>() {
        public void accept(final Coordinates it) {
          int _y = it.getY();
          int _plus = (_y + offset);
          int _modulo = (_plus % Launcher.height);
          it.setY(_modulo);
        }
      };
      IterableExtensions.<Coordinates>filter(IterableExtensions.<Map.Entry<Coordinates, Boolean>, Coordinates>map(Launcher.screen.entrySet(), _function), _function_1).forEach(_function_2);
      HashMap<Coordinates, Boolean> _hashMap = new HashMap<Coordinates, Boolean>(Launcher.screen);
      _xblockexpression = Launcher.screen = _hashMap;
    }
    return _xblockexpression;
  }
}
