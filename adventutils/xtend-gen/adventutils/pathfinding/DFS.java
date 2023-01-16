package adventutils.pathfinding;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class DFS {
  private Map<State, Integer> min_distances;

  private Collection<Path> min_paths;

  private State initial;

  public DFS(final State _initial) {
    this.initialize(_initial);
  }

  public DFS(final AStar computation) {
    final List<State> min_path = computation.getMinPath();
    final Integer min_distance = computation.getMinDistance();
    final Map<State, Integer> distances = computation.getValuations();
    int _length = ((Object[])Conversions.unwrapArray(min_path, Object.class)).length;
    boolean _greaterThan = (_length > 1);
    if (_greaterThan) {
      Path _path = new Path(min_path, min_distance);
      this.min_paths = CollectionLiterals.<Path>newHashSet(_path);
      this.initial = IterableExtensions.<State>head(min_path);
      HashMap<State, Integer> _hashMap = new HashMap<State, Integer>(distances);
      this.min_distances = _hashMap;
    } else {
      this.initialize(min_path.get(0));
    }
  }

  public DFS run() {
    DFS _xblockexpression = null;
    {
      new Path(this.initial).search(this.min_distances, this.min_paths);
      _xblockexpression = this;
    }
    return _xblockexpression;
  }

  public State initialize(final State _initial) {
    State _xblockexpression = null;
    {
      this.min_distances = CollectionLiterals.<State, Integer>newHashMap();
      this.min_paths = CollectionLiterals.<Path>newHashSet();
      _xblockexpression = this.initial = _initial;
    }
    return _xblockexpression;
  }

  public Collection<Path> all_min_paths() {
    return this.min_paths;
  }

  public int min_distance() {
    return IterableExtensions.<Path>head(this.min_paths).getLength();
  }
}
