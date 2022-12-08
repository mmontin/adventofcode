package adventutils.astar;

import java.util.List;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public interface State {
  boolean isGoal();

  int minToGoal();

  List<Pair<State, Integer>> neighbours();

  boolean equals(final Object other);

  int hashCode();
}
