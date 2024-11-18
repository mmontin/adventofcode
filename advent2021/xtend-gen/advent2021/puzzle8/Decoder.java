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
    final Function1<String, Set<Line>> _function = (String it) -> {
      return Decoder.fromString(it);
    };
    this.data = CollectionLiterals.<Set<Line>>newArrayList(((Set<Line>[])Conversions.unwrapArray(ListExtensions.<String, Set<Line>>map(((List<String>)Conversions.doWrapArray((split[0]).split(" "))), _function), Set.class)));
    final Function1<String, Set<Line>> _function_1 = (String it) -> {
      return Decoder.fromString(it);
    };
    this.goal = CollectionLiterals.<Set<Line>>newArrayList(((Set<Line>[])Conversions.unwrapArray(ListExtensions.<String, Set<Line>>map(((List<String>)Conversions.doWrapArray((split[1]).split(" "))), _function_1), Set.class)));
    this.dataRev = Decoder.listToMap(this.data);
  }

  public int decode1() {
    final Function1<Set<Line>, Integer> _function = (Set<Line> it) -> {
      return Integer.valueOf(((Object[])Conversions.unwrapArray(it, Object.class)).length);
    };
    final Function2<Integer, Integer, Integer> _function_1 = (Integer v, Integer s) -> {
      Integer _xifexpression = null;
      if ((((((s).intValue() == 2) || ((s).intValue() == 3)) || ((s).intValue() == 4)) || ((s).intValue() == 7))) {
        _xifexpression = Integer.valueOf(((v).intValue() + 1));
      } else {
        _xifexpression = v;
      }
      return _xifexpression;
    };
    return (int) IterableExtensions.<Integer, Integer>fold(ListExtensions.<Set<Line>, Integer>map(this.goal, _function), Integer.valueOf(0), _function_1);
  }

  public double decode2() {
    double _xblockexpression = (double) 0;
    {
      final HashMap<Line, Set<Line>> decoded = new HashMap<Line, Set<Line>>();
      final Consumer<Map.Entry<Line, ArrayList<Integer>>> _function = (Map.Entry<Line, ArrayList<Integer>> e1) -> {
        final Consumer<Map.Entry<Line, ArrayList<Integer>>> _function_1 = (Map.Entry<Line, ArrayList<Integer>> e2) -> {
          int _size = e1.getValue().size();
          int _size_1 = e2.getValue().size();
          boolean _equals = (_size == _size_1);
          if (_equals) {
            final BiFunction<Set<Line>, Set<Line>, Set<Line>> _function_2 = (Set<Line> v, Set<Line> w) -> {
              Set<Line> _xblockexpression_1 = null;
              {
                v.addAll(w);
                _xblockexpression_1 = v;
              }
              return _xblockexpression_1;
            };
            decoded.merge(e1.getKey(), CollectionLiterals.<Line>newHashSet(e2.getKey()), _function_2);
          }
        };
        this.dataRev.entrySet().forEach(_function_1);
      };
      Decoder.map.entrySet().forEach(_function);
      final Consumer<Integer> _function_1 = (Integer i) -> {
        final Function1<Set<Line>, Boolean> _function_2 = (Set<Line> s) -> {
          int _size = s.size();
          return Boolean.valueOf((_size == (i).intValue()));
        };
        final Consumer<Line> _function_3 = (Line e) -> {
          final Function1<Set<Line>, Boolean> _function_4 = (Set<Line> s) -> {
            int _size = s.size();
            return Boolean.valueOf((_size == (i).intValue()));
          };
          decoded.get(e).retainAll(((Collection<?>[])Conversions.unwrapArray(IterableExtensions.<Set<Line>>filter(this.data, _function_4), Collection.class))[0]);
        };
        (((Set<Line>[])Conversions.unwrapArray(IterableExtensions.<Set<Line>>filter(Decoder.numbers, _function_2), Set.class))[0]).forEach(_function_3);
      };
      CollectionLiterals.<Integer>newArrayList(Integer.valueOf(2), Integer.valueOf(3), Integer.valueOf(4), Integer.valueOf(7)).forEach(_function_1);
      final Function2<HashSet<Line>, Map.Entry<Line, Set<Line>>, HashSet<Line>> _function_2 = (HashSet<Line> s, Map.Entry<Line, Set<Line>> e) -> {
        HashSet<Line> _xblockexpression_1 = null;
        {
          int _size = e.getValue().size();
          boolean _equals = (_size == 1);
          if (_equals) {
            s.addAll(e.getValue());
          }
          _xblockexpression_1 = s;
        }
        return _xblockexpression_1;
      };
      final HashSet<Line> singletons = IterableExtensions.<Map.Entry<Line, Set<Line>>, HashSet<Line>>fold(decoded.entrySet(), CollectionLiterals.<Line>newHashSet(), _function_2);
      final Function1<Set<Line>, Boolean> _function_3 = (Set<Line> s) -> {
        int _size = s.size();
        return Boolean.valueOf((_size > 1));
      };
      final Consumer<Set<Line>> _function_4 = (Set<Line> s) -> {
        s.removeAll(singletons);
      };
      IterableExtensions.<Set<Line>>filter(decoded.values(), _function_3).forEach(_function_4);
      Set<Map.Entry<Line, Set<Line>>> _entrySet = decoded.entrySet();
      HashMap<Line, Line> _hashMap = new HashMap<Line, Line>();
      final Function2<HashMap<Line, Line>, Map.Entry<Line, Set<Line>>, HashMap<Line, Line>> _function_5 = (HashMap<Line, Line> m, Map.Entry<Line, Set<Line>> e) -> {
        HashMap<Line, Line> _xblockexpression_1 = null;
        {
          m.put(((Line[])Conversions.unwrapArray(e.getValue(), Line.class))[0], e.getKey());
          _xblockexpression_1 = m;
        }
        return _xblockexpression_1;
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
          final Function1<Line, Line> _function_6 = (Line line) -> {
            return rev.get(line);
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
    final Function1<Character, Line> _function = (Character c) -> {
      Line _switchResult = null;
      String _plus = (c + "");
      if (_plus != null) {
        switch (_plus) {
          case "a":
            _switchResult = Line.A;
            break;
          case "b":
            _switchResult = Line.B;
            break;
          case "c":
            _switchResult = Line.C;
            break;
          case "d":
            _switchResult = Line.D;
            break;
          case "e":
            _switchResult = Line.E;
            break;
          case "f":
            _switchResult = Line.F;
            break;
          default:
            _switchResult = Line.G;
            break;
        }
      } else {
        _switchResult = Line.G;
      }
      return _switchResult;
    };
    return CollectionLiterals.<Line>newHashSet(((Line[])Conversions.unwrapArray(ListExtensions.<Character, Line>map(((List<Character>)Conversions.doWrapArray(s.toCharArray())), _function), Line.class)));
  }

  public static HashMap<Line, ArrayList<Integer>> listToMap(final List<Set<Line>> list) {
    HashMap<Line, ArrayList<Integer>> _hashMap = new HashMap<Line, ArrayList<Integer>>();
    final Function2<HashMap<Line, ArrayList<Integer>>, Line, HashMap<Line, ArrayList<Integer>>> _function = (HashMap<Line, ArrayList<Integer>> m, Line v) -> {
      HashMap<Line, ArrayList<Integer>> _xblockexpression = null;
      {
        int _size = list.size();
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
        ArrayList<Integer> _arrayList = new ArrayList<Integer>();
        final Function2<ArrayList<Integer>, Integer, ArrayList<Integer>> _function_1 = (ArrayList<Integer> l, Integer i) -> {
          ArrayList<Integer> _xblockexpression_1 = null;
          {
            boolean _contains = list.get((i).intValue()).contains(v);
            if (_contains) {
              l.add(i);
            }
            _xblockexpression_1 = l;
          }
          return _xblockexpression_1;
        };
        m.put(v, IterableExtensions.<Integer, ArrayList<Integer>>fold(_doubleDotLessThan, _arrayList, _function_1));
        _xblockexpression = m;
      }
      return _xblockexpression;
    };
    return IterableExtensions.<Line, HashMap<Line, ArrayList<Integer>>>fold(CollectionLiterals.<Line>newHashSet(Line.A, Line.B, Line.C, Line.D, Line.E, Line.F, Line.G), _hashMap, _function);
  }
}
