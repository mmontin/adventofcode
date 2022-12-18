package advent2022;

import adventutils.astar.AStar;
import adventutils.astar.State;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.MapExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day16 {
  public static class StringState implements State {
    private String name;

    public StringState(final String _name) {
      this.name = _name;
    }

    public boolean isGoal() {
      return this.name.equals(Day16.current_final_location);
    }

    public int minToGoal() {
      return 1;
    }

    public List<Pair<State, Integer>> neighbours() {
      final Function1<String, Pair<State, Integer>> _function = new Function1<String, Pair<State, Integer>>() {
        public Pair<State, Integer> apply(final String v) {
          Day16.StringState _stringState = new Day16.StringState(v);
          return Pair.<State, Integer>of(((State) _stringState), Integer.valueOf(1));
        }
      };
      return ListExtensions.<String, Pair<State, Integer>>map(Day16.valves_paths.get(this.name), _function);
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day16.StringState) {
        _matched=true;
        _switchResult = this.name.equals(((Day16.StringState)other).name);
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    public int hashCode() {
      return this.name.hashCode();
    }
  }

  public static class Tunnel implements State {
    private final int time;

    private final Set<String> open_valves;

    private final String position;

    private final int currentFlow;

    private final boolean _isGoal;

    private final int _hashCode;

    private final int _minToGoal;

    public Tunnel() {
      this(0, CollectionLiterals.<String>newHashSet(), "AA");
    }

    public Tunnel(final int _time, final Set<String> _open_valves, final String _position) {
      this.time = _time;
      this.open_valves = _open_valves;
      this.position = _position;
      this.currentFlow = (this.computeCurrentFlow()).intValue();
      this._isGoal = (this.time == Day16.max_duration);
      int _hashCode = this.open_valves.hashCode();
      int _plus = (this.time + _hashCode);
      int _hashCode_1 = this.position.hashCode();
      int _plus_1 = (_plus + _hashCode_1);
      this._hashCode = _plus_1;
      this._minToGoal = this.computeMinToGoal();
    }

    public Integer computeCurrentFlow() {
      final Function2<Integer, String, Integer> _function = new Function2<Integer, String, Integer>() {
        public Integer apply(final Integer acc, final String v) {
          Integer _get = Day16.valves_flows.get(v);
          return Integer.valueOf(((acc).intValue() + (_get).intValue()));
        }
      };
      return IterableExtensions.<String, Integer>fold(this.open_valves, Integer.valueOf(0), _function);
    }

    public boolean isGoal() {
      return this._isGoal;
    }

    public int minToGoal() {
      return this._minToGoal;
    }

    public int computeMinToGoal() {
      int _xblockexpression = (int) 0;
      {
        final Function2<String, Integer, Boolean> _function = new Function2<String, Integer, Boolean>() {
          public Boolean apply(final String k, final Integer v) {
            boolean _contains = Tunnel.this.open_valves.contains(k);
            return Boolean.valueOf((!_contains));
          }
        };
        final Function1<Map.Entry<String, Integer>, Integer> _function_1 = new Function1<Map.Entry<String, Integer>, Integer>() {
          public Integer apply(final Map.Entry<String, Integer> it) {
            Integer _value = it.getValue();
            return Integer.valueOf((-(_value).intValue()));
          }
        };
        final Function1<Map.Entry<String, Integer>, Integer> _function_2 = new Function1<Map.Entry<String, Integer>, Integer>() {
          public Integer apply(final Map.Entry<String, Integer> it) {
            return it.getValue();
          }
        };
        final List<Integer> remaining_valves = ListExtensions.<Map.Entry<String, Integer>, Integer>map(IterableExtensions.<Map.Entry<String, Integer>, Integer>sortBy(IterableExtensions.<Map.Entry<String, Integer>>toList(MapExtensions.<String, Integer>filter(Day16.valves_flows, _function).entrySet()), _function_1), _function_2);
        final int number_of_possibly_open_valves = ((Day16.max_duration - this.time) / 2);
        int flow = this.currentFlow;
        int total_flow = 0;
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, number_of_possibly_open_valves, true);
        for (final Integer i : _doubleDotLessThan) {
          {
            int _tal_flow = total_flow;
            total_flow = (_tal_flow + (Day16.max_flow_per_unit - flow));
            Integer _xifexpression = null;
            int _size = remaining_valves.size();
            boolean _greaterEqualsThan = ((i).intValue() >= _size);
            if (_greaterEqualsThan) {
              _xifexpression = Integer.valueOf(0);
            } else {
              _xifexpression = remaining_valves.get((i).intValue());
            }
            final Integer next_value = _xifexpression;
            flow = (flow + (next_value).intValue());
            int _tal_flow_1 = total_flow;
            total_flow = (_tal_flow_1 + (Day16.max_flow_per_unit - flow));
          }
        }
        _xblockexpression = total_flow;
      }
      return _xblockexpression;
    }

    public List<Pair<State, Integer>> neighbours() {
      ArrayList<Pair<State, Integer>> _xblockexpression = null;
      {
        final Function1<String, Boolean> _function = new Function1<String, Boolean>() {
          public Boolean apply(final String it) {
            boolean _contains = Tunnel.this.open_valves.contains(it);
            return Boolean.valueOf((!_contains));
          }
        };
        final Function2<ArrayList<Pair<State, Integer>>, String, ArrayList<Pair<State, Integer>>> _function_1 = new Function2<ArrayList<Pair<State, Integer>>, String, ArrayList<Pair<State, Integer>>>() {
          public ArrayList<Pair<State, Integer>> apply(final ArrayList<Pair<State, Integer>> acc, final String current_valve) {
            ArrayList<Pair<State, Integer>> _xblockexpression = null;
            {
              Integer _get = Day16.final_valves_distances.get(Tunnel.this.position).get(current_valve);
              final int duration_journey_open = ((_get).intValue() + 1);
              if (((Tunnel.this.time + duration_journey_open) < Day16.max_duration)) {
                final HashSet<String> new_open_valves = new HashSet<String>(Tunnel.this.open_valves);
                new_open_valves.add(current_valve);
                Day16.Tunnel _tunnel = new Day16.Tunnel(
                  (Tunnel.this.time + duration_journey_open), new_open_valves, current_valve);
                Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _tunnel), Integer.valueOf(((Day16.max_flow_per_unit - Tunnel.this.currentFlow) * duration_journey_open)));
                acc.add(_mappedTo);
              }
              _xblockexpression = acc;
            }
            return _xblockexpression;
          }
        };
        final ArrayList<Pair<State, Integer>> output = IterableExtensions.<String, ArrayList<Pair<State, Integer>>>fold(IterableExtensions.<String>filter(Day16.valves_flows.keySet(), _function), CollectionLiterals.<Pair<State, Integer>>newArrayList(), _function_1);
        boolean _isEmpty = output.isEmpty();
        if (_isEmpty) {
          final int time_remaining = (Day16.max_duration - this.time);
          HashSet<String> _hashSet = new HashSet<String>(this.open_valves);
          Day16.Tunnel _tunnel = new Day16.Tunnel(
            Day16.max_duration, _hashSet, 
            this.position);
          Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _tunnel), Integer.valueOf(((Day16.max_flow_per_unit - this.currentFlow) * time_remaining)));
          output.add(_mappedTo);
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day16.Tunnel) {
        _matched=true;
        _switchResult = (((((Day16.Tunnel)other).time == this.time) && ((Day16.Tunnel)other).open_valves.equals(this.open_valves)) && ((Day16.Tunnel)other).position.equals(this.position));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }

    public int hashCode() {
      return this._hashCode;
    }
  }

  public static class TunnelEl implements State {
    private final int time;

    private final Set<String> open_valves;

    private final Pair<String, Integer> my_position;

    private final Pair<String, Integer> el_position;

    private final int _hashCode;

    private final int _minToGoal;

    private final boolean _isGoal;

    public final int currentFlow;

    public TunnelEl() {
      this(Day16.learning_time, CollectionLiterals.<String>newHashSet(), Pair.<String, Integer>of("AA", Integer.valueOf(0)), Pair.<String, Integer>of("AA", Integer.valueOf(0)));
    }

    public TunnelEl(final int _time, final Set<String> _open_valves, final Pair<String, Integer> _my_position, final Pair<String, Integer> _el_position) {
      this.open_valves = _open_valves;
      this.my_position = _my_position;
      this.el_position = _el_position;
      this.time = _time;
      this._hashCode = this.makeHashCode();
      this._minToGoal = this.makeMinToGoal();
      this._isGoal = (this.time == Day16.max_duration);
      this.currentFlow = (this.makeCurrentFlow()).intValue();
    }

    public Integer makeCurrentFlow() {
      final Function2<Integer, String, Integer> _function = new Function2<Integer, String, Integer>() {
        public Integer apply(final Integer acc, final String v) {
          Integer _get = Day16.valves_flows.get(v);
          return Integer.valueOf(((acc).intValue() + (_get).intValue()));
        }
      };
      return IterableExtensions.<String, Integer>fold(this.open_valves, Integer.valueOf(0), _function);
    }

    public int makeMinToGoal() {
      int _xblockexpression = (int) 0;
      {
        final Function2<String, Integer, Boolean> _function = new Function2<String, Integer, Boolean>() {
          public Boolean apply(final String k, final Integer v) {
            boolean _contains = TunnelEl.this.open_valves.contains(k);
            return Boolean.valueOf((!_contains));
          }
        };
        final Function1<Map.Entry<String, Integer>, Integer> _function_1 = new Function1<Map.Entry<String, Integer>, Integer>() {
          public Integer apply(final Map.Entry<String, Integer> it) {
            Integer _value = it.getValue();
            return Integer.valueOf((-(_value).intValue()));
          }
        };
        final Function1<Map.Entry<String, Integer>, Integer> _function_2 = new Function1<Map.Entry<String, Integer>, Integer>() {
          public Integer apply(final Map.Entry<String, Integer> it) {
            return it.getValue();
          }
        };
        final List<Integer> remaining_valves = IterableExtensions.<Integer>toList(ListExtensions.<Map.Entry<String, Integer>, Integer>map(IterableExtensions.<Map.Entry<String, Integer>, Integer>sortBy(IterableExtensions.<Map.Entry<String, Integer>>toList(MapExtensions.<String, Integer>filter(Day16.valves_flows, _function).entrySet()), _function_1), _function_2));
        int flow = this.currentFlow;
        int cumulated_flow = 0;
        boolean open_valves = true;
        ExclusiveRange _doubleDotLessThan = new ExclusiveRange(this.time, Day16.max_duration, true);
        for (final Integer i : _doubleDotLessThan) {
          {
            int _cumulated_flow = cumulated_flow;
            cumulated_flow = (_cumulated_flow + flow);
            if (open_valves) {
              Integer _xifexpression = null;
              boolean _isEmpty = remaining_valves.isEmpty();
              if (_isEmpty) {
                _xifexpression = Integer.valueOf(0);
              } else {
                _xifexpression = remaining_valves.remove(0);
              }
              final Integer next_value_1 = _xifexpression;
              Integer _xifexpression_1 = null;
              boolean _isEmpty_1 = remaining_valves.isEmpty();
              if (_isEmpty_1) {
                _xifexpression_1 = Integer.valueOf(0);
              } else {
                _xifexpression_1 = remaining_valves.remove(0);
              }
              final Integer next_value_2 = _xifexpression_1;
              flow = ((flow + (next_value_1).intValue()) + (next_value_2).intValue());
            }
            open_valves = (!open_valves);
          }
        }
        _xblockexpression = (((Day16.max_duration - this.time) * Day16.max_flow_per_unit) - cumulated_flow);
      }
      return _xblockexpression;
    }

    public int makeHashCode() {
      int _hashCode = this.open_valves.hashCode();
      int _plus = (this.time + _hashCode);
      int _hashCode_1 = this.my_position.hashCode();
      int _plus_1 = (_plus + _hashCode_1);
      int _hashCode_2 = this.el_position.hashCode();
      return (_plus_1 + _hashCode_2);
    }

    public boolean isGoal() {
      return this._isGoal;
    }

    public int minToGoal() {
      return this._minToGoal;
    }

    public List<Pair<State, Integer>> neighbours() {
      ArrayList<Pair<State, Integer>> _xblockexpression = null;
      {
        final int remaining_duration = (Day16.max_duration - this.time);
        final ArrayList<Pair<String, Integer>> my_neighbours = CollectionLiterals.<Pair<String, Integer>>newArrayList();
        Integer _value = this.my_position.getValue();
        boolean _greaterThan = ((_value).intValue() > 0);
        if (_greaterThan) {
          String _key = this.my_position.getKey();
          Integer _value_1 = this.my_position.getValue();
          Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(_key, _value_1);
          my_neighbours.add(_mappedTo);
        } else {
          final Function1<String, Boolean> _function = new Function1<String, Boolean>() {
            public Boolean apply(final String it) {
              return Boolean.valueOf(((!TunnelEl.this.open_valves.contains(it)) && (!it.equals(TunnelEl.this.el_position.getKey()))));
            }
          };
          final Function1<String, Pair<String, Integer>> _function_1 = new Function1<String, Pair<String, Integer>>() {
            public Pair<String, Integer> apply(final String it) {
              Integer _get = Day16.final_valves_distances.get(TunnelEl.this.my_position.getKey()).get(it);
              int _plus = ((_get).intValue() + 1);
              return Pair.<String, Integer>of(it, Integer.valueOf(_plus));
            }
          };
          final Function1<Pair<String, Integer>, Boolean> _function_2 = new Function1<Pair<String, Integer>, Boolean>() {
            public Boolean apply(final Pair<String, Integer> it) {
              Integer _value = it.getValue();
              return Boolean.valueOf(((_value).intValue() < remaining_duration));
            }
          };
          Iterables.<Pair<String, Integer>>addAll(my_neighbours, IterableExtensions.<Pair<String, Integer>>filter(IterableExtensions.<String, Pair<String, Integer>>map(IterableExtensions.<String>filter(Day16.valves_flows.keySet(), _function), _function_1), _function_2));
        }
        final ArrayList<Pair<String, Integer>> el_neighbours = CollectionLiterals.<Pair<String, Integer>>newArrayList();
        Integer _value_2 = this.el_position.getValue();
        boolean _greaterThan_1 = ((_value_2).intValue() > 0);
        if (_greaterThan_1) {
          String _key_1 = this.el_position.getKey();
          Integer _value_3 = this.el_position.getValue();
          Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of(_key_1, _value_3);
          el_neighbours.add(_mappedTo_1);
        } else {
          final Function1<String, Boolean> _function_3 = new Function1<String, Boolean>() {
            public Boolean apply(final String it) {
              return Boolean.valueOf(((!TunnelEl.this.open_valves.contains(it)) && (!it.equals(TunnelEl.this.my_position.getKey()))));
            }
          };
          final Function1<String, Pair<String, Integer>> _function_4 = new Function1<String, Pair<String, Integer>>() {
            public Pair<String, Integer> apply(final String it) {
              Integer _get = Day16.final_valves_distances.get(TunnelEl.this.el_position.getKey()).get(it);
              int _plus = ((_get).intValue() + 1);
              return Pair.<String, Integer>of(it, Integer.valueOf(_plus));
            }
          };
          final Function1<Pair<String, Integer>, Boolean> _function_5 = new Function1<Pair<String, Integer>, Boolean>() {
            public Boolean apply(final Pair<String, Integer> it) {
              Integer _value = it.getValue();
              return Boolean.valueOf(((_value).intValue() < remaining_duration));
            }
          };
          Iterables.<Pair<String, Integer>>addAll(el_neighbours, IterableExtensions.<Pair<String, Integer>>filter(IterableExtensions.<String, Pair<String, Integer>>map(IterableExtensions.<String>filter(Day16.valves_flows.keySet(), _function_3), _function_4), _function_5));
        }
        final ArrayList<Pair<State, Integer>> output = CollectionLiterals.<Pair<State, Integer>>newArrayList();
        final Consumer<Pair<String, Integer>> _function_6 = new Consumer<Pair<String, Integer>>() {
          public void accept(final Pair<String, Integer> my_next) {
            final Consumer<Pair<String, Integer>> _function = new Consumer<Pair<String, Integer>>() {
              public void accept(final Pair<String, Integer> el_next) {
                boolean _equals = my_next.getKey().equals(el_next.getKey());
                boolean _not = (!_equals);
                if (_not) {
                  final HashSet<String> next_open_valves = new HashSet<String>(TunnelEl.this.open_valves);
                  Integer _value = my_next.getValue();
                  Integer _value_1 = el_next.getValue();
                  int _minus = ((_value).intValue() - (_value_1).intValue());
                  final int diff = _minus;
                  boolean _matched = false;
                  if ((diff < 0)) {
                    _matched=true;
                    next_open_valves.add(my_next.getKey());
                    Integer _value_2 = my_next.getValue();
                    int _plus = (TunnelEl.this.time + (_value_2).intValue());
                    String _key = my_next.getKey();
                    Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(_key, Integer.valueOf(0));
                    String _key_1 = el_next.getKey();
                    Integer _value_3 = el_next.getValue();
                    Integer _value_4 = my_next.getValue();
                    int _minus_1 = ((_value_3).intValue() - (_value_4).intValue());
                    Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of(_key_1, Integer.valueOf(_minus_1));
                    Day16.TunnelEl _tunnelEl = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo, _mappedTo_1);
                    Integer _value_5 = my_next.getValue();
                    int _multiply = ((_value_5).intValue() * (Day16.max_flow_per_unit - TunnelEl.this.currentFlow));
                    Pair<State, Integer> _mappedTo_2 = Pair.<State, Integer>of(((State) _tunnelEl), Integer.valueOf(_multiply));
                    output.add(_mappedTo_2);
                  }
                  if (!_matched) {
                    if ((diff > 0)) {
                      _matched=true;
                      next_open_valves.add(el_next.getKey());
                      Integer _value_6 = el_next.getValue();
                      int _plus_1 = (TunnelEl.this.time + (_value_6).intValue());
                      String _key_2 = my_next.getKey();
                      Integer _value_7 = my_next.getValue();
                      Integer _value_8 = el_next.getValue();
                      int _minus_2 = ((_value_7).intValue() - (_value_8).intValue());
                      Pair<String, Integer> _mappedTo_3 = Pair.<String, Integer>of(_key_2, Integer.valueOf(_minus_2));
                      String _key_3 = el_next.getKey();
                      Pair<String, Integer> _mappedTo_4 = Pair.<String, Integer>of(_key_3, Integer.valueOf(0));
                      Day16.TunnelEl _tunnelEl_1 = new Day16.TunnelEl(_plus_1, next_open_valves, _mappedTo_3, _mappedTo_4);
                      Integer _value_9 = el_next.getValue();
                      int _multiply_1 = ((_value_9).intValue() * (Day16.max_flow_per_unit - TunnelEl.this.currentFlow));
                      Pair<State, Integer> _mappedTo_5 = Pair.<State, Integer>of(((State) _tunnelEl_1), Integer.valueOf(_multiply_1));
                      output.add(_mappedTo_5);
                    }
                  }
                  if (!_matched) {
                    {
                      next_open_valves.add(my_next.getKey());
                      next_open_valves.add(el_next.getKey());
                      Integer _value_10 = my_next.getValue();
                      int _plus_2 = (TunnelEl.this.time + (_value_10).intValue());
                      String _key_4 = my_next.getKey();
                      Pair<String, Integer> _mappedTo_6 = Pair.<String, Integer>of(_key_4, Integer.valueOf(0));
                      String _key_5 = el_next.getKey();
                      Pair<String, Integer> _mappedTo_7 = Pair.<String, Integer>of(_key_5, Integer.valueOf(0));
                      Day16.TunnelEl _tunnelEl_2 = new Day16.TunnelEl(_plus_2, next_open_valves, _mappedTo_6, _mappedTo_7);
                      Integer _value_11 = my_next.getValue();
                      int _multiply_2 = ((_value_11).intValue() * (Day16.max_flow_per_unit - TunnelEl.this.currentFlow));
                      Pair<State, Integer> _mappedTo_8 = Pair.<State, Integer>of(((State) _tunnelEl_2), Integer.valueOf(_multiply_2));
                      output.add(_mappedTo_8);
                    }
                  }
                }
              }
            };
            el_neighbours.forEach(_function);
          }
        };
        my_neighbours.forEach(_function_6);
        boolean _isEmpty = output.isEmpty();
        if (_isEmpty) {
          if (((my_neighbours.size() == 0) && (el_neighbours.size() == 0))) {
            HashSet<String> _hashSet = new HashSet<String>(this.open_valves);
            String _key_2 = this.my_position.getKey();
            Integer _value_4 = this.my_position.getValue();
            Pair<String, Integer> _mappedTo_2 = Pair.<String, Integer>of(_key_2, _value_4);
            String _key_3 = this.el_position.getKey();
            Integer _value_5 = this.el_position.getValue();
            Pair<String, Integer> _mappedTo_3 = Pair.<String, Integer>of(_key_3, _value_5);
            Day16.TunnelEl _tunnelEl = new Day16.TunnelEl(
              Day16.max_duration, _hashSet, _mappedTo_2, _mappedTo_3);
            Pair<State, Integer> _mappedTo_4 = Pair.<State, Integer>of(((State) _tunnelEl), Integer.valueOf((remaining_duration * (Day16.max_flow_per_unit - this.currentFlow))));
            output.add(_mappedTo_4);
          } else {
            int _size = my_neighbours.size();
            boolean _equals = (_size == 0);
            if (_equals) {
              final Consumer<Pair<String, Integer>> _function_7 = new Consumer<Pair<String, Integer>>() {
                public void accept(final Pair<String, Integer> el_next) {
                  final HashSet<String> next_open_valves = new HashSet<String>(TunnelEl.this.open_valves);
                  next_open_valves.add(el_next.getKey());
                  Integer _value = el_next.getValue();
                  int _plus = (TunnelEl.this.time + (_value).intValue());
                  String _key = TunnelEl.this.my_position.getKey();
                  Integer _value_1 = TunnelEl.this.my_position.getValue();
                  Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(_key, _value_1);
                  String _key_1 = el_next.getKey();
                  Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of(_key_1, Integer.valueOf(0));
                  Day16.TunnelEl _tunnelEl = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo, _mappedTo_1);
                  Integer _value_2 = el_next.getValue();
                  int _multiply = ((_value_2).intValue() * (Day16.max_flow_per_unit - TunnelEl.this.currentFlow));
                  Pair<State, Integer> _mappedTo_2 = Pair.<State, Integer>of(((State) _tunnelEl), Integer.valueOf(_multiply));
                  output.add(_mappedTo_2);
                }
              };
              el_neighbours.forEach(_function_7);
            } else {
              int _size_1 = el_neighbours.size();
              boolean _equals_1 = (_size_1 == 0);
              if (_equals_1) {
                final Consumer<Pair<String, Integer>> _function_8 = new Consumer<Pair<String, Integer>>() {
                  public void accept(final Pair<String, Integer> my_next) {
                    final HashSet<String> next_open_valves = new HashSet<String>(TunnelEl.this.open_valves);
                    next_open_valves.add(my_next.getKey());
                    Integer _value = my_next.getValue();
                    int _plus = (TunnelEl.this.time + (_value).intValue());
                    String _key = my_next.getKey();
                    Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(_key, Integer.valueOf(0));
                    String _key_1 = TunnelEl.this.el_position.getKey();
                    Integer _value_1 = TunnelEl.this.el_position.getValue();
                    Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of(_key_1, _value_1);
                    Day16.TunnelEl _tunnelEl = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo, _mappedTo_1);
                    Integer _value_2 = my_next.getValue();
                    int _multiply = ((_value_2).intValue() * (Day16.max_flow_per_unit - TunnelEl.this.currentFlow));
                    Pair<State, Integer> _mappedTo_2 = Pair.<State, Integer>of(((State) _tunnelEl), Integer.valueOf(_multiply));
                    output.add(_mappedTo_2);
                  }
                };
                my_neighbours.forEach(_function_8);
              } else {
                final Pair<String, Integer> my_target = my_neighbours.get(0);
                final Pair<String, Integer> el_target = el_neighbours.get(0);
                Integer _value_6 = my_target.getValue();
                Integer _value_7 = el_target.getValue();
                boolean _lessEqualsThan = (_value_6.compareTo(_value_7) <= 0);
                if (_lessEqualsThan) {
                  final HashSet<String> next_open_valves = new HashSet<String>(this.open_valves);
                  next_open_valves.add(my_target.getKey());
                  Integer _value_8 = my_target.getValue();
                  int _plus = (this.time + (_value_8).intValue());
                  String _key_4 = my_target.getKey();
                  Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of(_key_4, Integer.valueOf(0));
                  String _key_5 = this.el_position.getKey();
                  Integer _value_9 = this.el_position.getValue();
                  Pair<String, Integer> _mappedTo_6 = Pair.<String, Integer>of(_key_5, _value_9);
                  Day16.TunnelEl _tunnelEl_1 = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo_5, _mappedTo_6);
                  Integer _value_10 = my_target.getValue();
                  int _multiply = ((_value_10).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                  Pair<State, Integer> _mappedTo_7 = Pair.<State, Integer>of(((State) _tunnelEl_1), Integer.valueOf(_multiply));
                  output.add(_mappedTo_7);
                } else {
                  final HashSet<String> next_open_valves_1 = new HashSet<String>(this.open_valves);
                  next_open_valves_1.add(el_target.getKey());
                  Integer _value_11 = el_target.getValue();
                  int _plus_1 = (this.time + (_value_11).intValue());
                  String _key_6 = this.my_position.getKey();
                  Integer _value_12 = this.my_position.getValue();
                  Pair<String, Integer> _mappedTo_8 = Pair.<String, Integer>of(_key_6, _value_12);
                  String _key_7 = el_target.getKey();
                  Pair<String, Integer> _mappedTo_9 = Pair.<String, Integer>of(_key_7, Integer.valueOf(0));
                  Day16.TunnelEl _tunnelEl_2 = new Day16.TunnelEl(_plus_1, next_open_valves_1, _mappedTo_8, _mappedTo_9);
                  Integer _value_13 = el_target.getValue();
                  int _multiply_1 = ((_value_13).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                  Pair<State, Integer> _mappedTo_10 = Pair.<State, Integer>of(((State) _tunnelEl_2), Integer.valueOf(_multiply_1));
                  output.add(_mappedTo_10);
                }
              }
            }
          }
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public String toString() {
      return ((((((("t = " + Integer.valueOf((this.time - 4))) + " ; Valves open = ") + this.open_valves) + " ; My position = ") + this.my_position) + 
        " ; El position = ") + this.el_position);
    }

    public int hashCode() {
      return this._hashCode;
    }
  }

  private static final Map<String, Integer> valves_flows = CollectionLiterals.<String, Integer>newHashMap();

  private static final Map<String, List<String>> valves_paths = CollectionLiterals.<String, List<String>>newHashMap();

  private static final Map<String, Map<String, Integer>> final_valves_distances = CollectionLiterals.<String, Map<String, Integer>>newHashMap();

  private static final int max_duration = 30;

  private static final int learning_time = 4;

  private static int max_flow_per_unit;

  public static void initialize_valves() {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        String[] split1 = it.split("; tunnels lead to valves ");
        final String[] _converted_split1 = (String[])split1;
        int _size = ((List<String>)Conversions.doWrapArray(_converted_split1)).size();
        boolean _equals = (_size == 1);
        if (_equals) {
          split1 = it.split("; tunnel leads to valve ");
        }
        final List<String> destinations = IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray((split1[1]).split(", "))));
        final String valve = (split1[0]).split(" ")[1];
        final int flow = Integer.parseInt((split1[0]).split("=")[1]);
        if ((valve.equals("AA") || (flow > 0))) {
          Day16.valves_flows.put(valve, Integer.valueOf(flow));
        }
        Day16.valves_paths.put(valve, destinations);
      }
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(16)).getInputs().forEach(_function);
  }

  private static String current_final_location = "";

  public static Integer update_valves() {
    Integer _xblockexpression = null;
    {
      final Function1<Map.Entry<String, Integer>, String> _function = new Function1<Map.Entry<String, Integer>, String>() {
        public String apply(final Map.Entry<String, Integer> it) {
          String _xblockexpression = null;
          {
            Day16.final_valves_distances.put(it.getKey(), CollectionLiterals.<String, Integer>newHashMap());
            _xblockexpression = it.getKey();
          }
          return _xblockexpression;
        }
      };
      final List<String> valves_to_consider = IterableExtensions.<String>toList(IterableExtensions.<Map.Entry<String, Integer>, String>map(Day16.valves_flows.entrySet(), _function));
      int _size = valves_to_consider.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        int _size_1 = valves_to_consider.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(((i).intValue() + 1), _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          {
            final String current_source = valves_to_consider.get((i).intValue());
            final String current_target = valves_to_consider.get((j).intValue());
            Day16.current_final_location = current_target;
            Day16.StringState _stringState = new Day16.StringState(current_source);
            final Integer current_shortest_distance = new AStar(_stringState).run().getMinDistance();
            Day16.final_valves_distances.get(current_target).put(current_source, current_shortest_distance);
            Day16.final_valves_distances.get(current_source).put(current_target, current_shortest_distance);
          }
        }
      }
      _xblockexpression = Day16.valves_flows.remove("AA");
    }
    return _xblockexpression;
  }

  public static void main(final String[] args) {
    Day16.initialize_valves();
    final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer acc, final Integer v) {
        return Integer.valueOf(((acc).intValue() + (v).intValue()));
      }
    };
    Day16.max_flow_per_unit = (IterableExtensions.<Integer, Integer>fold(Day16.valves_flows.values(), Integer.valueOf(0), _function)).intValue();
    Day16.update_valves();
    Day16.Tunnel _tunnel = new Day16.Tunnel();
    Integer _minDistance = new AStar(_tunnel).run().getMinDistance();
    int _minus = ((Day16.max_flow_per_unit * Day16.max_duration) - (_minDistance).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_minus));
    Day16.TunnelEl _tunnelEl = new Day16.TunnelEl();
    Integer _minDistance_1 = new AStar(_tunnelEl).run().getMinDistance();
    int _minus_1 = ((Day16.max_flow_per_unit * (Day16.max_duration - Day16.learning_time)) - (_minDistance_1).intValue());
    InputOutput.<Integer>println(Integer.valueOf(_minus_1));
    Day16.TunnelEl _tunnelEl_1 = new Day16.TunnelEl();
    final Consumer<State> _function_1 = new Consumer<State>() {
      public void accept(final State it) {
        InputOutput.<State>println(it);
      }
    };
    new AStar(_tunnelEl_1).run().minPath().forEach(_function_1);
  }
}
