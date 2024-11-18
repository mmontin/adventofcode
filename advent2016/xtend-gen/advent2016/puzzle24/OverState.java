package advent2016.puzzle24;

import adventutils.geometry.Coordinate;
import adventutils.pathfinding.State;
import java.util.HashSet;
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

  @Override
  public boolean isGoal() {
    return (this.toVisit.isEmpty() && this.currentPosition.equals(Launcher.initial));
  }

  @Override
  public int minToGoal() {
    return this.currentPosition.manhattanDistanceTo(Launcher.initial);
  }

  @Override
  public Iterable<Pair<? extends State, Integer>> neighbours() {
    Iterable<Pair<? extends State, Integer>> _xifexpression = null;
    boolean _equals = this.toVisit.equals(CollectionLiterals.<Coordinate>newHashSet(Launcher.initial));
    if (_equals) {
      HashSet<Coordinate> _newHashSet = CollectionLiterals.<Coordinate>newHashSet();
      OverState _overState = new OverState(Launcher.initial, _newHashSet);
      Integer _get = Launcher.distances.get(CollectionLiterals.<Coordinate>newHashSet(this.currentPosition, Launcher.initial));
      Pair<State, Integer> _pair = new Pair<State, Integer>(((State) _overState), _get);
      _xifexpression = CollectionLiterals.<Pair<? extends State, Integer>>newArrayList(_pair);
    } else {
      final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
        boolean _equals_1 = it.equals(Launcher.initial);
        return Boolean.valueOf((!_equals_1));
      };
      final Function1<Coordinate, Pair<? extends State, Integer>> _function_1 = (Coordinate it) -> {
        Pair<OverState, Integer> _xblockexpression = null;
        {
          final HashSet<Coordinate> newToVisit = new HashSet<Coordinate>(this.toVisit);
          newToVisit.remove(it);
          OverState _overState_1 = new OverState(it, newToVisit);
          Integer _get_1 = Launcher.distances.get(CollectionLiterals.<Coordinate>newHashSet(it, this.currentPosition));
          _xblockexpression = Pair.<OverState, Integer>of(_overState_1, _get_1);
        }
        return _xblockexpression;
      };
      _xifexpression = IterableExtensions.<Coordinate, Pair<? extends State, Integer>>map(IterableExtensions.<Coordinate>filter(this.toVisit, _function), _function_1);
    }
    return _xifexpression;
  }

  @Override
  public int hashCode() {
    return this.code;
  }

  @Override
  public boolean equals(final Object other) {
    boolean _xblockexpression = false;
    {
      final OverState o = ((OverState) other);
      _xblockexpression = (this.currentPosition.equals(o.currentPosition) && this.toVisit.equals(o.toVisit));
    }
    return _xblockexpression;
  }

  @Override
  public String toString() {
    return this.currentPosition.toString();
  }
}
