package advent2016.puzzle13;

import java.util.HashSet;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static final int target_x = 31;

  private static final int target_y = 39;

  public static void main(final String[] args) {
    Coordinates start = new Coordinates(1, 1);
    start.updateDistance(0);
    HashSet<Coordinates> visited = CollectionLiterals.<Coordinates>newHashSet();
    HashSet<Coordinates> toVisit = CollectionLiterals.<Coordinates>newHashSet(start);
    boolean shown = false;
    int size = 0;
    final Coordinates finish = new Coordinates(Launcher.target_x, Launcher.target_y);
    while ((!(start = IterableExtensions.<Coordinates, Integer>minBy(toVisit, new Function1<Coordinates, Integer>() {
      public Integer apply(final Coordinates it) {
        return Integer.valueOf(it.getDistance());
      }
    })).equals(finish))) {
      {
        if (((!shown) && (start.getDistance() > 50))) {
          size = visited.size();
          shown = true;
        }
        start.step(visited, toVisit);
        toVisit.remove(start);
        visited.add(start);
      }
    }
    int _distance = start.getDistance();
    String _plus = ("PART 1: " + Integer.valueOf(_distance));
    InputOutput.<String>println(_plus);
    InputOutput.<String>println(("PART 2: " + Integer.valueOf(size)));
  }
}
