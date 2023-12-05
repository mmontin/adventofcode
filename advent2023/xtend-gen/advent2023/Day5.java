package advent2023;

import adventutils.geometry.Interval;
import adventutils.input.InputLoader;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day5 {
  public static void main(final String[] args) {
    try {
      final ArrayList<List<List<Long>>> maps = CollectionLiterals.<List<List<Long>>>newArrayList();
      final BufferedReader ir = new InputLoader(Integer.valueOf(2023), Integer.valueOf(5)).getInputReader();
      final Function1<String, Long> _function = new Function1<String, Long>() {
        public Long apply(final String it) {
          return Long.valueOf(Long.parseLong(it));
        }
      };
      final List<Long> seeds = IterableExtensions.<Long>toList(ListExtensions.<String, Long>map(((List<String>)Conversions.doWrapArray((ir.readLine().split(": ")[1]).split(" "))), _function));
      List<List<Long>> currentMap = null;
      while (ir.ready()) {
        {
          String currentLine = ir.readLine();
          boolean _isBlank = currentLine.isBlank();
          if (_isBlank) {
            currentMap = CollectionLiterals.<List<Long>>newArrayList();
            maps.add(currentMap);
          } else {
            final String[] numbers = currentLine.split(" ");
            int _size = ((List<String>)Conversions.doWrapArray(numbers)).size();
            boolean _equals = (_size == 3);
            if (_equals) {
              final Function1<String, Long> _function_1 = new Function1<String, Long>() {
                public Long apply(final String it) {
                  return Long.valueOf(Long.parseLong(it));
                }
              };
              currentMap.add(IterableExtensions.<Long>toList(ListExtensions.<String, Long>map(((List<String>)Conversions.doWrapArray(numbers)), _function_1)));
            }
          }
        }
      }
      final Function1<Long, Long> _function_1 = new Function1<Long, Long>() {
        public Long apply(final Long seed) {
          final Function2<Long, List<List<Long>>, Long> _function = new Function2<Long, List<List<Long>>, Long>() {
            public Long apply(final Long res, final List<List<Long>> l) {
              return Day5.dest(res, l);
            }
          };
          return IterableExtensions.<List<List<Long>>, Long>fold(maps, seed, _function);
        }
      };
      InputOutput.<Long>println(IterableExtensions.<Long>min(ListExtensions.<Long, Long>map(seeds, _function_1)));
      final ArrayList<Interval> seedIntervals = CollectionLiterals.<Interval>newArrayList();
      int _size = seeds.size();
      int _divide = (_size / 2);
      final Consumer<Integer> _function_2 = new Consumer<Integer>() {
        public void accept(final Integer it) {
          final Long start = seeds.get(((it).intValue() * 2));
          Long _get = seeds.get((((it).intValue() * 2) + 1));
          final long end = ((start).longValue() + (_get).longValue());
          Interval _interval = new Interval((start).longValue(), end);
          seedIntervals.add(_interval);
        }
      };
      new ExclusiveRange(0, _divide, true).forEach(_function_2);
      final Function1<List<List<Long>>, List<Pair<Interval, Long>>> _function_3 = new Function1<List<List<Long>>, List<Pair<Interval, Long>>>() {
        public List<Pair<Interval, Long>> apply(final List<List<Long>> entries) {
          ArrayList<Pair<Interval, Long>> _xblockexpression = null;
          {
            final Function1<List<Long>, Pair<Interval, Long>> _function = new Function1<List<Long>, Pair<Interval, Long>>() {
              public Pair<Interval, Long> apply(final List<Long> entry) {
                Long _get = entry.get(1);
                Long _get_1 = entry.get(1);
                Long _get_2 = entry.get(2);
                long _plus = ((_get_1).longValue() + (_get_2).longValue());
                Interval _interval = new Interval((_get).longValue(), _plus);
                Long _get_3 = entry.get(0);
                Long _get_4 = entry.get(1);
                long _minus = ((_get_3).longValue() - (_get_4).longValue());
                return Pair.<Interval, Long>of(_interval, Long.valueOf(_minus));
              }
            };
            final Function1<Pair<Interval, Long>, Long> _function_1 = new Function1<Pair<Interval, Long>, Long>() {
              public Long apply(final Pair<Interval, Long> it) {
                return Long.valueOf(it.getKey().leftBound);
              }
            };
            List<Pair<Interval, Long>> _sortBy = IterableExtensions.<Pair<Interval, Long>, Long>sortBy(ListExtensions.<List<Long>, Pair<Interval, Long>>map(entries, _function), _function_1);
            ArrayList<Pair<Interval, Long>> _newArrayList = CollectionLiterals.<Pair<Interval, Long>>newArrayList();
            Pair<Long, ArrayList<Pair<Interval, Long>>> _mappedTo = Pair.<Long, ArrayList<Pair<Interval, Long>>>of(Long.valueOf((-1L)), _newArrayList);
            final Function2<Pair<Long, ArrayList<Pair<Interval, Long>>>, Pair<Interval, Long>, Pair<Long, ArrayList<Pair<Interval, Long>>>> _function_2 = new Function2<Pair<Long, ArrayList<Pair<Interval, Long>>>, Pair<Interval, Long>, Pair<Long, ArrayList<Pair<Interval, Long>>>>() {
              public Pair<Long, ArrayList<Pair<Interval, Long>>> apply(final Pair<Long, ArrayList<Pair<Interval, Long>>> acc, final Pair<Interval, Long> itvPair) {
                Pair<Long, ArrayList<Pair<Interval, Long>>> _xblockexpression = null;
                {
                  final Long lastBound = acc.getKey();
                  final ArrayList<Pair<Interval, Long>> output = acc.getValue();
                  final Interval newItv = new Interval(((lastBound).longValue() + 1), (itvPair.getKey().leftBound - 1));
                  boolean _isEmpty = newItv.isEmpty();
                  boolean _not = (!_isEmpty);
                  if (_not) {
                    Pair<Interval, Long> _mappedTo = Pair.<Interval, Long>of(newItv, Long.valueOf(0L));
                    output.add(_mappedTo);
                  }
                  output.add(itvPair);
                  _xblockexpression = Pair.<Long, ArrayList<Pair<Interval, Long>>>of(Long.valueOf(itvPair.getKey().rightBound), output);
                }
                return _xblockexpression;
              }
            };
            final Pair<Long, ArrayList<Pair<Interval, Long>>> allIntervals = IterableExtensions.<Pair<Interval, Long>, Pair<Long, ArrayList<Pair<Interval, Long>>>>fold(_sortBy, _mappedTo, _function_2);
            final ArrayList<Pair<Interval, Long>> output = allIntervals.getValue();
            Long _key = allIntervals.getKey();
            long _plus = ((_key).longValue() + 1);
            final Interval lastInterval = new Interval(_plus, Long.MAX_VALUE);
            Pair<Interval, Long> _mappedTo_1 = Pair.<Interval, Long>of(lastInterval, Long.valueOf(0L));
            output.add(_mappedTo_1);
            _xblockexpression = output;
          }
          return _xblockexpression;
        }
      };
      final List<List<Pair<Interval, Long>>> mapIntervals = ListExtensions.<List<List<Long>>, List<Pair<Interval, Long>>>map(maps, _function_3);
      final Function2<ArrayList<Interval>, List<Pair<Interval, Long>>, ArrayList<Interval>> _function_4 = new Function2<ArrayList<Interval>, List<Pair<Interval, Long>>, ArrayList<Interval>>() {
        public ArrayList<Interval> apply(final ArrayList<Interval> acc, final List<Pair<Interval, Long>> v) {
          return Day5.splitMore(acc, v);
        }
      };
      final Function1<Interval, Long> _function_5 = new Function1<Interval, Long>() {
        public Long apply(final Interval it) {
          return Long.valueOf(it.leftBound);
        }
      };
      InputOutput.<Long>println(
        Long.valueOf(IterableExtensions.<Interval, Long>minBy(IterableExtensions.<List<Pair<Interval, Long>>, ArrayList<Interval>>fold(mapIntervals, seedIntervals, _function_4), _function_5).leftBound));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public static ArrayList<Interval> splitMore(final List<Interval> itvs, final List<Pair<Interval, Long>> entries) {
    final Function2<ArrayList<Interval>, Interval, ArrayList<Interval>> _function = new Function2<ArrayList<Interval>, Interval, ArrayList<Interval>>() {
      public ArrayList<Interval> apply(final ArrayList<Interval> acc, final Interval itv) {
        ArrayList<Interval> _xblockexpression = null;
        {
          acc.addAll(Day5.split(itv, entries));
          _xblockexpression = acc;
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Interval, ArrayList<Interval>>fold(itvs, CollectionLiterals.<Interval>newArrayList(), _function);
  }

  public static ArrayList<Interval> split(final Interval itv, final List<Pair<Interval, Long>> entries) {
    final Function2<ArrayList<Interval>, Pair<Interval, Long>, ArrayList<Interval>> _function = new Function2<ArrayList<Interval>, Pair<Interval, Long>, ArrayList<Interval>>() {
      public ArrayList<Interval> apply(final ArrayList<Interval> acc, final Pair<Interval, Long> otherItv) {
        ArrayList<Interval> _xblockexpression = null;
        {
          final Interval intersect = itv.intersection(otherItv.getKey());
          boolean _isEmpty = intersect.isEmpty();
          boolean _not = (!_isEmpty);
          if (_not) {
            Long _value = otherItv.getValue();
            long _plus = (intersect.leftBound + (_value).longValue());
            Long _value_1 = otherItv.getValue();
            long _plus_1 = (intersect.rightBound + (_value_1).longValue());
            Interval _interval = new Interval(_plus, _plus_1);
            acc.add(_interval);
          }
          _xblockexpression = acc;
        }
        return _xblockexpression;
      }
    };
    return IterableExtensions.<Pair<Interval, Long>, ArrayList<Interval>>fold(entries, CollectionLiterals.<Interval>newArrayList(), _function);
  }

  public static Long dest(final Long source, final List<List<Long>> entries) {
    Long _xblockexpression = null;
    {
      final Function1<List<Long>, Boolean> _function = new Function1<List<Long>, Boolean>() {
        public Boolean apply(final List<Long> it) {
          return Boolean.valueOf(Day5.destination(source, it).isPresent());
        }
      };
      final List<Long> output = IterableExtensions.<List<Long>>findFirst(entries, _function);
      Long _xifexpression = null;
      if ((output == null)) {
        _xifexpression = source;
      } else {
        _xifexpression = Day5.destination(source, output).get();
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Optional<Long> destination(final Long source, final List<Long> entry) {
    Optional<Long> _xblockexpression = null;
    {
      final Long entrySource = entry.get(1);
      final Long entryDestination = entry.get(0);
      final Long entryRange = entry.get(2);
      final long difference = ((source).longValue() - (entrySource).longValue());
      Optional<Long> _xifexpression = null;
      if (((difference >= 0) && (difference < (entryRange).longValue()))) {
        _xifexpression = Optional.<Long>of(Long.valueOf(((entryDestination).longValue() + difference)));
      } else {
        _xifexpression = Optional.<Long>empty();
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
