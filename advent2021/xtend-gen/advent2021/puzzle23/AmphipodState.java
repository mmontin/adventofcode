package advent2021.puzzle23;

import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class AmphipodState implements State {
  private static final Coordinate hallway0 = new Coordinate(0, 0);
  
  private static final Coordinate hallway1 = new Coordinate(0, 1);
  
  private static final Coordinate hallway3 = new Coordinate(0, 3);
  
  private static final Coordinate hallway5 = new Coordinate(0, 5);
  
  private static final Coordinate hallway7 = new Coordinate(0, 7);
  
  private static final Coordinate hallway9 = new Coordinate(0, 9);
  
  private static final Coordinate hallway10 = new Coordinate(0, 10);
  
  private static final Coordinate room12 = new Coordinate(1, 2);
  
  private static final Coordinate room22 = new Coordinate(2, 2);
  
  private static final Coordinate room14 = new Coordinate(1, 4);
  
  private static final Coordinate room24 = new Coordinate(2, 4);
  
  private static final Coordinate room16 = new Coordinate(1, 6);
  
  private static final Coordinate room26 = new Coordinate(2, 6);
  
  private static final Coordinate room18 = new Coordinate(1, 8);
  
  private static final Coordinate room28 = new Coordinate(2, 8);
  
  private static final Set<Coordinate> hallway = CollectionLiterals.<Coordinate>newHashSet(
    AmphipodState.hallway0, AmphipodState.hallway1, AmphipodState.hallway3, AmphipodState.hallway5, AmphipodState.hallway7, AmphipodState.hallway9, AmphipodState.hallway10);
  
  private static final Set<Coordinate> rooms = CollectionLiterals.<Coordinate>newHashSet(
    AmphipodState.room12, AmphipodState.room22, AmphipodState.room14, AmphipodState.room24, AmphipodState.room16, AmphipodState.room26, AmphipodState.room18, AmphipodState.room28);
  
  private static final Set<Coordinate> all = new Function0<Set<Coordinate>>() {
    public Set<Coordinate> apply() {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final HashSet<Coordinate> output = new HashSet<Coordinate>(AmphipodState.hallway);
        output.addAll(AmphipodState.rooms);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();
  
  private final Map<Coordinate, Integer> amphipods;
  
  public AmphipodState() {
    Pair<Coordinate, Integer> _mappedTo = Pair.<Coordinate, Integer>of(AmphipodState.hallway0, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_1 = Pair.<Coordinate, Integer>of(AmphipodState.hallway1, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_2 = Pair.<Coordinate, Integer>of(AmphipodState.hallway3, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_3 = Pair.<Coordinate, Integer>of(AmphipodState.hallway5, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_4 = Pair.<Coordinate, Integer>of(AmphipodState.hallway7, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_5 = Pair.<Coordinate, Integer>of(AmphipodState.hallway9, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_6 = Pair.<Coordinate, Integer>of(AmphipodState.hallway10, Integer.valueOf(0));
    Pair<Coordinate, Integer> _mappedTo_7 = Pair.<Coordinate, Integer>of(AmphipodState.room12, Integer.valueOf(6));
    Pair<Coordinate, Integer> _mappedTo_8 = Pair.<Coordinate, Integer>of(AmphipodState.room22, Integer.valueOf(8));
    Pair<Coordinate, Integer> _mappedTo_9 = Pair.<Coordinate, Integer>of(AmphipodState.room14, Integer.valueOf(2));
    Pair<Coordinate, Integer> _mappedTo_10 = Pair.<Coordinate, Integer>of(AmphipodState.room24, Integer.valueOf(6));
    Pair<Coordinate, Integer> _mappedTo_11 = Pair.<Coordinate, Integer>of(AmphipodState.room16, Integer.valueOf(4));
    Pair<Coordinate, Integer> _mappedTo_12 = Pair.<Coordinate, Integer>of(AmphipodState.room26, Integer.valueOf(2));
    Pair<Coordinate, Integer> _mappedTo_13 = Pair.<Coordinate, Integer>of(AmphipodState.room18, Integer.valueOf(8));
    Pair<Coordinate, Integer> _mappedTo_14 = Pair.<Coordinate, Integer>of(AmphipodState.room28, Integer.valueOf(4));
    this.amphipods = CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo, _mappedTo_1, _mappedTo_2, _mappedTo_3, _mappedTo_4, _mappedTo_5, _mappedTo_6, _mappedTo_7, _mappedTo_8, _mappedTo_9, _mappedTo_10, _mappedTo_11, _mappedTo_12, _mappedTo_13, _mappedTo_14);
  }
  
  public boolean isGoal() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public int minToGoal() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public List<Pair<State, Integer>> neighbours() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public boolean equals(final Object other) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  public int hashCode() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
