package advent2021.puzzle9;

import adventutils.geometry.Coordinate;
import com.google.common.collect.Iterables;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Area {
  private Map<Coordinate, Integer> map;

  public Area(final List<List<Integer>> input) {
    this.map = CollectionLiterals.<Coordinate, Integer>newHashMap();
    int _size = input.size();
    int _minus = (_size - 1);
    final Consumer<Integer> _function = (Integer i) -> {
      int _size_1 = input.get(0).size();
      int _minus_1 = (_size_1 - 1);
      final Consumer<Integer> _function_1 = (Integer j) -> {
        Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
        this.map.put(_coordinate, input.get((i).intValue()).get((j).intValue()));
      };
      new IntegerRange(0, _minus_1).forEach(_function_1);
    };
    new IntegerRange(0, _minus).forEach(_function);
  }

  public Iterable<Coordinate> neighbours(final Coordinate c) {
    final Function1<Coordinate, Boolean> _function = (Coordinate it) -> {
      return Boolean.valueOf(this.map.containsKey(it));
    };
    return IterableExtensions.<Coordinate>filter(c.noDiagonalUnboundedNeighbours(), _function);
  }

  public HashSet<Coordinate> lowPoints() {
    final Function2<HashSet<Coordinate>, Map.Entry<Coordinate, Integer>, HashSet<Coordinate>> _function = (HashSet<Coordinate> v, Map.Entry<Coordinate, Integer> e) -> {
      HashSet<Coordinate> _xblockexpression = null;
      {
        Boolean _isLowPoint = this.isLowPoint(e.getKey());
        if ((_isLowPoint).booleanValue()) {
          v.add(e.getKey());
        }
        _xblockexpression = v;
      }
      return _xblockexpression;
    };
    return IterableExtensions.<Map.Entry<Coordinate, Integer>, HashSet<Coordinate>>fold(this.map.entrySet(), CollectionLiterals.<Coordinate>newHashSet(), _function);
  }

  public Boolean isLowPoint(final Coordinate c) {
    final Function2<Boolean, Coordinate, Boolean> _function = (Boolean b, Coordinate v) -> {
      return Boolean.valueOf(((b).booleanValue() && (this.map.get(v).compareTo(this.map.get(c)) > 0)));
    };
    return IterableExtensions.<Coordinate, Boolean>fold(this.neighbours(c), Boolean.valueOf(true), _function);
  }

  public Integer get(final Coordinate c) {
    return this.map.get(c);
  }

  public Set<Coordinate> floodUp(final Set<Coordinate> coords) {
    HashSet<Coordinate> _hashSet = new HashSet<Coordinate>(coords);
    final Function2<HashSet<Coordinate>, Coordinate, HashSet<Coordinate>> _function = (HashSet<Coordinate> s, Coordinate cs) -> {
      HashSet<Coordinate> _xblockexpression = null;
      {
        Iterables.<Coordinate>addAll(s, this.neighbours(cs));
        _xblockexpression = s;
      }
      return _xblockexpression;
    };
    final Function1<Coordinate, Boolean> _function_1 = (Coordinate it) -> {
      Integer _get = this.get(it);
      return Boolean.valueOf(((_get).intValue() != 9));
    };
    return IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate>filter(IterableExtensions.<Coordinate, HashSet<Coordinate>>fold(coords, _hashSet, _function), _function_1));
  }

  public int floodUpToMaximum(final Coordinate c) {
    int _xblockexpression = (int) 0;
    {
      Set<Coordinate> input = CollectionLiterals.<Coordinate>newHashSet(c);
      int previousSize = 1;
      int size = 0;
      while ((size != previousSize)) {
        {
          previousSize = input.size();
          input = this.floodUp(input);
          size = input.size();
        }
      }
      _xblockexpression = size;
    }
    return _xblockexpression;
  }
}
