package advent2021.puzzle15;

import adventutils.geometry.Coordinate;
import adventutils.pathfinding.State;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class CoordinateState extends Coordinate implements State {
  private static final Coordinate finalState = new Coordinate(Launcher.max_indice, Launcher.max_indice);

  private int manhattan;

  private boolean isFinal;

  public CoordinateState(final Coordinate c) {
    this(c.getX(), c.getY());
  }

  public CoordinateState(final int x_, final int y_) {
    super(x_, y_);
    this.manhattan = this.manhattanDistanceTo(CoordinateState.finalState);
    this.isFinal = this.equals(CoordinateState.finalState);
  }

  public boolean isGoal() {
    return this.isFinal;
  }

  public int minToGoal() {
    return this.manhattan;
  }

  public Iterable<Pair<? extends State, Integer>> neighbours() {
    final Function1<Coordinate, Pair<? extends State, Integer>> _function = new Function1<Coordinate, Pair<? extends State, Integer>>() {
      public Pair<? extends State, Integer> apply(final Coordinate it) {
        CoordinateState _coordinateState = new CoordinateState(it);
        Integer _get = Launcher.coordinates.get(it);
        return new Pair<State, Integer>(((State) _coordinateState), _get);
      }
    };
    return ListExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>toList(this.noDiagonalBoundedNeighbours(0, Launcher.max_indice)), _function);
  }
}
