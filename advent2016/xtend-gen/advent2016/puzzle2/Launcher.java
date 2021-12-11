package advent2016.puzzle2;

import advent2016.Utils;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final List<String> input = Utils.getInputs(2);
    final ArrayList<Integer> outputs = CollectionLiterals.<Integer>newArrayList();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        char[] _charArray = it.toCharArray();
        Integer _xifexpression = null;
        boolean _isEmpty = outputs.isEmpty();
        if (_isEmpty) {
          _xifexpression = Integer.valueOf(5);
        } else {
          _xifexpression = IterableExtensions.<Integer>last(outputs);
        }
        final Function2<Integer, Character, Integer> _function = new Function2<Integer, Character, Integer>() {
          public Integer apply(final Integer current, final Character inst) {
            int _switchResult = (int) 0;
            String _plus = (inst + "");
            boolean _matched = false;
            if (Objects.equal(_plus, "L")) {
              _matched=true;
              _switchResult = Launcher.left((current).intValue());
            }
            if (!_matched) {
              if (Objects.equal(_plus, "R")) {
                _matched=true;
                _switchResult = Launcher.right((current).intValue());
              }
            }
            if (!_matched) {
              if (Objects.equal(_plus, "U")) {
                _matched=true;
                _switchResult = Launcher.up((current).intValue());
              }
            }
            if (!_matched) {
              _switchResult = Launcher.down((current).intValue());
            }
            return Integer.valueOf(_switchResult);
          }
        };
        outputs.add(IterableExtensions.<Character, Integer>fold(((Iterable<Character>)Conversions.doWrapArray(_charArray)), _xifexpression, _function));
      }
    };
    input.forEach(_function);
    int _size = outputs.size();
    final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer v, final Integer i) {
        int _intValue = Double.valueOf(Math.pow(16, (i).intValue())).intValue();
        int _size = outputs.size();
        int _minus = (_size - (i).intValue());
        int _minus_1 = (_minus - 1);
        Integer _get = outputs.get(_minus_1);
        int _multiply = (_intValue * (_get).intValue());
        return Integer.valueOf(((v).intValue() + _multiply));
      }
    };
    InputOutput.<String>println(Integer.toHexString((IterableExtensions.<Integer, Integer>fold(new ExclusiveRange(0, _size, true), Integer.valueOf(0), _function_1)).intValue()));
  }
  
  public static int left(final int i) {
    int _switchResult = (int) 0;
    switch (i) {
      case 1:
      case 2:
      case 5:
      case 0xA:
      case 0xD:
        _switchResult = i;
        break;
      default:
        _switchResult = (i - 1);
        break;
    }
    return _switchResult;
  }
  
  public static int right(final int i) {
    int _switchResult = (int) 0;
    switch (i) {
      case 1:
      case 4:
      case 9:
      case 0xC:
      case 0xD:
        _switchResult = i;
        break;
      default:
        _switchResult = (i + 1);
        break;
    }
    return _switchResult;
  }
  
  public static int up(final int i) {
    int _switchResult = (int) 0;
    switch (i) {
      case 5:
      case 2:
      case 1:
      case 4:
      case 9:
        _switchResult = i;
        break;
      case 0xD:
      case 3:
        _switchResult = (i - 2);
        break;
      default:
        _switchResult = (i - 4);
        break;
    }
    return _switchResult;
  }
  
  public static int down(final int i) {
    int _switchResult = (int) 0;
    switch (i) {
      case 5:
      case 0xA:
      case 0xD:
      case 0xC:
      case 9:
        _switchResult = i;
        break;
      case 1:
      case 0xB:
        _switchResult = (i + 2);
        break;
      default:
        _switchResult = (i + 4);
        break;
    }
    return _switchResult;
  }
}
