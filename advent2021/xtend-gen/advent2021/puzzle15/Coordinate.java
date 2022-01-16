package advent2021.puzzle15;

import adventutils.astar.State;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Coordinate extends State {
  private int x;
  
  private int y;
  
  private int manhattan;
  
  private boolean finalState;
  
  private int code;
  
  public Coordinate(final int x_, final int y_) {
    this.x = x_;
    this.y = y_;
    this.manhattan = (((2 * Launcher.max_indice) - this.x) - this.y);
    this.finalState = ((this.x == Launcher.max_indice) && (this.y == Launcher.max_indice));
    final int tmp = (this.y + ((this.x + 1) / 2));
    this.code = (this.x + (tmp * tmp));
  }
  
  public boolean isGoal() {
    return this.finalState;
  }
  
  public int minToGoal() {
    return this.manhattan;
  }
  
  public List<Pair<State, Integer>> neighbours() {
    List<Pair<State, Integer>> _xblockexpression = null;
    {
      final ArrayList<Coordinate> output = CollectionLiterals.<Coordinate>newArrayList();
      if ((this.x != 0)) {
        Coordinate _coordinate = new Coordinate((this.x - 1), this.y);
        output.add(_coordinate);
      }
      if ((this.x != Launcher.max_indice)) {
        Coordinate _coordinate_1 = new Coordinate((this.x + 1), this.y);
        output.add(_coordinate_1);
      }
      if ((this.y != 0)) {
        Coordinate _coordinate_2 = new Coordinate(this.x, (this.y - 1));
        output.add(_coordinate_2);
      }
      if ((this.y != Launcher.max_indice)) {
        Coordinate _coordinate_3 = new Coordinate(this.x, (this.y + 1));
        output.add(_coordinate_3);
      }
      final Function1<Coordinate, Pair<State, Integer>> _function = new Function1<Coordinate, Pair<State, Integer>>() {
        public Pair<State, Integer> apply(final Coordinate it) {
          Integer _get = Launcher.coordinates.get(it);
          return new Pair<State, Integer>(((State) it), _get);
        }
      };
      _xblockexpression = ListExtensions.<Coordinate, Pair<State, Integer>>map(output, _function);
    }
    return _xblockexpression;
  }
  
  public boolean equals(final Object o) {
    boolean _xblockexpression = false;
    {
      final Coordinate other = ((Coordinate) o);
      _xblockexpression = ((this.x == other.x) && (this.y == other.y));
    }
    return _xblockexpression;
  }
  
  public int hashCode() {
    return this.code;
  }
}
