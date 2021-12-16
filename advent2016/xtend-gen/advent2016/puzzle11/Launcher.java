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
    long time = System.currentTimeMillis();
    while ((!(first = IterableExtensions.<Building>min(Launcher.toVisit)).getFinal())) {
      {
        Integer _score = first.getScore();
        boolean _greaterThan = ((_score).intValue() > Launcher.best_score);
        if (_greaterThan) {
          Launcher.best_score = (first.getScore()).intValue();
        }
        first.step(Launcher.toVisit, Launcher.visited);
        Launcher.toVisit.remove(first);
        Launcher.visited.add(first);
      }
    }
    Integer _distance = first.getDistance();
    String _plus = (_distance + " minimal steps computed is ");
    long _currentTimeMillis = System.currentTimeMillis();
    long _minus = (_currentTimeMillis - time);
    String _plus_1 = (_plus + Long.valueOf(_minus));
    String _plus_2 = (_plus_1 + "ms");
    InputOutput.<String>println(_plus_2);
  }
}
