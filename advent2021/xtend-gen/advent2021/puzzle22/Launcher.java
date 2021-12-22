package advent2021.puzzle22;

import advent2021.Utils;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Launcher {
  private static final Set<Coordinate> ons = CollectionLiterals.<Coordinate>newHashSet();
  
  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        InputOutput.<String>println("next");
        final String[] split = it.split(",");
        final String[] split1 = (split[0]).split(" ");
        final boolean on = (split1[0]).equals("on");
        final String[] split2 = (split1[1]).split("\\.\\.");
        final int minx = Integer.parseInt((split2[0]).substring(2));
        final int maxx = Integer.parseInt(split2[1]);
        final String[] split3 = (split[1]).split("\\.\\.");
        final int miny = Integer.parseInt((split3[0]).substring(2));
        final int maxy = Integer.parseInt(split3[1]);
        final String[] split4 = (split[2]).split("\\.\\.");
        final int minz = Integer.parseInt((split4[0]).substring(2));
        final int maxz = Integer.parseInt(split4[1]);
        int _max = Math.max((-50), minx);
        int _min = Math.min(50, maxx);
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer i) {
            int _max = Math.max((-50), miny);
            int _min = Math.min(50, maxy);
            final Consumer<Integer> _function = new Consumer<Integer>() {
              public void accept(final Integer j) {
                int _max = Math.max((-50), minz);
                int _min = Math.min(50, maxz);
                final Consumer<Integer> _function = new Consumer<Integer>() {
                  public void accept(final Integer k) {
                    if (on) {
                      Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue(), (k).intValue());
                      Launcher.ons.add(_coordinate);
                    } else {
                      Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue(), (k).intValue());
                      Launcher.ons.remove(_coordinate_1);
                    }
                  }
                };
                new IntegerRange(_max, _min).forEach(_function);
              }
            };
            new IntegerRange(_max, _min).forEach(_function);
          }
        };
        new IntegerRange(_max, _min).forEach(_function);
      }
    };
    Utils.getInputs(22).forEach(_function);
    InputOutput.<Integer>println(Integer.valueOf(Launcher.ons.size()));
  }
}
