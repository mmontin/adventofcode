package advent2016.puzzle22;

import adventutils.geometry.Coordinate;
import adventutils.pathfinding.State;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class CoordinateState extends Coordinate implements State {
  public CoordinateState(final Coordinate c) {
    super(c.getX(), c.getY());
  }

  public boolean isGoal() {
    return this.equals(Launcher.target);
  }

  public int minToGoal() {
    return this.manhattanDistanceTo(Launcher.target);
  }

  public Iterable<Pair<? extends State, Integer>> neighbours() {
    final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
      public Boolean apply(final Coordinate it) {
        return Boolean.valueOf((((!Launcher.walls.contains(it)) && (!it.equals(Launcher.dataPosition))) && Launcher.input.containsKey(it)));
      }
    };
    final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = new Function1<Coordinate, Pair<? extends State, Integer>>() {
      public Pair<? extends State, Integer> apply(final Coordinate it) {
        CoordinateState _coordinateState = new CoordinateState(it);
        return Pair.<CoordinateState, Integer>of(_coordinateState, Integer.valueOf(1));
      }
    };
    return IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.noDiagonalUnboundedNeighbours(), _function), _function_1);
  }
}
