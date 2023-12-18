package advent2022;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day8 {
  private static final Map<Coordinate, Integer> trees = CollectionLiterals.<Coordinate, Integer>newHashMap();

  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(8)).getInputs();
    final int max_i = inputs.size();
    final int max_j = inputs.get(0).length();
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer i) {
        final char[] line = inputs.get((i).intValue()).toCharArray();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
            char _get = line[(j).intValue()];
            String _plus = (Character.valueOf(_get) + "");
            Day8.trees.put(_coordinate, Integer.valueOf(Integer.parseInt(_plus)));
          }
        };
        new ExclusiveRange(0, max_j, true).forEach(_function);
      }
    };
    new ExclusiveRange(0, max_i, true).forEach(_function);
    final HashSet<Coordinate> visible = CollectionLiterals.<Coordinate>newHashSet();
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, max_i, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        int max_left_size = (-1);
        int max_right_size = (-1);
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, max_j, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final Coordinate current_left = new Coordinate((i).intValue(), (j).intValue());
            final Coordinate current_right = new Coordinate((i).intValue(), ((max_j - 1) - (j).intValue()));
            final Integer current_left_size = Day8.trees.get(current_left);
            final Integer current_right_size = Day8.trees.get(current_right);
            if (((current_left_size).intValue() > max_left_size)) {
              visible.add(current_left);
              max_left_size = (current_left_size).intValue();
            }
            if (((current_right_size).intValue() > max_right_size)) {
              visible.add(current_right);
              max_right_size = (current_right_size).intValue();
            }
          }
        }
      }
    }
    ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, max_j, true);
    for (final Integer j : _doubleDotLessThan_1) {
      {
        int max_top_size = (-1);
        int max_bot_size = (-1);
        ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange(0, max_i, true);
        for (final Integer i_1 : _doubleDotLessThan_2) {
          {
            final Coordinate current_top = new Coordinate((i_1).intValue(), (j).intValue());
            final Coordinate current_bot = new Coordinate(((max_i - 1) - (i_1).intValue()), (j).intValue());
            final Integer current_top_size = Day8.trees.get(current_top);
            final Integer current_bot_size = Day8.trees.get(current_bot);
            if (((current_top_size).intValue() > max_top_size)) {
              visible.add(current_top);
              max_top_size = (current_top_size).intValue();
            }
            if (((current_bot_size).intValue() > max_bot_size)) {
              visible.add(current_bot);
              max_bot_size = (current_bot_size).intValue();
            }
          }
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(visible.size()));
    int best_score = 0;
    ExclusiveRange _doubleDotLessThan_2 = new ExclusiveRange(0, max_i, true);
    for (final Integer i_1 : _doubleDotLessThan_2) {
      ExclusiveRange _doubleDotLessThan_3 = new ExclusiveRange(0, max_j, true);
      for (final Integer j_1 : _doubleDotLessThan_3) {
        {
          Coordinate _coordinate = new Coordinate((i_1).intValue(), (j_1).intValue());
          final Integer current_height = Day8.trees.get(_coordinate);
          int visibility_left = 0;
          int k = ((j_1).intValue() - 1);
          while ((Day8.trees.containsKey(new Coordinate((i_1).intValue(), k)) && (Day8.trees.get(new Coordinate((i_1).intValue(), k)).compareTo(current_height) < 0))) {
            {
              visibility_left++;
              k--;
            }
          }
          Coordinate _coordinate_1 = new Coordinate((i_1).intValue(), k);
          boolean _containsKey = Day8.trees.containsKey(_coordinate_1);
          if (_containsKey) {
            visibility_left++;
          }
          int visibility_right = 0;
          int l = ((j_1).intValue() + 1);
          while ((Day8.trees.containsKey(new Coordinate((i_1).intValue(), l)) && (Day8.trees.get(new Coordinate((i_1).intValue(), l)).compareTo(current_height) < 0))) {
            {
              visibility_right++;
              l++;
            }
          }
          Coordinate _coordinate_2 = new Coordinate((i_1).intValue(), l);
          boolean _containsKey_1 = Day8.trees.containsKey(_coordinate_2);
          if (_containsKey_1) {
            visibility_right++;
          }
          int visibility_up = 0;
          int m = ((i_1).intValue() - 1);
          while ((Day8.trees.containsKey(new Coordinate(m, (j_1).intValue())) && (Day8.trees.get(new Coordinate(m, (j_1).intValue())).compareTo(current_height) < 0))) {
            {
              visibility_up++;
              m--;
            }
          }
          Coordinate _coordinate_3 = new Coordinate(m, (j_1).intValue());
          boolean _containsKey_2 = Day8.trees.containsKey(_coordinate_3);
          if (_containsKey_2) {
            visibility_up++;
          }
          int visibility_down = 0;
          int n = ((i_1).intValue() + 1);
          while ((Day8.trees.containsKey(new Coordinate(n, (j_1).intValue())) && (Day8.trees.get(new Coordinate(n, (j_1).intValue())).compareTo(current_height) < 0))) {
            {
              visibility_down++;
              n++;
            }
          }
          Coordinate _coordinate_4 = new Coordinate(n, (j_1).intValue());
          boolean _containsKey_3 = Day8.trees.containsKey(_coordinate_4);
          if (_containsKey_3) {
            visibility_down++;
          }
          best_score = Math.max(best_score, (((visibility_left * visibility_right) * visibility_up) * visibility_down));
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(best_score));
  }
}
