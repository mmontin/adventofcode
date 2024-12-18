package advent2022;

import adventutils.input.InputLoader;
import adventutils.pathfinding.AStar;
import adventutils.pathfinding.State;
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

    @Override
    public boolean isGoal() {
      return this.name.equals(Day16.current_final_location);
    }

    @Override
    public int minToGoal() {
      return 1;
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      final Function1<String, Pair<? extends State, Integer>> _function = (String v) -> {
        Day16.StringState _stringState = new Day16.StringState(v);
        return Pair.<State, Integer>of(((State) _stringState), Integer.valueOf(1));
      };
      return ListExtensions.<String, Pair<? extends State, Integer>>map(Day16.valves_paths.get(this.name), _function);
    }

    @Override
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

    @Override
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
      final Function2<Integer, String, Integer> _function = (Integer acc, String v) -> {
        Integer _get = Day16.valves_flows.get(v);
        return Integer.valueOf(((acc).intValue() + (_get).intValue()));
      };
      return IterableExtensions.<String, Integer>fold(this.open_valves, Integer.valueOf(0), _function);
    }

    @Override
    public boolean isGoal() {
      return this._isGoal;
    }

    @Override
    public int minToGoal() {
      return this._minToGoal;
    }

    public int computeMinToGoal() {
      int _xblockexpression = (int) 0;
      {
        final Function2<String, Integer, Boolean> _function = (String k, Integer v) -> {
          boolean _contains = this.open_valves.contains(k);
          return Boolean.valueOf((!_contains));
        };
        final Function1<Map.Entry<String, Integer>, Integer> _function_1 = (Map.Entry<String, Integer> it) -> {
          Integer _value = it.getValue();
          return Integer.valueOf((-(_value).intValue()));
        };
        final Function1<Map.Entry<String, Integer>, Integer> _function_2 = (Map.Entry<String, Integer> it) -> {
          return it.getValue();
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

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      ArrayList<Pair<? extends State, Integer>> _xblockexpression = null;
      {
        final Function1<String, Boolean> _function = (String it) -> {
          boolean _contains = this.open_valves.contains(it);
          return Boolean.valueOf((!_contains));
        };
        final Function2<ArrayList<Pair<? extends State, Integer>>, String, ArrayList<Pair<? extends State, Integer>>> _function_1 = (ArrayList<Pair<? extends State, Integer>> acc, String current_valve) -> {
          ArrayList<Pair<? extends State, Integer>> _xblockexpression_1 = null;
          {
            Integer _get = Day16.final_valves_distances.get(this.position).get(current_valve);
            final int duration_journey_open = ((_get).intValue() + 1);
            if (((this.time + duration_journey_open) < Day16.max_duration)) {
              final HashSet<String> new_open_valves = new HashSet<String>(this.open_valves);
              new_open_valves.add(current_valve);
              Day16.Tunnel _tunnel = new Day16.Tunnel(
                (this.time + duration_journey_open), new_open_valves, current_valve);
              Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _tunnel), Integer.valueOf(((Day16.max_flow_per_unit - this.currentFlow) * duration_journey_open)));
              acc.add(_mappedTo);
            }
            _xblockexpression_1 = acc;
          }
          return _xblockexpression_1;
        };
        final ArrayList<Pair<? extends State, Integer>> output = IterableExtensions.<String, ArrayList<Pair<? extends State, Integer>>>fold(IterableExtensions.<String>filter(Day16.valves_flows.keySet(), _function), CollectionLiterals.<Pair<? extends State, Integer>>newArrayList(), _function_1);
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

    @Override
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

    @Override
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
      this._isGoal = (this.time == Day16.max_duration);
      this.currentFlow = (this.makeCurrentFlow()).intValue();
      this._minToGoal = this.makeMinToGoal();
    }

    public Integer makeCurrentFlow() {
      final Function2<Integer, String, Integer> _function = (Integer acc, String v) -> {
        Integer _get = Day16.valves_flows.get(v);
        return Integer.valueOf(((acc).intValue() + (_get).intValue()));
      };
      return IterableExtensions.<String, Integer>fold(this.open_valves, Integer.valueOf(0), _function);
    }

    public int makeMinToGoal() {
      int _xblockexpression = (int) 0;
      {
        final int remaining_time = (Day16.max_duration - this.time);
        int total_flow = 0;
        int current_flow = this.currentFlow;
        final Function1<String, Boolean> _function = (String it) -> {
          return Boolean.valueOf(this.open_valves.contains(it));
        };
        final Function1<String, Integer> _function_1 = (String it) -> {
          Integer _get = Day16.valves_flows.get(it);
          return Integer.valueOf((-(_get).intValue()));
        };
        final List<String> remaining_valves = IterableExtensions.<String>toList(IterableExtensions.<String, Integer>sortBy(IterableExtensions.<String>reject(Day16.valves_flows.keySet(), _function), _function_1));
        Pair<String, Integer> my_current_position = this.my_position;
        Pair<String, Integer> el_current_position = this.el_position;
        int i = 0;
        while (((i < remaining_time) && (!remaining_valves.isEmpty()))) {
          {
            int _tal_flow = total_flow;
            total_flow = (_tal_flow + current_flow);
            Integer _value = my_current_position.getValue();
            final Integer x = _value;
            if (x != null) {
              switch (x) {
                case 0:
                  final String to_remove = el_current_position.getKey();
                  final Function1<String, Boolean> _function_2 = (String it) -> {
                    boolean _equals = to_remove.equals(it);
                    return Boolean.valueOf((!_equals));
                  };
                  final String next_target = IterableExtensions.<String>findFirst(remaining_valves, _function_2);
                  if ((next_target != null)) {
                    Integer _min = IterableExtensions.<Integer>min(Day16.final_valves_distances.get(next_target).values());
                    Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(next_target, _min);
                    my_current_position = _mappedTo;
                  }
                  break;
                case 1:
                  remaining_valves.remove(my_current_position.getKey());
                  int _current_flow = current_flow;
                  Integer _get = Day16.valves_flows.get(my_current_position.getKey());
                  current_flow = (_current_flow + (_get).intValue());
                  String _key = my_current_position.getKey();
                  Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of(_key, Integer.valueOf(0));
                  my_current_position = _mappedTo_1;
                  break;
                default:
                  String _key_1 = my_current_position.getKey();
                  Pair<String, Integer> _mappedTo_2 = Pair.<String, Integer>of(_key_1, Integer.valueOf(((x).intValue() - 1)));
                  my_current_position = _mappedTo_2;
                  break;
              }
            } else {
              String _key_1 = my_current_position.getKey();
              Pair<String, Integer> _mappedTo_2 = Pair.<String, Integer>of(_key_1, Integer.valueOf(((x).intValue() - 1)));
              my_current_position = _mappedTo_2;
            }
            Integer _value_1 = el_current_position.getValue();
            final Integer x_1 = _value_1;
            if (x_1 != null) {
              switch (x_1) {
                case 0:
                  final String to_remove_1 = my_current_position.getKey();
                  final Function1<String, Boolean> _function_3 = (String it) -> {
                    return Boolean.valueOf(to_remove_1.equals(it));
                  };
                  final String next_target_1 = IterableExtensions.<String>findFirst(remaining_valves, _function_3);
                  if ((next_target_1 != null)) {
                    Integer _min_1 = IterableExtensions.<Integer>min(Day16.final_valves_distances.get(next_target_1).values());
                    Pair<String, Integer> _mappedTo_3 = Pair.<String, Integer>of(next_target_1, _min_1);
                    el_current_position = _mappedTo_3;
                  }
                  break;
                case 1:
                  remaining_valves.remove(el_current_position.getKey());
                  int _current_flow_1 = current_flow;
                  Integer _get_1 = Day16.valves_flows.get(el_current_position.getKey());
                  current_flow = (_current_flow_1 + (_get_1).intValue());
                  String _key_2 = el_current_position.getKey();
                  Pair<String, Integer> _mappedTo_4 = Pair.<String, Integer>of(_key_2, Integer.valueOf(0));
                  el_current_position = _mappedTo_4;
                  break;
                default:
                  String _key_3 = el_current_position.getKey();
                  Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of(_key_3, Integer.valueOf(((x_1).intValue() - 1)));
                  el_current_position = _mappedTo_5;
                  break;
              }
            } else {
              String _key_3 = el_current_position.getKey();
              Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of(_key_3, Integer.valueOf(((x_1).intValue() - 1)));
              el_current_position = _mappedTo_5;
            }
            i++;
          }
        }
        int _tal_flow = total_flow;
        total_flow = (_tal_flow + ((remaining_time - i) * current_flow));
        _xblockexpression = ((remaining_time * Day16.max_flow_per_unit) - total_flow);
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

    @Override
    public boolean isGoal() {
      return this._isGoal;
    }

    @Override
    public int minToGoal() {
      return this._minToGoal;
    }

    @Override
    public Iterable<Pair<? extends State, Integer>> neighbours() {
      ArrayList<Pair<? extends State, Integer>> _xblockexpression = null;
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
          final Function1<String, Boolean> _function = (String it) -> {
            return Boolean.valueOf(((!this.open_valves.contains(it)) && (!it.equals(this.el_position.getKey()))));
          };
          final Function1<String, Pair<String, Integer>> _function_1 = (String it) -> {
            Integer _get = Day16.final_valves_distances.get(this.my_position.getKey()).get(it);
            int _plus = ((_get).intValue() + 1);
            return Pair.<String, Integer>of(it, Integer.valueOf(_plus));
          };
          final Function1<Pair<String, Integer>, Boolean> _function_2 = (Pair<String, Integer> it) -> {
            Integer _value_2 = it.getValue();
            return Boolean.valueOf(((_value_2).intValue() < remaining_duration));
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
          final Function1<String, Boolean> _function_3 = (String it) -> {
            return Boolean.valueOf(((!this.open_valves.contains(it)) && (!it.equals(this.my_position.getKey()))));
          };
          final Function1<String, Pair<String, Integer>> _function_4 = (String it) -> {
            Integer _get = Day16.final_valves_distances.get(this.el_position.getKey()).get(it);
            int _plus = ((_get).intValue() + 1);
            return Pair.<String, Integer>of(it, Integer.valueOf(_plus));
          };
          final Function1<Pair<String, Integer>, Boolean> _function_5 = (Pair<String, Integer> it) -> {
            Integer _value_4 = it.getValue();
            return Boolean.valueOf(((_value_4).intValue() < remaining_duration));
          };
          Iterables.<Pair<String, Integer>>addAll(el_neighbours, IterableExtensions.<Pair<String, Integer>>filter(IterableExtensions.<String, Pair<String, Integer>>map(IterableExtensions.<String>filter(Day16.valves_flows.keySet(), _function_3), _function_4), _function_5));
        }
        final ArrayList<Pair<? extends State, Integer>> output = CollectionLiterals.<Pair<? extends State, Integer>>newArrayList();
        final Consumer<Pair<String, Integer>> _function_6 = (Pair<String, Integer> my_next) -> {
          final Consumer<Pair<String, Integer>> _function_7 = (Pair<String, Integer> el_next) -> {
            boolean _equals = my_next.getKey().equals(el_next.getKey());
            boolean _not = (!_equals);
            if (_not) {
              final HashSet<String> next_open_valves = new HashSet<String>(this.open_valves);
              Integer _value_4 = my_next.getValue();
              Integer _value_5 = el_next.getValue();
              int _minus = ((_value_4).intValue() - (_value_5).intValue());
              final int diff = _minus;
              boolean _matched = false;
              if ((diff < 0)) {
                _matched=true;
                next_open_valves.add(my_next.getKey());
                Integer _value_6 = my_next.getValue();
                int _plus = (this.time + (_value_6).intValue());
                String _key_2 = my_next.getKey();
                Pair<String, Integer> _mappedTo_2 = Pair.<String, Integer>of(_key_2, Integer.valueOf(0));
                String _key_3 = el_next.getKey();
                Integer _value_7 = el_next.getValue();
                Integer _value_8 = my_next.getValue();
                int _minus_1 = ((_value_7).intValue() - (_value_8).intValue());
                Pair<String, Integer> _mappedTo_3 = Pair.<String, Integer>of(_key_3, Integer.valueOf(_minus_1));
                Day16.TunnelEl _tunnelEl = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo_2, _mappedTo_3);
                Integer _value_9 = my_next.getValue();
                int _multiply = ((_value_9).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                Pair<State, Integer> _mappedTo_4 = Pair.<State, Integer>of(((State) _tunnelEl), Integer.valueOf(_multiply));
                output.add(_mappedTo_4);
              }
              if (!_matched) {
                if ((diff > 0)) {
                  _matched=true;
                  next_open_valves.add(el_next.getKey());
                  Integer _value_10 = el_next.getValue();
                  int _plus_1 = (this.time + (_value_10).intValue());
                  String _key_4 = my_next.getKey();
                  Integer _value_11 = my_next.getValue();
                  Integer _value_12 = el_next.getValue();
                  int _minus_2 = ((_value_11).intValue() - (_value_12).intValue());
                  Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of(_key_4, Integer.valueOf(_minus_2));
                  String _key_5 = el_next.getKey();
                  Pair<String, Integer> _mappedTo_6 = Pair.<String, Integer>of(_key_5, Integer.valueOf(0));
                  Day16.TunnelEl _tunnelEl_1 = new Day16.TunnelEl(_plus_1, next_open_valves, _mappedTo_5, _mappedTo_6);
                  Integer _value_13 = el_next.getValue();
                  int _multiply_1 = ((_value_13).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                  Pair<State, Integer> _mappedTo_7 = Pair.<State, Integer>of(((State) _tunnelEl_1), Integer.valueOf(_multiply_1));
                  output.add(_mappedTo_7);
                }
              }
              if (!_matched) {
                {
                  next_open_valves.add(my_next.getKey());
                  next_open_valves.add(el_next.getKey());
                  Integer _value_14 = my_next.getValue();
                  int _plus_2 = (this.time + (_value_14).intValue());
                  String _key_6 = my_next.getKey();
                  Pair<String, Integer> _mappedTo_8 = Pair.<String, Integer>of(_key_6, Integer.valueOf(0));
                  String _key_7 = el_next.getKey();
                  Pair<String, Integer> _mappedTo_9 = Pair.<String, Integer>of(_key_7, Integer.valueOf(0));
                  Day16.TunnelEl _tunnelEl_2 = new Day16.TunnelEl(_plus_2, next_open_valves, _mappedTo_8, _mappedTo_9);
                  Integer _value_15 = my_next.getValue();
                  int _multiply_2 = ((_value_15).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                  Pair<State, Integer> _mappedTo_10 = Pair.<State, Integer>of(((State) _tunnelEl_2), Integer.valueOf(_multiply_2));
                  output.add(_mappedTo_10);
                }
              }
            }
          };
          el_neighbours.forEach(_function_7);
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
              final Consumer<Pair<String, Integer>> _function_7 = (Pair<String, Integer> el_next) -> {
                final HashSet<String> next_open_valves = new HashSet<String>(this.open_valves);
                next_open_valves.add(el_next.getKey());
                Integer _value_6 = el_next.getValue();
                int _plus = (this.time + (_value_6).intValue());
                String _key_4 = this.my_position.getKey();
                Integer _value_7 = this.my_position.getValue();
                Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of(_key_4, _value_7);
                String _key_5 = el_next.getKey();
                Pair<String, Integer> _mappedTo_6 = Pair.<String, Integer>of(_key_5, Integer.valueOf(0));
                Day16.TunnelEl _tunnelEl_1 = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo_5, _mappedTo_6);
                Integer _value_8 = el_next.getValue();
                int _multiply = ((_value_8).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                Pair<State, Integer> _mappedTo_7 = Pair.<State, Integer>of(((State) _tunnelEl_1), Integer.valueOf(_multiply));
                output.add(_mappedTo_7);
              };
              el_neighbours.forEach(_function_7);
            } else {
              int _size_1 = el_neighbours.size();
              boolean _equals_1 = (_size_1 == 0);
              if (_equals_1) {
                final Consumer<Pair<String, Integer>> _function_8 = (Pair<String, Integer> my_next) -> {
                  final HashSet<String> next_open_valves = new HashSet<String>(this.open_valves);
                  next_open_valves.add(my_next.getKey());
                  Integer _value_6 = my_next.getValue();
                  int _plus = (this.time + (_value_6).intValue());
                  String _key_4 = my_next.getKey();
                  Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of(_key_4, Integer.valueOf(0));
                  String _key_5 = this.el_position.getKey();
                  Integer _value_7 = this.el_position.getValue();
                  Pair<String, Integer> _mappedTo_6 = Pair.<String, Integer>of(_key_5, _value_7);
                  Day16.TunnelEl _tunnelEl_1 = new Day16.TunnelEl(_plus, next_open_valves, _mappedTo_5, _mappedTo_6);
                  Integer _value_8 = my_next.getValue();
                  int _multiply = ((_value_8).intValue() * (Day16.max_flow_per_unit - this.currentFlow));
                  Pair<State, Integer> _mappedTo_7 = Pair.<State, Integer>of(((State) _tunnelEl_1), Integer.valueOf(_multiply));
                  output.add(_mappedTo_7);
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

    @Override
    public String toString() {
      return ((((((("t = " + Integer.valueOf((this.time - 4))) + " ; Valves open = ") + this.open_valves) + " ; My position = ") + this.my_position) + 
        " ; El position = ") + this.el_position);
    }

    @Override
    public int hashCode() {
      return this._hashCode;
    }

    @Override
    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day16.TunnelEl) {
        _matched=true;
        _switchResult = (((((Day16.TunnelEl)other).open_valves.equals(this.open_valves) && (((Day16.TunnelEl)other).time == this.time)) && 
          ((Day16.TunnelEl)other).el_position.equals(this.el_position)) && ((Day16.TunnelEl)other).my_position.equals(this.my_position));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  private static final Map<String, Integer> valves_flows = CollectionLiterals.<String, Integer>newHashMap();

  private static final Map<String, List<String>> valves_paths = CollectionLiterals.<String, List<String>>newHashMap();

  private static final Map<String, Map<String, Integer>> final_valves_distances = CollectionLiterals.<String, Map<String, Integer>>newHashMap();

  private static final int max_duration = 30;

  private static final int learning_time = 4;

  private static int max_flow_per_unit;

  public static void initialize_valves() {
    final Consumer<String> _function = (String it) -> {
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
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(16)).getInputs().forEach(_function);
  }

  private static String current_final_location = "";

  public static Integer update_valves() {
    Integer _xblockexpression = null;
    {
      final Function1<Map.Entry<String, Integer>, String> _function = (Map.Entry<String, Integer> it) -> {
        String _xblockexpression_1 = null;
        {
          Day16.final_valves_distances.put(it.getKey(), CollectionLiterals.<String, Integer>newHashMap());
          _xblockexpression_1 = it.getKey();
        }
        return _xblockexpression_1;
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
    final Function2<Integer, Integer, Integer> _function = (Integer acc, Integer v) -> {
      return Integer.valueOf(((acc).intValue() + (v).intValue()));
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
  }
}
