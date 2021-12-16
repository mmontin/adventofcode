package advent2016.puzzle11;

import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Set<Building> visited = CollectionLiterals.<Building>newHashSet();
  
  private static Integer min_depth = Integer.valueOf(Integer.MAX_VALUE);
  
  public static void main(final String[] args) {
    Building _building = new Building();
    Launcher.process(_building, 0);
    InputOutput.<Integer>println(Launcher.min_depth);
  }
  
  public static void process(final Building current, final int depth) {
    if (current.isFinal) {
      Launcher.min_depth = Integer.valueOf(depth);
    } else {
      if ((depth < (Launcher.min_depth).intValue())) {
        Launcher.visited.add(current);
        final Function1<Building, Boolean> _function = new Function1<Building, Boolean>() {
          public Boolean apply(final Building it) {
            boolean _contains = Launcher.visited.contains(it);
            return Boolean.valueOf((!_contains));
          }
        };
        final Consumer<Building> _function_1 = new Consumer<Building>() {
          public void accept(final Building it) {
            Launcher.process(it, (depth + 1));
          }
        };
        IterableExtensions.<Building>filter(current.steps(), _function).forEach(_function_1);
      }
    }
  }
}
