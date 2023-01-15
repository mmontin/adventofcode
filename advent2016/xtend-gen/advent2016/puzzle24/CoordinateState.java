package advent2016.puzzle24;

import adventutils.geometry.Coordinate;
import adventutils.pathfinding.State;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class CoordinateState extends Coordinate implements State {
  private Coordinate goal;

  public CoordinateState(final Coordinate c, final Coordinate goal_) {
    super(c.getX(), c.getY());
    this.goal = goal_;
  }

  public boolean isGoal() {
    return this.equals(this.goal);
  }

  public int minToGoal() {
    return this.manhattanDistanceTo(this.goal);
  }

  public Iterable<Pair<State, Integer>> neighbours() {
    final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
      public Boolean apply(final Coordinate it) {
        boolean _contains = Launcher.walls.contains(it);
        return Boolean.valueOf((!_contains));
      }
    };
    final Function1<Coordinate, Pair<State, Integer>> _function_1 = new Function1<Coordinate, Pair<State, Integer>>() {
      public Pair<State, Integer> apply(final Coordinate it) {
        CoordinateState _coordinateState = new CoordinateState(it, CoordinateState.this.goal);
        return new Pair<State, Integer>(((State) _coordinateState), Integer.valueOf(1));
      }
    };
    return IterableExtensions.<Pair<State, Integer>>toList(IterableExtensions.<Coordinate, Pair<State, Integer>>map(IterableExtensions.<Coordinate>filter(super.noDiagonalUnboundedNeighbours(), _function), _function_1));
  }
}
