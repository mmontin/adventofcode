package adventutils.pathfinding;

import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public interface State {
  boolean isGoal();

  int minToGoal();

  Iterable<Pair<State, Integer>> neighbours();

  boolean equals(final Object other);

  int hashCode();
}
