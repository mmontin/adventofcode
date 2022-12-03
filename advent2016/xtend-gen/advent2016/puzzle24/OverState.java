package advent2016.puzzle24;

import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class OverState implements State {
  protected Coordinate currentPosition;
  
  private Set<Coordinate> toVisit;
  
  private int code;
  
  public OverState(final Coordinate currentPosition_, final Set<Coordinate> toVisit_) {
    this.currentPosition = currentPosition_;
    this.toVisit = toVisit_;
    int _hashCode = this.currentPosition.hashCode();
    int _hashCode_1 = this.toVisit.hashCode();
    int _multiply = (_hashCode * _hashCode_1);
    this.code = _multiply;
  }
  
  public boolean isGoal() {
    return (this.toVisit.isEmpty() && this.currentPosition.equals(Launcher.initial));
  }
  
  public int minToGoal() {
    return this.currentPosition.manhattanDistanceTo(Launcher.initial);
  }
  
  public List<Pair<State, Integer>> neighbours() {
    List<Pair<State, Integer>> _xifexpression = null;
    boolean _equals = this.toVisit.equals(CollectionLiterals.<Coordinate>newHashSet(Launcher.initial));
    if (_equals) {
      HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet();
      OverState _overState = new OverState(Launcher.initial, _newHashSet);
      Integer _get = Launcher.distances.get(CollectionLiterals.<Coordinate>newHashSet(this.currentPosition, Launcher.initial));
      Pair<State, Integer> _pair = new Pair<State, Integer>(((State) _overState), _get);
      _xifexpression = CollectionLiterals.<Pair<State, Integer>>newArrayList(_pair);
    } else {
      final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
        public Boolean apply(final Coordinate it) {
          boolean _equals = it.equals(Launcher.initial);
          return Boolean.valueOf((!_equals));
        }
      };
      final Function1<Coordinate, Pair<State, Integer>> _function_1 = new Function1<Coordinate, Pair<State, Integer>>() {
        public Pair<State, Integer> apply(final Coordinate it) {
          Pair<State, Integer> _xblockexpression = null;
          {
            final HashSet<Coordinate> newToVisit = new HashSet<Coordinate>(OverState.this.toVisit);
            newToVisit.remove(it);
            OverState _overState = new OverState(it, newToVisit);
            Integer _get = Launcher.distances.get(CollectionLiterals.<Coordinate>newHashSet(it, OverState.this.currentPosition));
            _xblockexpression = new Pair<State, Integer>(((State) _overState), _get);
          }
          return _xblockexpression;
        }
      };
      _xifexpression = IterableExtensions.<Pair<State, Integer>>toList(IterableExtensions.<Coordinate, Pair<State, Integer>>map(IterableExtensions.<Coordinate>filter(this.toVisit, _function), _function_1));
    }
    return _xifexpression;
  }
  
  public int hashCode() {
    return this.code;
  }
  
  public boolean equals(final Object other) {
    boolean _xblockexpression = false;
    {
      final OverState o = ((OverState) other);
      _xblockexpression = (this.currentPosition.equals(o.currentPosition) && this.toVisit.equals(o.toVisit));
    }
    return _xblockexpression;
  }
  
  public String toString() {
    return this.currentPosition.toString();
  }
}
