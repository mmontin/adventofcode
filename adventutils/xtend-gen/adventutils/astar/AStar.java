package adventutils.astar;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class AStar {
  private PriorityQueue<State> toVisit;

  private Map<State, Integer> gScore;

  private Map<State, Integer> fScore;

  private Map<State, State> previous;

  private Function2<Integer, Integer, Boolean> compare;

  private State current;

  public AStar() {
    this.current = null;
  }

  public AStar(final State initial_, final boolean isMin) {
    this.initialize(initial_, isMin);
  }

  public AStar(final State initial) {
    this(initial, true);
  }

  public Map<State, State> initialize(final State initial_, final boolean isMin) {
    Map<State, State> _xblockexpression = null;
    {
      final Comparator<State> _function = new Comparator<State>() {
        public int compare(final State e1, final State e2) {
          int _xifexpression = (int) 0;
          if (isMin) {
            _xifexpression = Integer.compare((AStar.this.fScore.get(e1)).intValue(), (AStar.this.fScore.get(e2)).intValue());
          } else {
            _xifexpression = Integer.compare((AStar.this.fScore.get(e2)).intValue(), (AStar.this.fScore.get(e1)).intValue());
          }
          return _xifexpression;
        }
      };
      PriorityQueue<State> _priorityQueue = new PriorityQueue<State>(_function);
      this.toVisit = _priorityQueue;
      Function2<Integer, Integer, Boolean> _xifexpression = null;
      if (isMin) {
        final Function2<Integer, Integer, Boolean> _function_1 = new Function2<Integer, Integer, Boolean>() {
          public Boolean apply(final Integer p, final Integer q) {
            return Boolean.valueOf((p.compareTo(q) < 0));
          }
        };
        _xifexpression = _function_1;
      } else {
        final Function2<Integer, Integer, Boolean> _function_2 = new Function2<Integer, Integer, Boolean>() {
          public Boolean apply(final Integer p, final Integer q) {
            return Boolean.valueOf((q.compareTo(p) < 0));
          }
        };
        _xifexpression = _function_2;
      }
      this.compare = _xifexpression;
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
      final Consumer<Pair<State, Integer>> _function = new Consumer<Pair<State, Integer>>() {
        public void accept(final Pair<State, Integer> it) {
          final State state = it.getKey();
          Integer _get = AStar.this.gScore.get(AStar.this.current);
          Integer _value = it.getValue();
          final int newGScore = ((_get).intValue() + (_value).intValue());
          final Integer currentScore = AStar.this.gScore.get(state);
          if (((currentScore == null) || (AStar.this.compare.apply(Integer.valueOf(newGScore), currentScore)).booleanValue())) {
            AStar.this.previous.put(state, AStar.this.current);
            AStar.this.toVisit.remove(state);
            AStar.this.gScore.put(state, Integer.valueOf(newGScore));
            int _minToGoal = state.minToGoal();
            int _plus = (newGScore + _minToGoal);
            AStar.this.fScore.put(state, Integer.valueOf(_plus));
            AStar.this.toVisit.add(state);
          }
        }
      };
      this.current.neighbours().forEach(_function);
      _xblockexpression = this.toVisit.poll();
    }
    return _xblockexpression;
  }

  public List<State> minPath() {
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
