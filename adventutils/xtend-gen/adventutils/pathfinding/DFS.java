package adventutils.pathfinding;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class DFS {
  public static class Path {
    private List<State> path;

    private State current;

    private int length;

    public Path(final State initial) {
      this.path = CollectionLiterals.<State>newArrayList(initial);
      this.current = initial;
      this.length = 0;
    }

    public Path(final DFS.Path current_path, final Pair<State, Integer> neighbour) {
      ArrayList<State> _arrayList = new ArrayList<State>(current_path.path);
      this.path = _arrayList;
      this.current = neighbour.getKey();
      this.path.add(this.current);
      Integer _value = neighbour.getValue();
      int _plus = (current_path.length + (_value).intValue());
      this.length = _plus;
    }

    public boolean contains(final State element) {
      return this.path.contains(element);
    }

    public HashSet<DFS.Path> branch(final Map<State, Integer> min_distances, final Collection<DFS.Path> min_paths) {
      HashSet<DFS.Path> _xblockexpression = null;
      {
        int _xifexpression = (int) 0;
        int _size = min_paths.size();
        boolean _equals = (_size == 0);
        if (_equals) {
          _xifexpression = Integer.MAX_VALUE;
        } else {
          _xifexpression = IterableExtensions.<DFS.Path>head(min_paths).length;
        }
        final int min_path_length = _xifexpression;
        final HashSet<DFS.Path> relevant_paths = CollectionLiterals.<DFS.Path>newHashSet();
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
            if (((length_to_next <= min_path_length) && 
              (length_to_next <= (min_distances.getOrDefault(next.getKey(), Integer.valueOf(Integer.MAX_VALUE))).intValue()))) {
              min_distances.put(next.getKey(), Integer.valueOf(length_to_next));
              boolean _isGoal = next.getKey().isGoal();
              if (_isGoal) {
                if ((length_to_next < min_path_length)) {
                  min_paths.clear();
                }
                DFS.Path _path = new DFS.Path(Path.this, next);
                min_paths.add(_path);
              } else {
                DFS.Path _path_1 = new DFS.Path(Path.this, next);
                relevant_paths.add(_path_1);
              }
            }
          }
        };
        IterableExtensions.<Pair<State, Integer>, Integer>sortBy(this.current.neighbours(), _function).forEach(_function_1);
        _xblockexpression = relevant_paths;
      }
      return _xblockexpression;
    }

    public void search(final Map<State, Integer> min_distances, final Collection<DFS.Path> min_paths) {
      final Consumer<DFS.Path> _function = new Consumer<DFS.Path>() {
        public void accept(final DFS.Path it) {
          it.search(min_distances, min_paths);
        }
      };
      this.branch(min_distances, min_paths).forEach(_function);
    }
  }

  private Map<State, Integer> min_distances;

  private Collection<DFS.Path> min_paths;

  private State initial;

  public DFS(final State _initial) {
    this.initialize(_initial);
  }

  public void run() {
    new DFS.Path(this.initial).search(this.min_distances, this.min_paths);
  }

  public State initialize(final State _initial) {
    State _xblockexpression = null;
    {
      this.min_distances = CollectionLiterals.<State, Integer>newHashMap();
      this.min_paths = CollectionLiterals.<DFS.Path>newHashSet();
      _xblockexpression = this.initial = _initial;
    }
    return _xblockexpression;
  }

  public Iterable<List<State>> all_min_paths() {
    final Function1<DFS.Path, List<State>> _function = new Function1<DFS.Path, List<State>>() {
      public List<State> apply(final DFS.Path it) {
        return it.path;
      }
    };
    return IterableExtensions.<DFS.Path, List<State>>map(this.min_paths, _function);
  }

  public int min_distance() {
    return IterableExtensions.<DFS.Path>head(this.min_paths).length;
  }
}
