package advent2021.puzzle16;

import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static final String input = new Function0<String>() {
    public String apply() {
      try {
        final Function2<String, Character, String> _function = new Function2<String, Character, String>() {
          public String apply(final String s, final Character c) {
            String _plus = (c + "");
            String _replace = String.format("%4s", Integer.toBinaryString(Integer.parseInt(_plus, 16))).replace(" ", "0");
            return (s + _replace);
          }
        };
        String _fold = IterableExtensions.<Character, String>fold(((Iterable<Character>)Conversions.doWrapArray(new InputLoader(Integer.valueOf(2021), Integer.valueOf(16)).getInputReader().readLine().toCharArray())), "", _function);
        return _fold;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();

  private static int i = 0;

  private static int sum = 0;

  public static void main(final String[] args) {
    Long _decodePacket = Launcher.decodePacket();
    String _plus = ("PART 2: " + _decodePacket);
    InputOutput.<String>println(_plus);
    InputOutput.<String>println(("PART 1: " + Integer.valueOf(Launcher.sum)));
  }

  public static Long decodePacket() {
    Long _xblockexpression = null;
    {
      int _sum = Launcher.sum;
      int _parseInt = Integer.parseInt(Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 3)), 2);
      Launcher.sum = (_sum + _parseInt);
      final int type_id = Integer.parseInt(Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 3)), 2);
      Long _xifexpression = null;
      if ((type_id == 4)) {
        long _xblockexpression_1 = (long) 0;
        {
          String number = "";
          while (Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 1)).equals("1")) {
            String _number = number;
            String _substring = Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 4));
            number = (_number + _substring);
          }
          String _substring = Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 4));
          String _plus = (number + _substring);
          _xblockexpression_1 = Long.parseLong(_plus, 2);
        }
        _xifexpression = Long.valueOf(_xblockexpression_1);
      } else {
        Long _xblockexpression_2 = null;
        {
          final ArrayList<Long> values = CollectionLiterals.<Long>newArrayList();
          boolean _equals = Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 1)).equals("0");
          if (_equals) {
            int total_length = Integer.parseInt(Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 15)), 2);
            int final_index = (Launcher.i + total_length);
            while ((Launcher.i != final_index)) {
              values.add(Launcher.decodePacket());
            }
          } else {
            int _parseInt_1 = Integer.parseInt(Launcher.input.substring(Launcher.i, Launcher.i = (Launcher.i + 11)), 2);
            final Consumer<Integer> _function = new Consumer<Integer>() {
              public void accept(final Integer it) {
                values.add(Launcher.decodePacket());
              }
            };
            new ExclusiveRange(0, _parseInt_1, true).forEach(_function);
          }
          Long _switchResult = null;
          switch (type_id) {
            case 0:
              final Function2<Long, Long, Long> _function_1 = new Function2<Long, Long, Long>() {
                public Long apply(final Long x, final Long y) {
                  return Long.valueOf(((x).longValue() + (y).longValue()));
                }
              };
              _switchResult = IterableExtensions.<Long>reduce(values, _function_1);
              break;
            case 1:
              final Function2<Long, Long, Long> _function_2 = new Function2<Long, Long, Long>() {
                public Long apply(final Long x, final Long y) {
                  return Long.valueOf(((x).longValue() * (y).longValue()));
                }
              };
              _switchResult = IterableExtensions.<Long>reduce(values, _function_2);
              break;
            case 2:
              _switchResult = IterableExtensions.<Long>min(values);
              break;
            case 3:
              _switchResult = IterableExtensions.<Long>max(values);
              break;
            case 5:
              long _xifexpression_1 = (long) 0;
              Long _get = values.get(0);
              Long _get_1 = values.get(1);
              boolean _greaterThan = (_get.compareTo(_get_1) > 0);
              if (_greaterThan) {
                _xifexpression_1 = 1L;
              } else {
                _xifexpression_1 = 0L;
              }
              _switchResult = Long.valueOf(_xifexpression_1);
              break;
            case 6:
              long _xifexpression_2 = (long) 0;
              Long _get_2 = values.get(0);
              Long _get_3 = values.get(1);
              boolean _lessThan = (_get_2.compareTo(_get_3) < 0);
              if (_lessThan) {
                _xifexpression_2 = 1L;
              } else {
                _xifexpression_2 = 0L;
              }
              _switchResult = Long.valueOf(_xifexpression_2);
              break;
            default:
              long _xifexpression_3 = (long) 0;
              Long _get_4 = values.get(0);
              Long _get_5 = values.get(1);
              boolean _equals_1 = Objects.equal(_get_4, _get_5);
              if (_equals_1) {
                _xifexpression_3 = 1L;
              } else {
                _xifexpression_3 = 0L;
              }
              _switchResult = Long.valueOf(_xifexpression_3);
              break;
          }
          _xblockexpression_2 = _switchResult;
        }
        _xifexpression = _xblockexpression_2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
