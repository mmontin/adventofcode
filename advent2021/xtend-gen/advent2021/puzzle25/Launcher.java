package advent2021.puzzle25;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static final List<String> inputStrings = new InputLoader(Integer.valueOf(2021), Integer.valueOf(25)).getInputs();

  private static final int max_i = Launcher.inputStrings.size();

  private static final int max_j = Launcher.inputStrings.get(0).length();

  private static Set<Coordinate> east = CollectionLiterals.<Coordinate>newHashSet();

  private static Set<Coordinate> south = CollectionLiterals.<Coordinate>newHashSet();

  public static void main(final String[] args) {
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer i) {
        final String line = Launcher.inputStrings.get((i).intValue());
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            char _charAt = line.charAt((j).intValue());
            String _plus = ("" + Character.valueOf(_charAt));
            boolean _matched = false;
            if (Objects.equal(_plus, ">")) {
              _matched=true;
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              Launcher.east.add(_coordinate);
            }
            if (!_matched) {
              if (Objects.equal(_plus, "v")) {
                _matched=true;
                Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
                Launcher.south.add(_coordinate_1);
              }
            }
          }
        };
        new ExclusiveRange(0, Launcher.max_j, true).forEach(_function);
      }
    };
    new ExclusiveRange(0, Launcher.max_i, true).forEach(_function);
    int stepNb = 0;
    do {
      stepNb++;
    } while(Launcher.step());
    InputOutput.<Integer>print(Integer.valueOf(stepNb));
  }

  public static boolean step() {
    boolean _xblockexpression = false;
    {
      boolean ans = false;
      final HashSet<Coordinate> doubleEast = new HashSet<Coordinate>(Launcher.east);
      for (final Coordinate c : Launcher.east) {
        {
          final Coordinate right = c.right(Launcher.max_j);
          boolean _not = (!(Launcher.east.contains(right) || Launcher.south.contains(right)));
          if (_not) {
            doubleEast.remove(c);
            doubleEast.add(right);
            ans = true;
          }
        }
      }
      Launcher.east = doubleEast;
      final HashSet<Coordinate> doubleSouth = new HashSet<Coordinate>(Launcher.south);
      for (final Coordinate c_1 : Launcher.south) {
        {
          final Coordinate bottom = c_1.down(Launcher.max_i);
          boolean _not = (!(Launcher.east.contains(bottom) || Launcher.south.contains(bottom)));
          if (_not) {
            doubleSouth.remove(c_1);
            doubleSouth.add(bottom);
            ans = true;
          }
        }
      }
      Launcher.south = doubleSouth;
      _xblockexpression = ans;
    }
    return _xblockexpression;
  }
}
