package adventutils.astar;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class AStar {
  private PriorityQueue<State> toVisit;
  
  private Map<State, Integer> gScore;
  
  private Map<State, Integer> fScore;
  
  private Map<State, State> previous;
  
  private State current;
  
  public AStar(final State initial_) {
    final Comparator<State> _function = new Comparator<State>() {
      public int compare(final State e1, final State e2) {
        return Integer.compare((AStar.this.fScore.get(e1)).intValue(), (AStar.this.fScore.get(e2)).intValue());
      }
    };
    PriorityQueue<State> _priorityQueue = new PriorityQueue<State>(_function);
    this.toVisit = _priorityQueue;
    this.current = initial_;
    this.gScore = CollectionLiterals.<State, Integer>newHashMap();
    this.gScore.put(this.current, Integer.valueOf(0));
    this.fScore = CollectionLiterals.<State, Integer>newHashMap();
    this.fScore.put(this.current, Integer.valueOf(this.current.minToGoal()));
    this.previous = CollectionLiterals.<State, State>newHashMap();
  }
  
  private void step() {
    final Consumer<Pair<State, Integer>> _function = new Consumer<Pair<State, Integer>>() {
      public void accept(final Pair<State, Integer> it) {
        final State state = it.getKey();
        Integer _get = AStar.this.gScore.get(AStar.this.current);
        Integer _value = it.getValue();
        final int newGScore = ((_get).intValue() + (_value).intValue());
        final Integer currentScore = AStar.this.gScore.get(state);
        if (((currentScore == null) || (newGScore < (currentScore).intValue()))) {
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
  }
  
  public List<State> minPath() {
    List<State> _xblockexpression = null;
    {
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
    return this.gScore.get(this.current);
  }
  
  public AStar run() {
    AStar _xblockexpression = null;
    {
      while ((!this.current.isGoal())) {
        {
          this.step();
          this.current = this.toVisit.poll();
        }
      }
      _xblockexpression = this;
    }
    return _xblockexpression;
  }
}
