package adventutils.pathfinding;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Path {
  private List<State> path;

  private State current;

  private int length;

  public Path(final State initial) {
    this.path = CollectionLiterals.<State>newArrayList(initial);
    this.current = initial;
    this.length = 0;
  }

  public Path(final Path current_path, final Pair<State, Integer> neighbour) {
    ArrayList<State> _arrayList = new ArrayList<State>(current_path.path);
    this.path = _arrayList;
    this.current = neighbour.getKey();
    this.path.add(this.current);
    Integer _value = neighbour.getValue();
    int _plus = (current_path.length + (_value).intValue());
    this.length = _plus;
  }

  public Path(final List<State> a_path, final Integer distance) {
    ArrayList<State> _arrayList = new ArrayList<State>(a_path);
    this.path = _arrayList;
    this.current = IterableExtensions.<State>last(this.path);
    this.length = (distance).intValue();
  }

  public State last() {
    return this.current;
  }

  public List<State> getPath() {
    return this.path;
  }

  public int getLength() {
    return this.length;
  }

  public String toString() {
    return this.path.toString();
  }

  public void branch(final Map<State, Integer> min_distances, final Collection<Path> min_paths) {
    int _xifexpression = (int) 0;
    int _size = min_paths.size();
    boolean _equals = (_size == 0);
    if (_equals) {
      _xifexpression = Integer.MAX_VALUE;
    } else {
      _xifexpression = IterableExtensions.<Path>head(min_paths).length;
    }
    final int min_path_length = _xifexpression;
    final Function1<Pair<State, Integer>, Integer> _function = new Function1<Pair<State, Integer>, Integer>() {
      public Integer apply(final Pair<State, Integer> it) {
        Integer _value = it.getValue();
        int _minToGoal = it.getKey().minToGoal();
        return Integer.valueOf(((_value).intValue() + _minToGoal));
      }
    };
    final Consumer<Pair<State, Integer>> _function_1 = new Consumer<Pair<State, Integer>>() {
      public void accept(final Pair<State, Integer> next) {
        Integer _value = next.getValue();
        final int length_to_next = (Path.this.length + (_value).intValue());
        if ((((length_to_next + next.getKey().minToGoal()) <= min_path_length) && 
          (length_to_next <= (min_distances.getOrDefault(next.getKey(), Integer.valueOf(Integer.MAX_VALUE))).intValue()))) {
          new Path(Path.this, next).search(min_distances, min_paths);
        }
      }
    };
    IterableExtensions.<Pair<State, Integer>, Integer>sortBy(this.current.neighbours(), _function).forEach(_function_1);
  }

  public void search(final Map<State, Integer> min_distances, final Collection<Path> min_paths) {
    min_distances.put(this.current, Integer.valueOf(this.length));
    boolean _isGoal = this.current.isGoal();
    if (_isGoal) {
      int _xifexpression = (int) 0;
      int _size = min_paths.size();
      boolean _equals = (_size == 0);
      if (_equals) {
        _xifexpression = Integer.MAX_VALUE;
      } else {
        _xifexpression = IterableExtensions.<Path>head(min_paths).length;
      }
      boolean _lessThan = (this.length < _xifexpression);
      if (_lessThan) {
        min_paths.clear();
      }
      min_paths.add(this);
    } else {
      this.branch(min_distances, min_paths);
    }
  }
}
