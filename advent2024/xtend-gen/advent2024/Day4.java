package advent2024;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day4 {
  public static void main(final String[] args) {
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    final List<List<String>> inputs = ListExtensions.<String, List<String>>map(new InputLoader(Integer.valueOf(2024), Integer.valueOf(4)).getInputs(), _function);
    final HashMap<Coordinate, String> letters = CollectionLiterals.<Coordinate, String>newHashMap();
    int _size = inputs.size();
    final int max_i = (_size - 1);
    int _size_1 = inputs.get(0).size();
    final int max_j = (_size_1 - 1);
    IntegerRange _upTo = new IntegerRange(0, max_i);
    for (final Integer i : _upTo) {
      {
        final List<String> line = inputs.get((i).intValue());
        IntegerRange _upTo_1 = new IntegerRange(0, max_j);
        for (final Integer j : _upTo_1) {
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          letters.put(_coordinate, line.get((j).intValue()));
        }
      }
    }
    int count = 0;
    IntegerRange _upTo_1 = new IntegerRange(0, max_i);
    for (final Integer i_1 : _upTo_1) {
      IntegerRange _upTo_2 = new IntegerRange(0, max_j);
      for (final Integer j : _upTo_2) {
        int _count = count;
        Coordinate _coordinate = new Coordinate((i_1).intValue(), (j).intValue());
        Coordinate _coordinate_1 = new Coordinate((i_1).intValue(), ((j).intValue() + 1));
        Coordinate _coordinate_2 = new Coordinate((i_1).intValue(), ((j).intValue() + 2));
        Coordinate _coordinate_3 = new Coordinate((i_1).intValue(), ((j).intValue() + 3));
        int _analyse = Day4.analyse(letters, 
          CollectionLiterals.<Coordinate>newArrayList(_coordinate, _coordinate_1, _coordinate_2, _coordinate_3));
        Coordinate _coordinate_4 = new Coordinate((i_1).intValue(), (j).intValue());
        Coordinate _coordinate_5 = new Coordinate(((i_1).intValue() + 1), ((j).intValue() + 1));
        Coordinate _coordinate_6 = new Coordinate(((i_1).intValue() + 2), ((j).intValue() + 2));
        Coordinate _coordinate_7 = new Coordinate(((i_1).intValue() + 3), ((j).intValue() + 3));
        int _analyse_1 = Day4.analyse(letters, 
          CollectionLiterals.<Coordinate>newArrayList(_coordinate_4, _coordinate_5, _coordinate_6, _coordinate_7));
        int _plus = (_analyse + _analyse_1);
        Coordinate _coordinate_8 = new Coordinate((i_1).intValue(), (j).intValue());
        Coordinate _coordinate_9 = new Coordinate(((i_1).intValue() + 1), (j).intValue());
        Coordinate _coordinate_10 = new Coordinate(((i_1).intValue() + 2), (j).intValue());
        Coordinate _coordinate_11 = new Coordinate(((i_1).intValue() + 3), (j).intValue());
        int _analyse_2 = Day4.analyse(letters, 
          CollectionLiterals.<Coordinate>newArrayList(_coordinate_8, _coordinate_9, _coordinate_10, _coordinate_11));
        int _plus_1 = (_plus + _analyse_2);
        Coordinate _coordinate_12 = new Coordinate((i_1).intValue(), (j).intValue());
        Coordinate _coordinate_13 = new Coordinate(((i_1).intValue() + 1), ((j).intValue() - 1));
        Coordinate _coordinate_14 = new Coordinate(((i_1).intValue() + 2), ((j).intValue() - 2));
        Coordinate _coordinate_15 = new Coordinate(((i_1).intValue() + 3), ((j).intValue() - 3));
        int _analyse_3 = Day4.analyse(letters, 
          CollectionLiterals.<Coordinate>newArrayList(_coordinate_12, _coordinate_13, _coordinate_14, _coordinate_15));
        int _plus_2 = (_plus_1 + _analyse_3);
        count = (_count + _plus_2);
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(count));
    int count2 = 0;
    IntegerRange _upTo_3 = new IntegerRange(1, (max_i - 1));
    for (final Integer i_2 : _upTo_3) {
      IntegerRange _upTo_4 = new IntegerRange(1, (max_j - 1));
      for (final Integer j_1 : _upTo_4) {
        {
          Coordinate _coordinate_16 = new Coordinate(((i_2).intValue() - 1), ((j_1).intValue() - 1));
          String _get = letters.get(_coordinate_16);
          Coordinate _coordinate_17 = new Coordinate(((i_2).intValue() - 1), ((j_1).intValue() + 1));
          String _get_1 = letters.get(_coordinate_17);
          String _plus_3 = (_get + _get_1);
          Coordinate _coordinate_18 = new Coordinate((i_2).intValue(), (j_1).intValue());
          String _get_2 = letters.get(_coordinate_18);
          String _plus_4 = (_plus_3 + _get_2);
          Coordinate _coordinate_19 = new Coordinate(((i_2).intValue() + 1), ((j_1).intValue() - 1));
          String _get_3 = letters.get(_coordinate_19);
          String _plus_5 = (_plus_4 + _get_3);
          Coordinate _coordinate_20 = new Coordinate(((i_2).intValue() + 1), ((j_1).intValue() + 1));
          String _get_4 = letters.get(_coordinate_20);
          final String word = (_plus_5 + _get_4);
          if ((((Objects.equals(word, "MMASS") || Objects.equals(word, "SSAMM")) || Objects.equals(word, "SMASM")) || Objects.equals(word, "MSAMS"))) {
            count2++;
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(count2));
  }

  public static int analyse(final Map<Coordinate, String> letters, final List<Coordinate> list) {
    int _xblockexpression = (int) 0;
    {
      final Function2<String, Coordinate, String> _function = (String acc, Coordinate el) -> {
        String _orDefault = letters.getOrDefault(el, "");
        return (acc + _orDefault);
      };
      final String word = IterableExtensions.<Coordinate, String>fold(list, "", _function);
      int _xifexpression = (int) 0;
      if ((Objects.equals(word, "XMAS") || Objects.equals(word, "SAMX"))) {
        _xifexpression = 1;
      } else {
        _xifexpression = 0;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
