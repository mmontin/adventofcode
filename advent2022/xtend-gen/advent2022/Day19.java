package advent2022;

import adventutils.astar.AStar;
import adventutils.astar.State;
import adventutils.input.InputLoader;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.MapExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day19 {
  public static class Resources {
    private int ore;

    private int clay;

    private int obsidian;

    private int geode;

    public Resources() {
      this(0, 0, 0, 0);
    }

    public Resources(final int _ore, final int _clay, final int _obsidian, final int _geode) {
      this.ore = _ore;
      this.clay = _clay;
      this.obsidian = _obsidian;
      this.geode = _geode;
    }

    public Resources(final List<Integer> input) {
      this((input.get(0)).intValue(), (input.get(1)).intValue(), (input.get(2)).intValue(), (input.get(3)).intValue());
    }

    public Resources(final Day19.Resources other) {
      this(other.ore, other.clay, other.obsidian, other.geode);
    }

    public boolean includedIn(final Day19.Resources other) {
      return ((((this.ore <= other.ore) && (this.clay <= other.clay)) && (this.obsidian <= other.obsidian)) && (this.geode <= other.geode));
    }

    public Day19.Resources add(final Day19.Resources other) {
      return new Day19.Resources((this.ore + other.ore), (this.clay + other.clay), (this.obsidian + other.obsidian), (this.geode + other.geode));
    }

    public Day19.Resources addRobot(final String s) {
      Day19.Resources _switchResult = null;
      boolean _matched = false;
      if (Objects.equal(s, "ore")) {
        _matched=true;
        _switchResult = new Day19.Resources(1, 0, 0, 0);
      }
      if (!_matched) {
        if (Objects.equal(s, "clay")) {
          _matched=true;
          _switchResult = new Day19.Resources(0, 1, 0, 0);
        }
      }
      if (!_matched) {
        if (Objects.equal(s, "obsidian")) {
          _matched=true;
          _switchResult = new Day19.Resources(0, 0, 1, 0);
        }
      }
      if (!_matched) {
        _switchResult = new Day19.Resources(0, 0, 0, 1);
      }
      return this.add(_switchResult);
    }

    public int get(final String s) {
      int _switchResult = (int) 0;
      boolean _matched = false;
      if (Objects.equal(s, "ore")) {
        _matched=true;
        _switchResult = this.ore;
      }
      if (!_matched) {
        if (Objects.equal(s, "clay")) {
          _matched=true;
          _switchResult = this.clay;
        }
      }
      if (!_matched) {
        if (Objects.equal(s, "obsidian")) {
          _matched=true;
          _switchResult = this.obsidian;
        }
      }
      if (!_matched) {
        _switchResult = this.geode;
      }
      return _switchResult;
    }

    public Day19.Resources subtract(final Day19.Resources other) {
      return new Day19.Resources((this.ore - other.ore), (this.clay - other.clay), (this.obsidian - other.obsidian), (this.geode - other.geode));
    }

    public Day19.Resources times(final int n) {
      return new Day19.Resources((this.ore * n), (this.clay * n), (this.obsidian * n), (this.geode * n));
    }

    public String toString() {
      return (((((((("(" + Integer.valueOf(this.ore)) + ",") + Integer.valueOf(this.clay)) + ",") + Integer.valueOf(this.obsidian)) + ",") + Integer.valueOf(this.geode)) + ")");
    }

    public int hashCode() {
      return this.toString().hashCode();
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day19.Resources) {
        _matched=true;
        _switchResult = ((((((Day19.Resources)other).clay == this.clay) && (((Day19.Resources)other).ore == this.ore)) && (((Day19.Resources)other).obsidian == this.obsidian)) && (((Day19.Resources)other).geode == this.geode));
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
      Day19.Resources _resources = new Day19.Resources(_parseInt, 0, 0, 0);
      this.robots_costs.put("ore", _resources);
      int _parseInt_1 = Integer.parseInt(split1.get(1)[4]);
      Day19.Resources _resources_1 = new Day19.Resources(_parseInt_1, 0, 0, 0);
      this.robots_costs.put("clay", _resources_1);
      final String[] split2 = split1.get(2);
      int _parseInt_2 = Integer.parseInt(split2[4]);
      int _parseInt_3 = Integer.parseInt(split2[7]);
      Day19.Resources _resources_2 = new Day19.Resources(_parseInt_2, _parseInt_3, 0, 0);
      this.robots_costs.put("obsidian", _resources_2);
      final String[] split3 = split1.get(3);
      int _parseInt_4 = Integer.parseInt(split3[4]);
      int _parseInt_5 = Integer.parseInt(split3[7]);
      Day19.Resources _resources_3 = new Day19.Resources(_parseInt_4, 0, _parseInt_5, 0);
      this.robots_costs.put("geode", _resources_3);
    }

    public String toString() {
      return this.robots_costs.toString();
    }

    public HashMap<String, Integer> durationsToBuild(final Day19.Resources initial, final Day19.Resources production) {
      HashMap<String, Integer> _xblockexpression = null;
      {
        final HashMap<String, Integer> output = CollectionLiterals.<String, Integer>newHashMap();
        final BiConsumer<String, Day19.Resources> _function = new BiConsumer<String, Day19.Resources>() {
          public void accept(final String key, final Day19.Resources value) {
            if ((((!((value.ore != 0) && (production.ore == 0))) && 
              (!((value.clay != 0) && (production.clay == 0)))) && 
              (!((value.obsidian != 0) && (production.obsidian == 0))))) {
              int i = 1;
              Day19.Resources current_resources = initial;
              while ((!value.includedIn(current_resources))) {
                {
                  current_resources = current_resources.add(production);
                  i++;
                }
              }
              output.put(key, Integer.valueOf(i));
            }
          }
        };
        this.robots_costs.forEach(_function);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public Integer maxRequested(final String s) {
      final Function2<Integer, Day19.Resources, Integer> _function = new Function2<Integer, Day19.Resources, Integer>() {
        public Integer apply(final Integer acc, final Day19.Resources v) {
          int _switchResult = (int) 0;
          boolean _matched = false;
          if (Objects.equal(s, "ore")) {
            _matched=true;
            _switchResult = v.ore;
          }
          if (!_matched) {
            if (Objects.equal(s, "clay")) {
              _matched=true;
              _switchResult = v.clay;
            }
          }
          if (!_matched) {
            if (Objects.equal(s, "obsidian")) {
              _matched=true;
              _switchResult = v.obsidian;
            }
          }
          if (!_matched) {
            _switchResult = 0;
          }
          return Integer.valueOf(Math.max((acc).intValue(), _switchResult));
        }
      };
      return IterableExtensions.<Day19.Resources, Integer>fold(this.robots_costs.values(), Integer.valueOf(0), _function);
    }
  }

  public static class RobotsState implements State {
    private final Day19.Blueprint blueprint;

    private final Day19.Resources robots;

    private final Day19.Resources resources;

    private final int time;

    private final int _hashCode;

    public RobotsState(final Day19.Blueprint _blueprint) {
      this(_blueprint, new Day19.Resources(1, 0, 0, 0), new Day19.Resources(), 0);
    }

    public RobotsState(final Day19.Blueprint _blueprint, final Day19.Resources _robots, final Day19.Resources _resources, final int _time) {
      this.blueprint = _blueprint;
      this.robots = _robots;
      this.resources = _resources;
      this.time = _time;
      this._hashCode = (((("" + this.blueprint) + this.robots) + this.resources) + Integer.valueOf(this.time)).hashCode();
    }

    public boolean isGoal() {
      return (this.time == Day19.MAX_TIME);
    }

    public int minToGoal() {
      int _xblockexpression = (int) 0;
      {
        final int remaining_time = (Day19.MAX_TIME - this.time);
        _xblockexpression = ((remaining_time * Day19.MAX_GEODE) - ((((remaining_time - 1) * (remaining_time - 2)) / 2) + (remaining_time * this.robots.geode)));
      }
      return _xblockexpression;
    }

    public List<Pair<State, Integer>> neighbours() {
      ArrayList<Pair<State, Integer>> _xblockexpression = null;
      {
        final ArrayList<Pair<State, Integer>> output = CollectionLiterals.<Pair<State, Integer>>newArrayList();
        final int remaining_duration = (Day19.MAX_TIME - this.time);
        final Function2<String, Integer, Boolean> _function = new Function2<String, Integer, Boolean>() {
          public Boolean apply(final String k, final Integer v) {
            return Boolean.valueOf(((v).intValue() < remaining_duration));
          }
        };
        final Map<String, Integer> durations = MapExtensions.<String, Integer>filter(this.blueprint.durationsToBuild(this.resources, this.robots), _function);
        if ((durations.containsKey("geode") && ((durations.get("geode")).intValue() == 0))) {
          final Function2<String, Integer, Boolean> _function_1 = new Function2<String, Integer, Boolean>() {
            public Boolean apply(final String k, final Integer v) {
              return Boolean.valueOf(k.equals("geode"));
            }
          };
          MapExtensions.<String, Integer>filter(durations, _function_1);
        } else {
          final Function2<String, Integer, Boolean> _function_2 = new Function2<String, Integer, Boolean>() {
            public Boolean apply(final String k, final Integer v) {
              return Boolean.valueOf((k.equals("geode") || ((RobotsState.this.blueprint.maxRequested(k)).intValue() > RobotsState.this.robots.get(k))));
            }
          };
          MapExtensions.<String, Integer>filter(durations, _function_2);
        }
        boolean _isEmpty = durations.isEmpty();
        if (_isEmpty) {
          Day19.Resources _add = this.resources.add(this.robots.times(remaining_duration));
          Day19.RobotsState _robotsState = new Day19.RobotsState(
            this.blueprint, 
            this.robots, _add, 
            Day19.MAX_TIME);
          Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _robotsState), Integer.valueOf((remaining_duration * (Day19.MAX_GEODE - this.robots.geode))));
          output.add(_mappedTo);
        } else {
          final BiConsumer<String, Integer> _function_3 = new BiConsumer<String, Integer>() {
            public void accept(final String k, final Integer v) {
              Day19.Resources _addRobot = RobotsState.this.robots.addRobot(k);
              Day19.Resources _subtract = RobotsState.this.resources.add(RobotsState.this.robots.times((v).intValue())).subtract(RobotsState.this.blueprint.robots_costs.get(k));
              Day19.RobotsState _robotsState = new Day19.RobotsState(
                RobotsState.this.blueprint, _addRobot, _subtract, 
                (RobotsState.this.time + (v).intValue()));
              Pair<State, Integer> _mappedTo = Pair.<State, Integer>of(((State) _robotsState), Integer.valueOf(((v).intValue() * (Day19.MAX_GEODE - RobotsState.this.robots.geode))));
              output.add(_mappedTo);
            }
          };
          durations.forEach(_function_3);
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public String toString() {
      return ((((("ROBOTS : " + this.robots) + " ; RESOURCES : ") + this.resources) + " ; time : ") + Integer.valueOf(this.time));
    }

    public int hashCode() {
      return this._hashCode;
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day19.RobotsState) {
        _matched=true;
        _switchResult = (((((Day19.RobotsState)other).time == this.time) && ((Day19.RobotsState)other).resources.equals(this.resources)) && ((Day19.RobotsState)other).robots.equals(this.robots));
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

  private static final int MAX_GEODE = 1000;

  private static int MAX_TIME = 24;

  public static void main(final String[] args) {
    int _size = Day19.blueprints.size();
    final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer acc, final Integer v) {
        Day19.Blueprint _get = Day19.blueprints.get(((v).intValue() - 1));
        Day19.RobotsState _robotsState = new Day19.RobotsState(_get);
        Integer _minDistance = new AStar(_robotsState).run().getMinDistance();
        int _minus = ((Day19.MAX_GEODE * Day19.MAX_TIME) - (_minDistance).intValue());
        int _multiply = ((v).intValue() * _minus);
        return Integer.valueOf(((acc).intValue() + _multiply));
      }
    };
    InputOutput.<Integer>println(
      IterableExtensions.<Integer, Integer>fold(new IntegerRange(1, _size), Integer.valueOf(0), _function));
  }
}
