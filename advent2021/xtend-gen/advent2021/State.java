package advent2021;

import java.util.List;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public abstract class State {
  public abstract boolean isGoal();
  
  public abstract int minToGoal();
  
  public abstract List<Pair<State, Integer>> neighbours();
  
  public abstract boolean equals(final Object other);
  
  public abstract int hashCode();
}
