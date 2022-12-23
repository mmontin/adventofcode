package advent2022;

import adventutils.astar.AStar;
import adventutils.astar.State;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
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
public class Day19 {
  public static class Resources {
    private Map<String, Integer> content;

    public Resources() {
      this.content = CollectionLiterals.<String, Integer>newHashMap();
    }

    public Resources(final List<Integer> input) {
      this();
      Integer _get = input.get(0);
      boolean _notEquals = ((_get).intValue() != 0);
      if (_notEquals) {
        this.content.put("ore", input.get(0));
      }
      Integer _get_1 = input.get(1);
      boolean _notEquals_1 = ((_get_1).intValue() != 0);
      if (_notEquals_1) {
        this.content.put("clay", input.get(1));
      }
      Integer _get_2 = input.get(2);
      boolean _notEquals_2 = ((_get_2).intValue() != 0);
      if (_notEquals_2) {
        this.content.put("obsidian", input.get(2));
      }
    }

    public Resources(final Map<String, Integer> other) {
      this.content = other;
    }

    public Boolean contains(final Day19.Resources other) {
      final Function2<Boolean, Map.Entry<String, Integer>, Boolean> _function = new Function2<Boolean, Map.Entry<String, Integer>, Boolean>() {
        public Boolean apply(final Boolean acc, final Map.Entry<String, Integer> e) {
          return Boolean.valueOf(((acc).booleanValue() && (Resources.this.get(e.getKey()).compareTo(e.getValue()) >= 0)));
        }
      };
      return IterableExtensions.<Map.Entry<String, Integer>, Boolean>fold(other.content.entrySet(), Boolean.valueOf(true), _function);
    }

    public Integer get(final String s) {
      return this.content.getOrDefault(s, Integer.valueOf(0));
    }

    public boolean has(final String s) {
      Integer _get = this.get(s);
      return ((_get).intValue() != 0);
    }

    public boolean lacks(final String s) {
      boolean _has = this.has(s);
      return (!_has);
    }

    public Day19.Resources subtract(final Day19.Resources other) {
      Day19.Resources _xblockexpression = null;
      {
        final HashMap<String, Integer> output = new HashMap<String, Integer>(this.content);
        final BiConsumer<String, Integer> _function = new BiConsumer<String, Integer>() {
          public void accept(final String k, final Integer v) {
            Integer _get = output.get(k);
            final int new_val = ((_get).intValue() - (v).intValue());
            if ((new_val == 0)) {
              output.remove(k);
            } else {
              output.put(k, Integer.valueOf(new_val));
            }
          }
        };
        other.content.forEach(_function);
        _xblockexpression = new Day19.Resources(output);
      }
      return _xblockexpression;
    }

    public Day19.Resources add(final Day19.Resources other) {
      Day19.Resources _xblockexpression = null;
      {
        final HashMap<String, Integer> output = new HashMap<String, Integer>(this.content);
        final BiConsumer<String, Integer> _function = new BiConsumer<String, Integer>() {
          public void accept(final String k, final Integer v) {
            final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
              public Integer apply(final Integer i, final Integer j) {
                return Integer.valueOf(((i).intValue() + (j).intValue()));
              }
            };
            output.merge(k, v, _function);
          }
        };
        other.content.forEach(_function);
        _xblockexpression = new Day19.Resources(output);
      }
      return _xblockexpression;
    }

