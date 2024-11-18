package adventutils.pathfinding;

import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public interface State {
  boolean isGoal();

  int minToGoal();

  Iterable<Pair<? extends State, Integer>> neighbours();

  @Override
  boolean equals(final Object other);

  @Override
  int hashCode();
}
