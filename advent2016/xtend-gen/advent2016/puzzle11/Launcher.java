package advent2016.puzzle11;

import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Set<Building> toVisit = CollectionLiterals.<Building>newHashSet(new Building(0));
  
  private static Set<Building> visited = CollectionLiterals.<Building>newHashSet();
  
  private static int best_score = 0;
  
  public static void main(final String[] args) {
    Building first = null;
    long time_abs = System.currentTimeMillis();
    long time = System.currentTimeMillis();
    int i = 0;
    while ((!(first = IterableExtensions.<Building>min(Launcher.toVisit)).isFinal)) {
      {
        Launcher.update((first.getScore()).intValue());
        first.step(Launcher.toVisit, Launcher.visited);
        Launcher.toVisit.remove(first);
        Launcher.visited.add(first);
        int _plusPlus = i++;
        int _modulo = (_plusPlus % 10000);
        boolean _equals = (_modulo == 0);
        if (_equals) {
          long time_1 = System.currentTimeMillis();
          String _plus = (Long.valueOf((time_1 - time)) + "ms for the last 10000 states");
          InputOutput.<String>println(_plus);
          time = time_1;
          String _plus_1 = (Integer.valueOf((i - 1)) + " states explored so far in ");
          long _currentTimeMillis = System.currentTimeMillis();
          long _minus = (_currentTimeMillis - time_abs);
          long _divide = (_minus / 1000);
          String _plus_2 = (_plus_1 + Long.valueOf(_divide));
          String _plus_3 = (_plus_2 + " seconds");
          InputOutput.<String>println(_plus_3);
        }
      }
    }
    String _plus = (Integer.valueOf(i) + " states visited in total.");
    InputOutput.<String>println(_plus);
    InputOutput.<Integer>println(first.getDistance());
  }
  
  public static int update(final int score_) {
    int _xifexpression = (int) 0;
    if ((score_ > Launcher.best_score)) {
      int _xblockexpression = (int) 0;
      {
        InputOutput.<String>println(("New best score : " + Integer.valueOf(score_)));
        _xblockexpression = Launcher.best_score = score_;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
}
