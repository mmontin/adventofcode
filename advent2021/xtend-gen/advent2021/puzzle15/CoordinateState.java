package advent2021.puzzle15;

import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class CoordinateState extends Coordinate implements State {
  private int manhattan;
  
  private boolean finalState;
  
  public CoordinateState(final Coordinate c) {
    this(c.getX(), c.getY());
  }
  
  public CoordinateState(final int x_, final int y_) {
    super(x_, y_);
    int _x = this.getX();
    int _minus = ((2 * Launcher.max_indice) - _x);
    int _y = this.getY();
    int _minus_1 = (_minus - _y);
    this.manhattan = _minus_1;
    this.finalState = ((this.getX() == Launcher.max_indice) && (this.getY() == Launcher.max_indice));
  }
  
  public boolean isGoal() {
    return this.finalState;
  }
  
  public int minToGoal() {
    return this.manhattan;
  }
  
  public List<Pair<State, Integer>> neighbours() {
    final Function1<Coordinate, Pair<State, Integer>> _function = new Function1<Coordinate, Pair<State, Integer>>() {
      public Pair<State, Integer> apply(final Coordinate it) {
        CoordinateState _coordinateState = new CoordinateState(it);
        Integer _get = Launcher.coordinates.get(it);
        return new Pair<State, Integer>(((State) _coordinateState), _get);
      }
    };
    return ListExtensions.<Coordinate, Pair<State, Integer>>map(IterableExtensions.<Coordinate>toList(this.noDiagonalBoundedNeighbours(0, Launcher.max_indice)), _function);
  }
}
