package advent2023;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionExtensions;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day2 {
  private static final int maxRed = 12;

  private static final int maxGreen = 13;

  private static final int maxBlue = 14;

  public static void main(final String[] args) {
    List<String> _inputs = new InputLoader(Integer.valueOf(2023), Integer.valueOf(2)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = (Pair<Integer, Integer> v, String e) -> {
      Pair<Integer, Integer> _xblockexpression = null;
      {
        final String[] split1 = e.split(": ");
        final int id = Integer.parseInt((split1[0]).split("Game ")[1]);
        final String[] split2 = (split1[1]).split("; ");
        final Function1<String, String[]> _function_1 = (String x) -> {
          return x.split(", ");
        };
        final List<String[]> finalSplit = ListExtensions.<String, String[]>map(((List<String>)Conversions.doWrapArray(split2)), _function_1);
        Integer _key = v.getKey();
        int _xifexpression = (int) 0;
        final Function2<Boolean, String[], Boolean> _function_2 = (Boolean res, String[] game) -> {
          return Boolean.valueOf(((res).booleanValue() && Day2.gamePossible(((List<String>)Conversions.doWrapArray(game)))));
        };
        Boolean _fold = IterableExtensions.<String[], Boolean>fold(finalSplit, Boolean.valueOf(true), _function_2);
        if ((boolean) _fold) {
          _xifexpression = id;
        } else {
          _xifexpression = 0;
        }
        final int left = ((_key).intValue() + _xifexpression);
        final Function2<ArrayList<String>, String[], ArrayList<String>> _function_3 = (ArrayList<String> l, String[] el) -> {
          ArrayList<String> _xblockexpression_1 = null;
          {
            CollectionExtensions.<String>addAll(l, el);
            _xblockexpression_1 = l;
          }
          return _xblockexpression_1;
        };
        final ArrayList<String> joined = IterableExtensions.<String[], ArrayList<String>>fold(finalSplit, CollectionLiterals.<String>newArrayList(), _function_3);
        Integer _value = v.getValue();
        int _gamePower = Day2.gamePower(joined);
        final int right = ((_value).intValue() + _gamePower);
        _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(left), Integer.valueOf(right));
      }
      return _xblockexpression;
    };
    InputOutput.<Pair<Integer, Integer>>println(IterableExtensions.<String, Pair<Integer, Integer>>fold(_inputs, _mappedTo, _function));
  }

  public static int gamePower(final List<String> inputs) {
    int _xblockexpression = (int) 0;
    {
      int minBlue = 0;
      int minRed = 0;
      int minGreen = 0;
      for (final String data : inputs) {
        {
          final String[] lastSplit = data.split(" ");
          final int quantity = Integer.parseInt(lastSplit[0]);
          String _get = lastSplit[1];
          if (_get != null) {
            switch (_get) {
              case "blue":
                if ((quantity > minBlue)) {
                  minBlue = quantity;
                }
                break;
              case "red":
                if ((quantity > minRed)) {
                  minRed = quantity;
                }
                break;
              case "green":
                if ((quantity > minGreen)) {
                  minGreen = quantity;
                }
                break;
            }
          }
        }
      }
      _xblockexpression = ((minBlue * minRed) * minGreen);
    }
    return _xblockexpression;
  }

  public static boolean gamePossible(final List<String> inputs) {
    boolean _xblockexpression = false;
    {
      int blue = 0;
      int red = 0;
      int green = 0;
      for (final String data : inputs) {
        {
          final String[] lastSplit = data.split(" ");
          final int quantity = Integer.parseInt(lastSplit[0]);
          String _get = lastSplit[1];
          if (_get != null) {
            switch (_get) {
              case "blue":
                int _blue = blue;
                blue = (_blue + quantity);
                break;
              case "red":
                int _red = red;
                red = (_red + quantity);
                break;
              case "green":
                int _green = green;
                green = (_green + quantity);
                break;
            }
          }
        }
      }
      _xblockexpression = (((blue <= Day2.maxBlue) && (red <= Day2.maxRed)) && (green <= Day2.maxGreen));
    }
    return _xblockexpression;
  }
}
