package advent2021.puzzle9;

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
  private Map<Coordinates, Integer> map;
  
  public Area(final List<List<Integer>> input) {
    this.map = CollectionLiterals.<Coordinates, Integer>newHashMap();
    int _size = input.size();
    int _minus = (_size - 1);
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer i) {
        int _size = input.get(0).size();
        int _minus = (_size - 1);
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer j) {
            Coordinates _coordinates = new Coordinates((i).intValue(), (j).intValue());
            Area.this.map.put(_coordinates, input.get((i).intValue()).get((j).intValue()));
          }
        };
        new IntegerRange(0, _minus).forEach(_function);
      }
    };
    new IntegerRange(0, _minus).forEach(_function);
  }
  
  public Iterable<Coordinates> neighbours(final Coordinates c) {
    final Function1<Coordinates, Boolean> _function = new Function1<Coordinates, Boolean>() {
      public Boolean apply(final Coordinates it) {
        return Boolean.valueOf(Area.this.map.containsKey(it));
      }
    };
    return IterableExtensions.<Coordinates>filter(c.neighbours(), _function);
  }
  
  public HashSet<Coordinates> lowPoints() {
    final Function2<HashSet<Coordinates>, Map.Entry<Coordinates, Integer>, HashSet<Coordinates>> _function = new Function2<HashSet<Coordinates>, Map.Entry<Coordinates, Integer>, HashSet<Coordinates>>() {
      public HashSet<Coordinates> apply(final HashSet<Coordinates> v, final Map.Entry<Coordinates, Integer> e) {
        HashSet<Coordinates> _xblockexpression = null;
        {
          Boolean _isLowPoint = Area.this.isLowPoint(e.getKey());
          if ((_isLowPoint).booleanValue()) {
            v.add(e.getKey());
          }
          _xblockexpression = v;
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Map.Entry<Coordinates, Integer>, HashSet<Coordinates>>fold(this.map.entrySet(), CollectionLiterals.<Coordinates>newHashSet(), _function);
  }
  
  public Boolean isLowPoint(final Coordinates c) {
    final Function2<Boolean, Coordinates, Boolean> _function = new Function2<Boolean, Coordinates, Boolean>() {
      public Boolean apply(final Boolean b, final Coordinates v) {
        return Boolean.valueOf(((b).booleanValue() && (Area.this.map.get(v).compareTo(Area.this.map.get(c)) > 0)));
      }
    };
    return IterableExtensions.<Coordinates, Boolean>fold(this.neighbours(c), Boolean.valueOf(true), _function);
  }
  
  public Integer get(final Coordinates c) {
    return this.map.get(c);
  }
  
  public Set<Coordinates> floodUp(final Set<Coordinates> coords) {
    HashSet<Coordinates> _hashSet = new HashSet<Coordinates>(coords);
    final Function2<HashSet<Coordinates>, Coordinates, HashSet<Coordinates>> _function = new Function2<HashSet<Coordinates>, Coordinates, HashSet<Coordinates>>() {
      public HashSet<Coordinates> apply(final HashSet<Coordinates> s, final Coordinates cs) {
        HashSet<Coordinates> _xblockexpression = null;
        {
          Iterables.<Coordinates>addAll(s, Area.this.neighbours(cs));
          _xblockexpression = s;
        }
        return _xblockexpression;
      }
    };
    final Function1<Coordinates, Boolean> _function_1 = new Function1<Coordinates, Boolean>() {
      public Boolean apply(final Coordinates it) {
        Integer _get = Area.this.get(it);
        return Boolean.valueOf(((_get).intValue() != 9));
      }
    };
    return IterableExtensions.<Coordinates>toSet(IterableExtensions.<Coordinates>filter(IterableExtensions.<Coordinates, HashSet<Coordinates>>fold(coords, _hashSet, _function), _function_1));
  }
  
  public int floodUpToMaximum(final Coordinates c) {
    int _xblockexpression = (int) 0;
    {
      Set<Coordinates> input = CollectionLiterals.<Coordinates>newHashSet(c);
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
