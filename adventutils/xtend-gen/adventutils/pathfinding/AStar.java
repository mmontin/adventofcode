package adventutils.pathfinding;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class AStar {
  private PriorityQueue<State> toVisit;

  public Map<State, Integer> gScore;

  private Map<State, Integer> fScore;

  private Map<State, State> previous;

  private State current;

  public AStar() {
    this.current = null;
  }

  public AStar(final State initial) {
    this.initialize(initial);
  }

  public Map<State, State> initialize(final State initial_) {
    Map<State, State> _xblockexpression = null;
    {
      final Comparator<State> _function = (State e1, State e2) -> {
        return Integer.compare((this.fScore.get(e1)).intValue(), (this.fScore.get(e2)).intValue());
      };
      PriorityQueue<State> _priorityQueue = new PriorityQueue<State>(_function);
      this.toVisit = _priorityQueue;
      this.current = initial_;
      this.gScore = CollectionLiterals.<State, Integer>newHashMap();
      this.gScore.put(this.current, Integer.valueOf(0));
      this.fScore = CollectionLiterals.<State, Integer>newHashMap();
      this.fScore.put(this.current, Integer.valueOf(this.current.minToGoal()));
      _xblockexpression = this.previous = CollectionLiterals.<State, State>newHashMap();
    }
    return _xblockexpression;
  }

  private State step() {
    State _xblockexpression = null;
    {
      final Consumer<Pair<? extends State, Integer>> _function = (Pair<? extends State, Integer> it) -> {
        final State state = it.getKey();
        Integer _get = this.gScore.get(this.current);
        Integer _value = it.getValue();
        final int newGScore = ((_get).intValue() + (_value).intValue());
        final Integer currentScore = this.gScore.get(state);
        if (((currentScore == null) || (newGScore < (currentScore).intValue()))) {
          this.previous.put(state, this.current);
          this.toVisit.remove(state);
          this.gScore.put(state, Integer.valueOf(newGScore));
          int _minToGoal = state.minToGoal();
          int _plus = (newGScore + _minToGoal);
          this.fScore.put(state, Integer.valueOf(_plus));
          this.toVisit.add(state);
        }
      };
      this.current.neighbours().forEach(_function);
      _xblockexpression = this.toVisit.poll();
    }
    return _xblockexpression;
  }

  public List<State> getMinPath() {
    List<State> _xblockexpression = null;
    {
      this.checkInitialize();
      final ArrayList<State> path = CollectionLiterals.<State>newArrayList(this.current);
      State tmp = this.current;
      while (this.previous.containsKey(tmp)) {
        {
          tmp = this.previous.get(tmp);
          path.add(tmp);
        }
      }
      _xblockexpression = ListExtensions.<State>reverse(path);
    }
    return _xblockexpression;
  }

  public Map<State, Integer> getValuations() {
    return this.gScore;
  }

  public Integer getMinDistance() {
    Integer _xblockexpression = null;
    {
      this.checkInitialize();
      _xblockexpression = this.gScore.get(this.current);
    }
    return _xblockexpression;
  }

  public AStar run() {
    AStar _xblockexpression = null;
    {
      this.checkInitialize();
      while ((!this.current.isGoal())) {
        {
          this.current = this.step();
          this.checkInitialize();
        }
      }
      _xblockexpression = this;
    }
    return _xblockexpression;
  }

  private void checkInitialize() {
    try {
      if ((this.current == null)) {
        throw new NotInitializedException();
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
