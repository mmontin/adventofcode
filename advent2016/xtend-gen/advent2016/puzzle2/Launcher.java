package advent2016.puzzle2;

import adventutils.input.InputLoader;
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
    final List<String> input = new InputLoader(Integer.valueOf(2016), Integer.valueOf(2)).getInputs();
    final ArrayList<Integer> outputs = CollectionLiterals.<Integer>newArrayList();
    final Consumer<String> _function = (String it) -> {
      char[] _charArray = it.toCharArray();
      Integer _xifexpression = null;
      boolean _isEmpty = outputs.isEmpty();
      if (_isEmpty) {
        _xifexpression = Integer.valueOf(5);
      } else {
        _xifexpression = outputs.getLast();
      }
      final Function2<Integer, Character, Integer> _function_1 = (Integer current, Character inst) -> {
        int _switchResult = (int) 0;
        String _plus = (inst + "");
        if (_plus != null) {
          switch (_plus) {
            case "L":
              _switchResult = Launcher.left((current).intValue());
              break;
            case "R":
              _switchResult = Launcher.right((current).intValue());
              break;
            case "U":
              _switchResult = Launcher.up((current).intValue());
              break;
            default:
              _switchResult = Launcher.down((current).intValue());
              break;
          }
        } else {
          _switchResult = Launcher.down((current).intValue());
        }
        return Integer.valueOf(_switchResult);
      };
      outputs.add(IterableExtensions.<Character, Integer>fold(((Iterable<Character>)Conversions.doWrapArray(_charArray)), _xifexpression, _function_1));
    };
    input.forEach(_function);
    int _size = outputs.size();
    final Function2<Integer, Integer, Integer> _function_1 = (Integer v, Integer i) -> {
      int _intValue = Double.valueOf(Math.pow(16, (i).intValue())).intValue();
      int _size_1 = outputs.size();
      int _minus = (_size_1 - (i).intValue());
      int _minus_1 = (_minus - 1);
      Integer _get = outputs.get(_minus_1);
      int _multiply = (_intValue * (_get).intValue());
      return Integer.valueOf(((v).intValue() + _multiply));
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
