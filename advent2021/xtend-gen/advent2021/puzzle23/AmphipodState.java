package advent2021.puzzle23;

import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import java.util.List;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class AmphipodState implements State {
  private static final Set<Coordinate> admissibleCoordinates = CollectionLiterals.<Coordinate>newHashSet(
    new Coordinate(0, 0), 
    new Coordinate(0, 1), 
    new Coordinate(0, 3), 
    new Coordinate(0, 5), 
    new Coordinate(0, 7), 
    new Coordinate(0, 9), 
    new Coordinate(0, 10), 
    new Coordinate(1, 2), 
    new Coordinate(2, 2), 
    new Coordinate(1, 4), 
    new Coordinate(2, 4), 
    new Coordinate(1, 6), 
    new Coordinate(2, 6), 
    new Coordinate(1, 8), 
    new Coordinate(2, 8));
  
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
