package advent2021.puzzle8;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

import com.google.common.base.Objects;

@SuppressWarnings("all")
public class Decoder {
  private static final List<Set<Line>> numbers = CollectionLiterals.<Set<Line>>newArrayList(
    CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.C, Line.E, Line.F, Line.G), 
    CollectionLiterals.<Line>newHashSet(Line.C, Line.F), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.C, Line.D, Line.E, Line.G), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.C, Line.D, Line.F, Line.G), 
    CollectionLiterals.<Line>newHashSet(Line.B, Line.C, Line.D, Line.F), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.D, Line.F, Line.G), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.D, Line.E, Line.F, Line.G), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.C, Line.F), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.C, Line.D, Line.E, Line.F, Line.G), 
    CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.C, Line.D, Line.F, Line.G));

  private static final Map<Line, ArrayList<Integer>> map = Decoder.listToMap(Decoder.numbers);

  private List<Set<Line>> data;

  private List<Set<Line>> goal;

  private Map<Line, ArrayList<Integer>> dataRev;

  public Decoder(final String line) {
    final String[] split = line.split(" \\| ");
    final Function1<String, Set<Line>> _function = new Function1<String, Set<Line>>() {
      public Set<Line> apply(final String it) {
        return Decoder.fromString(it);
      }
    };
    this.data = CollectionLiterals.<Set<Line>>newArrayList(((Set<Line>[])Conversions.unwrapArray(ListExtensions.<String, Set<Line>>map(((List<String>)Conversions.doWrapArray((split[0]).split(" "))), _function), Set.class)));
    final Function1<String, Set<Line>> _function_1 = new Function1<String, Set<Line>>() {
      public Set<Line> apply(final String it) {
        return Decoder.fromString(it);
      }
    };
    this.goal = CollectionLiterals.<Set<Line>>newArrayList(((Set<Line>[])Conversions.unwrapArray(ListExtensions.<String, Set<Line>>map(((List<String>)Conversions.doWrapArray((split[1]).split(" "))), _function_1), Set.class)));
    this.dataRev = Decoder.listToMap(this.data);
  }

  public int decode1() {
    final Function1<Set<Line>, Integer> _function = new Function1<Set<Line>, Integer>() {
      public Integer apply(final Set<Line> it) {
        return Integer.valueOf(((Object[])Conversions.unwrapArray(it, Object.class)).length);
      }
    };
    final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer v, final Integer s) {
        Integer _xifexpression = null;
        if ((((((s).intValue() == 2) || ((s).intValue() == 3)) || ((s).intValue() == 4)) || ((s).intValue() == 7))) {
          _xifexpression = Integer.valueOf(((v).intValue() + 1));
        } else {
          _xifexpression = v;
        }
        return _xifexpression;
      }
    };
    return (int) IterableExtensions.<Integer, Integer>fold(ListExtensions.<Set<Line>, Integer>map(this.goal, _function), Integer.valueOf(0), _function_1);
  }

  public double decode2() {
    double _xblockexpression = (double) 0;
    {
      final HashMap<Line, Set<Line>> decoded = new HashMap<Line, Set<Line>>();
      final Consumer<Map.Entry<Line, ArrayList<Integer>>> _function = new Consumer<Map.Entry<Line, ArrayList<Integer>>>() {
        public void accept(final Map.Entry<Line, ArrayList<Integer>> e1) {
          final Consumer<Map.Entry<Line, ArrayList<Integer>>> _function = new Consumer<Map.Entry<Line, ArrayList<Integer>>>() {
            public void accept(final Map.Entry<Line, ArrayList<Integer>> e2) {
              int _size = e1.getValue().size();
              int _size_1 = e2.getValue().size();
              boolean _equals = (_size == _size_1);
              if (_equals) {
                final BiFunction<Set<Line>, Set<Line>, Set<Line>> _function = new BiFunction<Set<Line>, Set<Line>, Set<Line>>() {
                  public Set<Line> apply(final Set<Line> v, final Set<Line> w) {
                    Set<Line> _xblockexpression = null;
                    {
                      v.addAll(w);
                      _xblockexpression = v;
                    }
                    return _xblockexpression;
                  }
                };
                decoded.merge(e1.getKey(), CollectionLiterals.<Line>newHashSet(e2.getKey()), _function);
              }
            }
          };
          Decoder.this.dataRev.entrySet().forEach(_function);
        }
      };
      Decoder.map.entrySet().forEach(_function);
      final Consumer<Integer> _function_1 = new Consumer<Integer>() {
        public void accept(final Integer i) {
          final Function1<Set<Line>, Boolean> _function = new Function1<Set<Line>, Boolean>() {
            public Boolean apply(final Set<Line> s) {
              int _size = s.size();
              return Boolean.valueOf((_size == (i).intValue()));
            }
          };
          final Consumer<Line> _function_1 = new Consumer<Line>() {
            public void accept(final Line e) {
              final Function1<Set<Line>, Boolean> _function = new Function1<Set<Line>, Boolean>() {
                public Boolean apply(final Set<Line> s) {
                  int _size = s.size();
                  return Boolean.valueOf((_size == (i).intValue()));
                }
              };
              decoded.get(e).retainAll(((Collection<?>[])Conversions.unwrapArray(IterableExtensions.<Set<Line>>filter(Decoder.this.data, _function), Collection.class))[0]);
            }
          };
          (((Set<Line>[])Conversions.unwrapArray(IterableExtensions.<Set<Line>>filter(Decoder.numbers, _function), Set.class))[0]).forEach(_function_1);
        }
      };
      CollectionLiterals.<Integer>newArrayList(Integer.valueOf(2), Integer.valueOf(3), Integer.valueOf(4), Integer.valueOf(7)).forEach(_function_1);
      final Function2<HashSet<Line>, Map.Entry<Line, Set<Line>>, HashSet<Line>> _function_2 = new Function2<HashSet<Line>, Map.Entry<Line, Set<Line>>, HashSet<Line>>() {
        public HashSet<Line> apply(final HashSet<Line> s, final Map.Entry<Line, Set<Line>> e) {
          HashSet<Line> _xblockexpression = null;
          {
            int _size = e.getValue().size();
            boolean _equals = (_size == 1);
            if (_equals) {
              s.addAll(e.getValue());
            }
            _xblockexpression = s;
          }
          return _xblockexpression;
        }
      };
      final HashSet<Line> singletons = IterableExtensions.<Map.Entry<Line, Set<Line>>, HashSet<Line>>fold(decoded.entrySet(), CollectionLiterals.<Line>newHashSet(), _function_2);
      final Function1<Set<Line>, Boolean> _function_3 = new Function1<Set<Line>, Boolean>() {
        public Boolean apply(final Set<Line> s) {
          int _size = s.size();
          return Boolean.valueOf((_size > 1));
        }
      };
      final Consumer<Set<Line>> _function_4 = new Consumer<Set<Line>>() {
        public void accept(final Set<Line> s) {
          s.removeAll(singletons);
        }
      };
      IterableExtensions.<Set<Line>>filter(decoded.values(), _function_3).forEach(_function_4);
      Set<Map.Entry<Line, Set<Line>>> _entrySet = decoded.entrySet();
      HashMap<Line, Line> _hashMap = new HashMap<Line, Line>();
      final Function2<HashMap<Line, Line>, Map.Entry<Line, Set<Line>>, HashMap<Line, Line>> _function_5 = new Function2<HashMap<Line, Line>, Map.Entry<Line, Set<Line>>, HashMap<Line, Line>>() {
        public HashMap<Line, Line> apply(final HashMap<Line, Line> m, final Map.Entry<Line, Set<Line>> e) {
          HashMap<Line, Line> _xblockexpression = null;
          {
            m.put(((Line[])Conversions.unwrapArray(e.getValue(), Line.class))[0], e.getKey());
            _xblockexpression = m;
          }
          return _xblockexpression;
        }
      };
      final HashMap<Line, Line> rev = IterableExtensions.<Map.Entry<Line, Set<Line>>, HashMap<Line, Line>>fold(_entrySet, _hashMap, _function_5);
      double ans = 0;
      int _size = this.goal.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          int _size_1 = this.goal.size();
          int _minus = (_size_1 - 1);
          int _minus_1 = (_minus - (i).intValue());
          final Function1<Line, Line> _function_6 = new Function1<Line, Line>() {
            public Line apply(final Line line) {
              return rev.get(line);
            }
          };
          int rank = Decoder.numbers.indexOf(IterableExtensions.<Line>toSet(IterableExtensions.<Line, Line>map(this.goal.get(_minus_1), _function_6)));
          double _ans = ans;
          double _pow = Math.pow(10, (i).intValue());
          double _multiply = (_pow * rank);
          ans = (_ans + _multiply);
        }
      }
      _xblockexpression = ans;
    }
    return _xblockexpression;
  }

  public static Set<Line> fromString(final String s) {
    final Function1<Character, Line> _function = new Function1<Character, Line>() {
      public Line apply(final Character c) {
        Line _switchResult = null;
        String _plus = (c + "");
        boolean _matched = false;
        if (Objects.equal(_plus, "a")) {
          _matched=true;
          _switchResult = Line.A;
        }
        if (!_matched) {
          if (Objects.equal(_plus, "b")) {
            _matched=true;
            _switchResult = Line.B;
          }
        }
        if (!_matched) {
          if (Objects.equal(_plus, "c")) {
            _matched=true;
            _switchResult = Line.C;
          }
        }
        if (!_matched) {
          if (Objects.equal(_plus, "d")) {
            _matched=true;
            _switchResult = Line.D;
          }
        }
        if (!_matched) {
          if (Objects.equal(_plus, "e")) {
            _matched=true;
            _switchResult = Line.E;
          }
        }
        if (!_matched) {
          if (Objects.equal(_plus, "f")) {
            _matched=true;
            _switchResult = Line.F;
          }
        }
        if (!_matched) {
          _switchResult = Line.G;
        }
        return _switchResult;
      }
    };
    return CollectionLiterals.<Line>newHashSet(((Line[])Conversions.unwrapArray(ListExtensions.<Character, Line>map(((List<Character>)Conversions.doWrapArray(s.toCharArray())), _function), Line.class)));
  }

  public static HashMap<Line, ArrayList<Integer>> listToMap(final List<Set<Line>> list) {
    HashMap<Line, ArrayList<Integer>> _hashMap = new HashMap<Line, ArrayList<Integer>>();
    final Function2<HashMap<Line, ArrayList<Integer>>, Line, HashMap<Line, ArrayList<Integer>>> _function = new Function2<HashMap<Line, ArrayList<Integer>>, Line, HashMap<Line, ArrayList<Integer>>>() {
      public HashMap<Line, ArrayList<Integer>> apply(final HashMap<Line, ArrayList<Integer>> m, final Line v) {
        HashMap<Line, ArrayList<Integer>> _xblockexpression = null;
        {
          int _size = list.size();
          ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
          ArrayList<Integer> _arrayList = new ArrayList<Integer>();
          final Function2<ArrayList<Integer>, Integer, ArrayList<Integer>> _function = new Function2<ArrayList<Integer>, Integer, ArrayList<Integer>>() {
            public ArrayList<Integer> apply(final ArrayList<Integer> l, final Integer i) {
              ArrayList<Integer> _xblockexpression = null;
              {
                boolean _contains = list.get((i).intValue()).contains(v);
                if (_contains) {
                  l.add(i);
                }
                _xblockexpression = l;
              }
              return _xblockexpression;
            }
          };
          m.put(v, IterableExtensions.<Integer, ArrayList<Integer>>fold(_doubleDotLessThan, _arrayList, _function));
          _xblockexpression = m;
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Line, HashMap<Line, ArrayList<Integer>>>fold(CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.C, Line.D, Line.E, Line.F, Line.G), _hashMap, _function);
  }
}
