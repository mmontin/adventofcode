package adventutils.advanced;

import adventutils.geometry.Coordinate;
import adventutils.geometry.CoordinateSet;
import com.google.common.collect.Iterables;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Map {
  public static Pair<CoordinateSet, Pair<CoordinateSet, CoordinateSet>> flow(final List<Coordinate> border) {
    Pair<CoordinateSet, Pair<CoordinateSet, CoordinateSet>> _xblockexpression = null;
    {
      int _size = border.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      CoordinateSet _coordinateSet = new CoordinateSet();
      final Function2<CoordinateSet, Integer, CoordinateSet> _function = new Function2<CoordinateSet, Integer, CoordinateSet>() {
        public CoordinateSet apply(final CoordinateSet set, final Integer i) {
          CoordinateSet _xblockexpression = null;
          {
            final Coordinate left = border.get((i).intValue());
            int _size = border.size();
            int _modulo = (((i).intValue() + 1) % _size);
            final Coordinate right = border.get(_modulo);
            set.addAll(Coordinate.getAllCoordsOnLine(left, right));
            _xblockexpression = set;
          }
          return _xblockexpression;
        }
      };
      final CoordinateSet border_set = IterableExtensions.<Integer, CoordinateSet>fold(_doubleDotLessThan, _coordinateSet, _function);
      final int minX = border_set.minX;
      final int maxX = border_set.maxX;
      final int minY = border_set.minY;
      final int maxY = border_set.maxY;
      Coordinate _coordinate = new Coordinate((minX - 1), (minY - 1));
      final HashSet<Coordinate> frontier = CollectionLiterals.<Coordinate>newHashSet(_coordinate);
      final HashSet<Coordinate> reached = new HashSet<Coordinate>(border_set);
      while ((!frontier.isEmpty())) {
        {
          final HashSet<Coordinate> tmp = new HashSet<Coordinate>(frontier);
          reached.addAll(frontier);
          frontier.clear();
          final Consumer<Coordinate> _function_1 = new Consumer<Coordinate>() {
            public void accept(final Coordinate it) {
              final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it_1) {
                  boolean _contains = reached.contains(it_1);
                  return Boolean.valueOf((!_contains));
                }
              };
              Iterables.<Coordinate>addAll(frontier, IterableExtensions.<Coordinate>filter(it.noDiagonalBoundedNeighbours((minX - 1), (maxX + 1), (minY - 1), (maxY + 1)), _function));
            }
          };
          tmp.forEach(_function_1);
        }
      }
      reached.removeAll(border_set);
      final Predicate<Coordinate> _function_1 = new Predicate<Coordinate>() {
        public boolean test(final Coordinate it) {
          return ((((it.getX() == (minX - 1)) || (it.getX() == (maxX + 1))) || (it.getY() == (minY - 1))) || (it.getY() == (maxY + 1)));
        }
      };
      reached.removeIf(_function_1);
      final CoordinateSet outside_set = new CoordinateSet(reached);
      outside_set.setBoundaries(minX, maxX, minY, maxY);
      final CoordinateSet inside_set = outside_set.invertSet();
      inside_set.removeAll(border_set);
      inside_set.setBoundaries(minX, maxX, minY, maxY);
      Pair<CoordinateSet, CoordinateSet> _mappedTo = Pair.<CoordinateSet, CoordinateSet>of(border_set, inside_set);
      _xblockexpression = Pair.<CoordinateSet, Pair<CoordinateSet, CoordinateSet>>of(outside_set, _mappedTo);
    }
    return _xblockexpression;
  }
}
