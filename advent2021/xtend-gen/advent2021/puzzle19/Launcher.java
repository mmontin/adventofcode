package advent2021.puzzle19;

import advent2021.Utils;
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
      map = data.get(0);
      data.remove(0);
      while ((data.size() != 1)) {
        {
          final HashMap<Integer, Coordinate> dist1 = Launcher.distances(map);
          int max = 0;
          int index = 0;
          Map<Integer, Coordinate> dist2 = null;
          Set<Integer> inters = null;
          int _size = data.size();
          ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
          for (final Integer i : _doubleDotLessThan) {
            {
              final HashMap<Integer, Coordinate> dist_tmp = Launcher.distances(data.get((i).intValue()));
              Set<Integer> _keySet = dist1.keySet();
              final HashSet<Integer> dist_dup = new HashSet<Integer>(_keySet);
              dist_dup.retainAll(dist_tmp.keySet());
              int _size_1 = dist_dup.size();
              boolean _greaterThan = (_size_1 > max);
              if (_greaterThan) {
                max = dist_dup.size();
                index = (i).intValue();
                dist2 = dist_tmp;
                inters = dist_dup;
              }
            }
          }
          dist1.keySet().retainAll(inters);
          dist2.keySet().retainAll(inters);
          int _size_1 = map.size();
          int _size_2 = data.get(index).size();
          final int y = (_size_1 + _size_2);
          map = Launcher.collapse(map, dist1, data.get(index), dist2);
          int _size_3 = map.size();
          int _minus = (y - _size_3);
          InputOutput.<Integer>println(Integer.valueOf(_minus));
          InputOutput.<String>println("----------------");
          data.remove(index);
        }
      }
      InputOutput.<Integer>println(Integer.valueOf(map.size()));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static List<Vector> collapse(final List<Vector> vectors1, final HashMap<Integer, Coordinate> dists1, final List<Vector> vectors2, final Map<Integer, Coordinate> dists2) {
    List<Vector> _xblockexpression = null;
    {
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
      dists1.entrySet().forEach(_function);
      final Map.Entry<Integer, Set<Integer>> e1 = ((Map.Entry<Integer, Set<Integer>>[])Conversions.unwrapArray(mapping.entrySet(), Map.Entry.class))[0];
      final Map.Entry<Integer, Set<Integer>> e2 = ((Map.Entry<Integer, Set<Integer>>[])Conversions.unwrapArray(mapping.entrySet(), Map.Entry.class))[1];
      final Vector v11 = vectors1.get((e1.getKey()).intValue());
      final Vector v12 = vectors1.get((e2.getKey()).intValue());
      final Vector v11tov12 = v11.to(v12);
      final Vector v21 = vectors2.get((IterableExtensions.<Integer>toList(e1.getValue()).get(0)).intValue());
      final Vector v22 = vectors2.get((IterableExtensions.<Integer>toList(e2.getValue()).get(0)).intValue());
      final Vector v21tov22 = v21.to(v22);
      final Matrix transformation = new Matrix(v21tov22, v11tov12);
      final Consumer<Vector> _function_1 = new Consumer<Vector>() {
        public void accept(final Vector it) {
          it.multiplyBy(transformation);
        }
      };
      vectors2.forEach(_function_1);
      final Vector translation = v21.to(v11);
      final Consumer<Vector> _function_2 = new Consumer<Vector>() {
        public void accept(final Vector it) {
          it.add(translation);
        }
      };
      vectors2.forEach(_function_2);
      final HashSet<Vector> output = new HashSet<Vector>(vectors1);
      output.addAll(vectors2);
      _xblockexpression = IterableExtensions.<Vector>toList(output);
    }
    return _xblockexpression;
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
