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

  @Override
  public boolean isGoal() {
    return this.equals(this.goal);
  }

  @Override
  public int minToGoal() {
    return this.manhattanDistanceTo(this.goal);
  }

  @Override
  public Iterable<Pair<? extends State, Integer>> neighbours() {
    final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
      boolean _contains = Launcher.walls.contains(it);
      return Boolean.valueOf((!_contains));
    };
    final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
      CoordinateState _coordinateState = new CoordinateState(it, this.goal);
      return Pair.<CoordinateState, Integer>of(_coordinateState, Integer.valueOf(1));
    };
    return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(super.noDiagonalUnboundedNeighbours(), _function), _function_1);
  }
}