    public Day19.Resources addRobot(final String s) {
      Day19.Resources _xblockexpression = null;
      {
        final HashMap<String, Integer> output = new HashMap<String, Integer>(this.content);
        final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
          public Integer apply(final Integer i, final Integer j) {
            return Integer.valueOf(((i).intValue() + (j).intValue()));
          }
        };
        output.merge(s, Integer.valueOf(1), _function);
        _xblockexpression = new Day19.Resources(output);
      }
      return _xblockexpression;
    }

    public Day19.Resources times(final int n) {
      Day19.Resources _xblockexpression = null;
      {
        final HashMap<String, Integer> output = CollectionLiterals.<String, Integer>newHashMap();
        final BiConsumer<String, Integer> _function = new BiConsumer<String, Integer>() {
          public void accept(final String k, final Integer v) {
            output.put(k, Integer.valueOf(((v).intValue() * n)));
          }
        };
        this.content.forEach(_function);
        _xblockexpression = new Day19.Resources(this.content);
      }
      return _xblockexpression;
    }

    public String toString() {
      return this.content.toString();
    }

    public int hashCode() {
      return this.content.hashCode();
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day19.Resources) {
        _matched=true;
        _switchResult = ((Day19.Resources)other).content.equals(this.content);
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  public static class Blueprint {
    private final Map<String, Day19.Resources> robots_costs;

    public Blueprint(final String line) {
      this.robots_costs = CollectionLiterals.<String, Day19.Resources>newHashMap();
      final Function1<String, String[]> _function = new Function1<String, String[]>() {
        public String[] apply(final String it) {
          return it.split(" ");
        }
      };
      final List<String[]> split1 = ListExtensions.<String, String[]>map(((List<String>)Conversions.doWrapArray((line.split(": ")[1]).split("\\. "))), _function);
      int _parseInt = Integer.parseInt(split1.get(0)[4]);
      Pair<String, Integer> _mappedTo = Pair.<String, Integer>of("ore", Integer.valueOf(_parseInt));
      HashMap<String, Integer> _newHashMap = CollectionLiterals.<String, Integer>newHashMap(_mappedTo);
      Day19.Resources _resources = new Day19.Resources(_newHashMap);
      this.robots_costs.put("ore", _resources);
      int _parseInt_1 = Integer.parseInt(split1.get(1)[4]);
      Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of("ore", Integer.valueOf(_parseInt_1));
      HashMap<String, Integer> _newHashMap_1 = CollectionLiterals.<String, Integer>newHashMap(_mappedTo_1);
      Day19.Resources _resources_1 = new Day19.Resources(_newHashMap_1);
      this.robots_costs.put("clay", _resources_1);
      final String[] split2 = split1.get(2);
      int _parseInt_2 = Integer.parseInt(split2[4]);
      Pair<String, Integer> _mappedTo_2 = Pair.<String, Integer>of("ore", Integer.valueOf(_parseInt_2));
      int _parseInt_3 = Integer.parseInt(split2[7]);
      Pair<String, Integer> _mappedTo_3 = Pair.<String, Integer>of("clay", Integer.valueOf(_parseInt_3));
      HashMap<String, Integer> _newHashMap_2 = CollectionLiterals.<String, Integer>newHashMap(_mappedTo_2, _mappedTo_3);
      Day19.Resources _resources_2 = new Day19.Resources(_newHashMap_2);
      this.robots_costs.put("obsidian", _resources_2);
      final String[] split3 = split1.get(3);
      int _parseInt_4 = Integer.parseInt(split3[4]);
      Pair<String, Integer> _mappedTo_4 = Pair.<String, Integer>of("ore", Integer.valueOf(_parseInt_4));
      int _parseInt_5 = Integer.parseInt(split3[7]);
      Pair<String, Integer> _mappedTo_5 = Pair.<String, Integer>of("obsidian", Integer.valueOf(_parseInt_5));
      HashMap<String, Integer> _newHashMap_3 = CollectionLiterals.<String, Integer>newHashMap(_mappedTo_4, _mappedTo_5);
      Day19.Resources _resources_3 = new Day19.Resources(_newHashMap_3);
      this.robots_costs.put("geode", _resources_3);
    }

    public String toString() {
      return this.robots_costs.toString();
    }

    public HashMap<String, Pair<Integer, Day19.Resources>> durationsToBuild(final Day19.Resources initial, final Day19.Resources production) {
      HashMap<String, Pair<Integer, Day19.Resources>> _xblockexpression = null;
      {
        final HashMap<String, Pair<Integer, Day19.Resources>> output = CollectionLiterals.<String, Pair<Integer, Day19.Resources>>newHashMap();
        final BiConsumer<String, Day19.Resources> _function = new BiConsumer<String, Day19.Resources>() {
          public void accept(final String key, final Day19.Resources cost) {
            if ((((cost.lacks("ore") || production.has("ore")) && (cost.lacks("clay") || production.has("clay"))) && (cost.lacks("obsidian") || production.has("obsidian")))) {
              int i = 1;
              Day19.Resources current_resources = initial;
              while ((!(current_resources.contains(cost)).booleanValue())) {
                {
                  current_resources = current_resources.add(production);
                  i++;
                }
              }
              Day19.Resources _subtract = current_resources.subtract(cost);
              Pair<Integer, Day19.Resources> _mappedTo = Pair.<Integer, Day19.Resources>of(Integer.valueOf(i), _subtract);
              output.put(key, _mappedTo);
            }
          }
        };
        this.robots_costs.forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public Integer maxRequested(final String s) {
      final Function1<Day19.Resources, Integer> _function = new Function1<Day19.Resources, Integer>() {
        public Integer apply(final Day19.Resources it) {
          return it.get(s);
        }
      };
      return IterableExtensions.<Day19.Resources, Integer>maxBy(this.robots_costs.values(), _function).get(s);
    }
  }

  public static class RobotState implements State {
    private final Day19.Resources robots;

    private final Day19.Resources resources;

    private final int time;

    private final int _hashCode;

    private final boolean _isGoal;

    private final int _minToGoal;

    public RobotState(final Day19.Resources _robots, final Day19.Resources _resources, final int _time) {
      this.robots = _robots;
      this.resources = _resources;
      this.time = _time;
      this._hashCode = ((("" + this.robots) + this.resources) + Integer.valueOf(this.time)).hashCode();
      this._isGoal = (this.time == Day19.MAX_TIME);
      this._minToGoal = (((-(Day19.MAX_TIME - this.time)) * ((Day19.MAX_TIME - this.time) - 1)) / 2);
    }

    public RobotState() {
      this(new Day19.Resources(CollectionLiterals.<String, Integer>newHashMap(Pair.<String, Integer>of("ore", Integer.valueOf(1)))), new Day19.Resources(), 0);
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
        final ArrayList<Pair<State, Integer>> output = CollectionLiterals.<Pair<State, Integer>>newArrayList();
        final int remaining_duration = (Day19.MAX_TIME - this.time);
        final Function2<String, Pair<Integer, Day19.Resources>, Boolean> _function = new Function2<String, Pair<Integer, Day19.Resources>, Boolean>() {
          public Boolean apply(final String k, final Pair<Integer, Day19.Resources> v) {
            Integer _key = v.getKey();
            return Boolean.valueOf(((_key).intValue() < remaining_duration));
          }
        };
        final Map<String, Pair<Integer, Day19.Resources>> durations = MapExtensions.<String, Pair<Integer, Day19.Resources>>filter(Day19.current_blueprint.durationsToBuild(this.resources, this.robots), _function);
        if ((durations.containsKey("geode") && ((durations.get("geode").getKey()).intValue() == 0))) {
          final Function2<String, Pair<Integer, Day19.Resources>, Boolean> _function_1 = new Function2<String, Pair<Integer, Day19.Resources>, Boolean>() {
            public Boolean apply(final String k, final Pair<Integer, Day19.Resources> v) {
              return Boolean.valueOf(k.equals("geode"));
            }
          };
          MapExtensions.<String, Pair<Integer, Day19.Resources>>filter(durations, _function_1);
        } else {
          final Function2<String, Pair<Integer, Day19.Resources>, Boolean> _function_2 = new Function2<String, Pair<Integer, Day19.Resources>, Boolean>() {
            public Boolean apply(final String k, final Pair<Integer, Day19.Resources> v) {
              return Boolean.valueOf((k.equals("geode") || (Day19.current_blueprint.maxRequested(k).compareTo(RobotState.this.robots.get(k)) > 0)));
            }
          };
          MapExtensions.<String, Pair<Integer, Day19.Resources>>filter(durations, _function_2);
        }
        boolean _isEmpty = durations.isEmpty();
        if (_isEmpty) {
          Day19.Resources _resources = new Day19.Resources(this.robots.content);
          Day19.Resources _add = this.resources.add(this.robots.times(remaining_duration));
          Day19.RobotState _robotState = new Day19.RobotState(_resources, _add, 
            Day19.MAX_TIME);
          Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _robotState), Integer.valueOf(0));
          output.add(_mappedTo);
        } else {
          final BiConsumer<String, Pair<Integer, Day19.Resources>> _function_3 = new BiConsumer<String, Pair<Integer, Day19.Resources>>() {
            public void accept(final String k, final Pair<Integer, Day19.Resources> v) {
              Day19.Resources _addRobot = RobotState.this.robots.addRobot(k);
              Day19.Resources _value = v.getValue();
              Integer _key = v.getKey();
              int _plus = ((_key).intValue() + RobotState.this.time);
              Day19.RobotState _robotState = new Day19.RobotState(_addRobot, _value, _plus);
              int _xifexpression = (int) 0;
              boolean _equals = k.equals("geode");
              if (_equals) {
                Integer _key_1 = v.getKey();
                int _plus_1 = ((_key_1).intValue() + RobotState.this.time);
                int _plus_2 = (_plus_1 + 1);
                _xifexpression = ((-Day19.MAX_TIME) + _plus_2);
              } else {
                _xifexpression = 0;
              }
              Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _robotState), Integer.valueOf(_xifexpression));
              output.add(_mappedTo);
            }
          };
          durations.forEach(_function_3);
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public int hashCode() {
      return this._hashCode;
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day19.RobotState) {
        _matched=true;
        _switchResult = (((((Day19.RobotState)other).time == this.time) && ((Day19.RobotState)other).robots.equals(this.robots)) && ((Day19.RobotState)other).resources.equals(this.resources));
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  private static final List<Day19.Blueprint> blueprints = ListExtensions.<String, Day19.Blueprint>map(new InputLoader(Integer.valueOf(2022), Integer.valueOf(19)).getInputs(), new Function1<String, Day19.Blueprint>() {
    public Day19.Blueprint apply(final String it) {
      return new Day19.Blueprint(it);
    }
  });

  private static final int MAX_TIME = 24;

  private static Day19.Blueprint current_blueprint;

  public static void main(final String[] args) {
    int _size = Day19.blueprints.size();
    final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer acc, final Integer v) {
        int _xblockexpression = (int) 0;
        {
          InputOutput.<Integer>println(v);
          Day19.current_blueprint = Day19.blueprints.get((v).intValue());
          Day19.RobotState _robotState = new Day19.RobotState();
          final Integer max_number_of_geodes = new AStar(_robotState).run().getMinDistance();
          InputOutput.<Integer>println(max_number_of_geodes);
          _xblockexpression = ((acc).intValue() - ((max_number_of_geodes).intValue() * ((v).intValue() + 1)));
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(new ExclusiveRange(0, _size, true), Integer.valueOf(0), _function));
  }
}
