package advent2021.puzzle19;

import advent2021.Utils;
import com.google.common.base.Objects;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    try {
      final ArrayList<List<Vector>> data = CollectionLiterals.<List<Vector>>newArrayList();
      final BufferedReader inputReader = Utils.getInputReader(19);
      String tmp_string = null;
      List<Vector> map = null;
      while (((tmp_string = inputReader.readLine()) != null)) {
        boolean _contains = tmp_string.contains("scanner");
        if (_contains) {
          map = CollectionLiterals.<Vector>newArrayList();
        } else {
          boolean _isEmpty = tmp_string.isEmpty();
          if (_isEmpty) {
            data.add(map);
          } else {
            Vector _vector = new Vector(tmp_string);
            map.add(_vector);
          }
        }
      }
      final Function2<ArrayList<HashMap<Integer, Coordinate>>, List<Vector>, ArrayList<HashMap<Integer, Coordinate>>> _function = new Function2<ArrayList<HashMap<Integer, Coordinate>>, List<Vector>, ArrayList<HashMap<Integer, Coordinate>>>() {
        public ArrayList<HashMap<Integer, Coordinate>> apply(final ArrayList<HashMap<Integer, Coordinate>> l, final List<Vector> vectors) {
          ArrayList<HashMap<Integer, Coordinate>> _xblockexpression = null;
          {
            l.add(Launcher.distances(vectors));
            _xblockexpression = l;
          }
          return _xblockexpression;
        }
      };
      final ArrayList<HashMap<Integer, Coordinate>> data_distances = IterableExtensions.<List<Vector>, ArrayList<HashMap<Integer, Coordinate>>>fold(data, CollectionLiterals.<HashMap<Integer, Coordinate>>newArrayList(), _function);
      int _size = data_distances.size();
      final Function2<HashMap<Integer, HashSet<Integer>>, Integer, HashMap<Integer, HashSet<Integer>>> _function_1 = new Function2<HashMap<Integer, HashSet<Integer>>, Integer, HashMap<Integer, HashSet<Integer>>>() {
        public HashMap<Integer, HashSet<Integer>> apply(final HashMap<Integer, HashSet<Integer>> m, final Integer i) {
          int _size = data_distances.size();
          final Function2<HashMap<Integer, HashSet<Integer>>, Integer, HashMap<Integer, HashSet<Integer>>> _function = new Function2<HashMap<Integer, HashSet<Integer>>, Integer, HashMap<Integer, HashSet<Integer>>>() {
            public HashMap<Integer, HashSet<Integer>> apply(final HashMap<Integer, HashSet<Integer>> m2, final Integer j) {
              HashMap<Integer, HashSet<Integer>> _xblockexpression = null;
              {
                HashMap<Integer, Coordinate> _get = data_distances.get((i).intValue());
                final HashMap<Integer, Coordinate> newm = new HashMap<Integer, Coordinate>(_get);
                newm.keySet().retainAll(data_distances.get((j).intValue()).keySet());
                if (((newm.size() >= 66) && (!Objects.equal(i, j)))) {
                  final BiFunction<HashSet<Integer>, HashSet<Integer>, HashSet<Integer>> _function = new BiFunction<HashSet<Integer>, HashSet<Integer>, HashSet<Integer>>() {
                    public HashSet<Integer> apply(final HashSet<Integer> r, final HashSet<Integer> s) {
                      HashSet<Integer> _xblockexpression = null;
                      {
                        r.addAll(s);
                        _xblockexpression = r;
                      }
                      return _xblockexpression;
                    }
                  };
                  m2.merge(i, CollectionLiterals.<Integer>newHashSet(j), _function);
                }
                _xblockexpression = m2;
              }
              return _xblockexpression;
            }
          };
          return IterableExtensions.<Integer, HashMap<Integer, HashSet<Integer>>>fold(new ExclusiveRange(0, _size, true), m, _function);
        }
      };
      final HashMap<Integer, HashSet<Integer>> adjacency = IterableExtensions.<Integer, HashMap<Integer, HashSet<Integer>>>fold(new ExclusiveRange(0, _size, true), CollectionLiterals.<Integer, HashSet<Integer>>newHashMap(), _function_1);
      InputOutput.<HashMap<Integer, HashSet<Integer>>>println(adjacency);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static void collapse(final List<Vector> vectors1, final HashMap<Integer, Coordinate> dists1, final List<Vector> vectors2, final Map<Integer, Coordinate> dists2) {
    final HashMap<Integer, Coordinate> dists1_dup = new HashMap<Integer, Coordinate>(dists1);
    dists1_dup.keySet().retainAll(dists2.keySet());
    final HashMap<Integer, Set<Integer>> mapping = CollectionLiterals.<Integer, Set<Integer>>newHashMap();
    final Consumer<Map.Entry<Integer, Coordinate>> _function = new Consumer<Map.Entry<Integer, Coordinate>>() {
      public void accept(final Map.Entry<Integer, Coordinate> it) {
        final Coordinate coord1 = it.getValue();
        final Coordinate coord2 = dists2.get(it.getKey());
        final BiFunction<Set<Integer>, Set<Integer>, Set<Integer>> _function = new BiFunction<Set<Integer>, Set<Integer>, Set<Integer>>() {
          public Set<Integer> apply(final Set<Integer> s1, final Set<Integer> s2) {
            HashSet<Integer> _xblockexpression = null;
            {
              final HashSet<Integer> s3 = new HashSet<Integer>(s2);
              s3.retainAll(s1);
              _xblockexpression = s3;
            }
            return _xblockexpression;
          }
        };
        mapping.merge(Integer.valueOf(coord1.x), Collections.<Integer>unmodifiableSet(CollectionLiterals.<Integer>newHashSet(Integer.valueOf(coord2.x), Integer.valueOf(coord2.y))), _function);
        final BiFunction<Set<Integer>, Set<Integer>, Set<Integer>> _function_1 = new BiFunction<Set<Integer>, Set<Integer>, Set<Integer>>() {
          public Set<Integer> apply(final Set<Integer> s1, final Set<Integer> s2) {
            HashSet<Integer> _xblockexpression = null;
            {
              final HashSet<Integer> s3 = new HashSet<Integer>(s2);
              s3.retainAll(s1);
              _xblockexpression = s3;
            }
            return _xblockexpression;
          }
        };
        mapping.merge(Integer.valueOf(coord1.y), Collections.<Integer>unmodifiableSet(CollectionLiterals.<Integer>newHashSet(Integer.valueOf(coord2.x), Integer.valueOf(coord2.y))), _function_1);
      }
    };
    dists1_dup.entrySet().forEach(_function);
    final Predicate<Integer> _function_1 = new Predicate<Integer>() {
      public boolean test(final Integer it) {
        int _size = mapping.get(it).size();
        return (_size != 1);
      }
    };
    mapping.keySet().removeIf(_function_1);
    final Map.Entry<Integer, Set<Integer>> e1 = ((Map.Entry<Integer, Set<Integer>>[])Conversions.unwrapArray(mapping.entrySet(), Map.Entry.class))[0];
    final Vector v11 = vectors1.get((e1.getKey()).intValue());
    final Vector v21 = vectors2.get((IterableExtensions.<Integer>toList(e1.getValue()).get(0)).intValue());
    int i = 1;
    Map.Entry<Integer, Set<Integer>> e2 = null;
    Vector v12 = null;
    Vector v22 = null;
    Vector v11tov12 = null;
    Vector v21tov22 = null;
    do {
      {
        Set<Map.Entry<Integer, Set<Integer>>> _entrySet = mapping.entrySet();
        int _plusPlus = i++;
        e2 = ((Map.Entry<Integer, Set<Integer>>[])Conversions.unwrapArray(_entrySet, Map.Entry.class))[_plusPlus];
        v12 = vectors1.get((e2.getKey()).intValue());
        v22 = vectors2.get((IterableExtensions.<Integer>toList(e2.getValue()).get(0)).intValue());
        v11tov12 = v11.to(v12);
        v21tov22 = v21.to(v22);
      }
    } while((((v11tov12.containsZ() || v11tov12.hasDuplicates()) || v21tov22.containsZ()) || v21tov22.hasDuplicates()));
    final Matrix rotation = new Matrix(v21tov22, v11tov12);
    final Consumer<Vector> _function_2 = new Consumer<Vector>() {
      public void accept(final Vector it) {
        it.multiplyBy(rotation);
      }
    };
    vectors2.forEach(_function_2);
    final Vector translation = v21.to(v11);
    final Consumer<Vector> _function_3 = new Consumer<Vector>() {
      public void accept(final Vector it) {
        it.add(translation);
      }
    };
    vectors2.forEach(_function_3);
  }
  
  public static HashMap<Integer, Coordinate> distances(final List<Vector> vectors) {
    int _size = vectors.size();
    final Function2<HashMap<Integer, Coordinate>, Integer, HashMap<Integer, Coordinate>> _function = new Function2<HashMap<Integer, Coordinate>, Integer, HashMap<Integer, Coordinate>>() {
      public HashMap<Integer, Coordinate> apply(final HashMap<Integer, Coordinate> s, final Integer i) {
        int _size = vectors.size();
        final Function2<HashMap<Integer, Coordinate>, Integer, HashMap<Integer, Coordinate>> _function = new Function2<HashMap<Integer, Coordinate>, Integer, HashMap<Integer, Coordinate>>() {
          public HashMap<Integer, Coordinate> apply(final HashMap<Integer, Coordinate> s1, final Integer j) {
            HashMap<Integer, Coordinate> _xblockexpression = null;
            {
              int _size2 = vectors.get((i).intValue()).to(vectors.get((j).intValue())).size2();
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              s1.put(Integer.valueOf(_size2), _coordinate);
              _xblockexpression = s1;
            }
            return _xblockexpression;
          }
        };
        return IterableExtensions.<Integer, HashMap<Integer, Coordinate>>fold(new ExclusiveRange(((i).intValue() + 1), _size, true), s, _function);
      }
    };
    return IterableExtensions.<Integer, HashMap<Integer, Coordinate>>fold(new ExclusiveRange(0, _size, true), CollectionLiterals.<Integer, Coordinate>newHashMap(), _function);
  }
}
