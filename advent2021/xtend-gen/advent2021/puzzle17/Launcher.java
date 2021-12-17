package advent2021.puzzle17;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Launcher {
  private static final int minX = 281;
  
  private static final int maxX = 311;
  
  private static final int minY = (-74);
  
  private static final int maxY = (-54);
  
  public static void main(final String[] args) {
    int max_velocity_x = Launcher.maxX;
    int max_velocity_y = ((-Launcher.minY) - 1);
    final HashMap<Integer, HashSet<Integer>> map_y_candidates = CollectionLiterals.<Integer, HashSet<Integer>>newHashMap();
    IntegerRange _upTo = new IntegerRange((-(max_velocity_y + 1)), max_velocity_y);
    for (final Integer vy : _upTo) {
      final Consumer<Integer> _function = new Consumer<Integer>() {
        public void accept(final Integer it) {
          final BiFunction<HashSet<Integer>, HashSet<Integer>, HashSet<Integer>> _function = new BiFunction<HashSet<Integer>, HashSet<Integer>, HashSet<Integer>>() {
            public HashSet<Integer> apply(final HashSet<Integer> s1, final HashSet<Integer> s2) {
              HashSet<Integer> _xblockexpression = null;
              {
                s1.addAll(s2);
                _xblockexpression = s1;
              }
              return _xblockexpression;
            }
          };
          map_y_candidates.merge(it, CollectionLiterals.<Integer>newHashSet(vy), _function);
        }
      };
      Launcher.getYCandidateSteps((vy).intValue()).forEach(_function);
    }
    int max_y = 0;
    HashSet<String> velocities = CollectionLiterals.<String>newHashSet();
    IntegerRange _upTo_1 = new IntegerRange(1, max_velocity_x);
    for (final Integer vx : _upTo_1) {
      Set<Map.Entry<Integer, HashSet<Integer>>> _entrySet = map_y_candidates.entrySet();
      for (final Map.Entry<Integer, HashSet<Integer>> e : _entrySet) {
        boolean _validXValue = Launcher.validXValue((vx).intValue(), (e.getKey()).intValue());
        if (_validXValue) {
          HashSet<Integer> _value = e.getValue();
          for (final Integer vy_1 : _value) {
            {
              max_y = Math.max(max_y, (((vy_1).intValue() * ((vy_1).intValue() + 1)) / 2));
              String _plus = (vx + ",");
              String _plus_1 = (_plus + vy_1);
              velocities.add(_plus_1);
            }
          }
        }
      }
    }
    InputOutput.<String>println(("PART 1: " + Integer.valueOf(max_y)));
    int _size = velocities.size();
    String _plus = ("PART 2: " + Integer.valueOf(_size));
    InputOutput.<String>println(_plus);
  }
  
  public static HashSet<Integer> getYCandidateSteps(final int vy) {
    HashSet<Integer> _xblockexpression = null;
    {
      HashSet<Integer> step_nbs = CollectionLiterals.<Integer>newHashSet();
      int _xifexpression = (int) 0;
      if ((vy > 0)) {
        _xifexpression = ((2 * vy) + 1);
      } else {
        _xifexpression = 0;
      }
      int step_nb = _xifexpression;
      int y = 0;
      int _xifexpression_1 = (int) 0;
      if ((vy > 0)) {
        _xifexpression_1 = ((-vy) - 1);
      } else {
        _xifexpression_1 = vy;
      }
      int vely = _xifexpression_1;
      while ((y > Launcher.minY)) {
        {
          step_nb++;
          int _y = y;
          y = (_y + vely);
          vely--;
          if (((y >= Launcher.minY) && (y <= Launcher.maxY))) {
            step_nbs.add(Integer.valueOf(step_nb));
          }
        }
      }
      _xblockexpression = step_nbs;
    }
    return _xblockexpression;
  }
  
  public static boolean validXValue(final int vx, final int step) {
    boolean _xblockexpression = false;
    {
      int _xifexpression = (int) 0;
      if ((step >= (vx + 1))) {
        _xifexpression = ((vx * (vx + 1)) / 2);
      } else {
        _xifexpression = ((step * (((2 * vx) - step) + 1)) / 2);
      }
      int value = _xifexpression;
      _xblockexpression = ((value >= Launcher.minX) && (value <= Launcher.maxX));
    }
    return _xblockexpression;
  }
}
