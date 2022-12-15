package advent2016.puzzle22;

import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import java.util.List;
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

  public List<Pair<State, Integer>> neighbours() {
    final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
      public Boolean apply(final Coordinate it) {
        return Boolean.valueOf((((!Launcher.walls.contains(it)) && 
          (!it.equals(Launcher.dataPosition))) && 
          Launcher.input.containsKey(it)));
      }
    };
    final Function1<Coordinate, Pair<State, Integer>> _function_1 = new Function1<Coordinate, Pair<State, Integer>>() {
      public Pair<State, Integer> apply(final Coordinate it) {
        CoordinateState _coordinateState = new CoordinateState(it);
        return new Pair<State, Integer>(((State) _coordinateState), Integer.valueOf(1));
      }
    };
    return IterableExtensions.<Pair<State, Integer>>toList(IterableExtensions.<Coordinate, Pair<State, Integer>>map(IterableExtensions.<Coordinate>filter(super.noDiagonalUnboundedNeighbours(), _function), _function_1));
  }
}
