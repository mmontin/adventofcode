package advent2021.puzzle23;

import adventutils.astar.State;
import adventutils.geometry.Coordinate;
import com.google.common.base.Objects;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class AmphipodState implements State {
  private static int roomSize = 4;

  private static final Map<Integer, Integer> numberToEnergy = CollectionLiterals.<Integer, Integer>newHashMap(
    Pair.<Integer, Integer>of(Integer.valueOf(2), Integer.valueOf(1)), Pair.<Integer, Integer>of(Integer.valueOf(4), Integer.valueOf(10)), Pair.<Integer, Integer>of(Integer.valueOf(6), Integer.valueOf(100)), Pair.<Integer, Integer>of(Integer.valueOf(8), Integer.valueOf(1000)));

  private static final Coordinate hallway0 = new Coordinate(0, 0);

  private static final Coordinate hallway1 = new Coordinate(0, 1);

  private static final Coordinate hallway3 = new Coordinate(0, 3);

  private static final Coordinate hallway5 = new Coordinate(0, 5);

  private static final Coordinate hallway7 = new Coordinate(0, 7);

  private static final Coordinate hallway9 = new Coordinate(0, 9);

  private static final Coordinate hallway10 = new Coordinate(0, 10);

  private static final Coordinate room12 = new Coordinate(1, 2);

  private static final Coordinate room22 = new Coordinate(2, 2);

  private static final Coordinate room14 = new Coordinate(1, 4);

  private static final Coordinate room24 = new Coordinate(2, 4);

  private static final Coordinate room16 = new Coordinate(1, 6);

  private static final Coordinate room26 = new Coordinate(2, 6);

  private static final Coordinate room18 = new Coordinate(1, 8);

  private static final Coordinate room28 = new Coordinate(2, 8);

  private static final Coordinate room32 = new Coordinate(3, 2);

  private static final Coordinate room42 = new Coordinate(4, 2);

  private static final Coordinate room34 = new Coordinate(3, 4);

  private static final Coordinate room44 = new Coordinate(4, 4);

  private static final Coordinate room36 = new Coordinate(3, 6);

  private static final Coordinate room46 = new Coordinate(4, 6);

  private static final Coordinate room38 = new Coordinate(3, 8);

  private static final Coordinate room48 = new Coordinate(4, 8);

  private static final Coordinate cantStop2 = new Coordinate(0, 2);

  private static final Coordinate cantStop4 = new Coordinate(0, 4);

  private static final Coordinate cantStop6 = new Coordinate(0, 6);

  private static final Coordinate cantStop8 = new Coordinate(0, 8);

  private static final Set<Coordinate> hallway = CollectionLiterals.<Coordinate>newHashSet(
    AmphipodState.hallway0, AmphipodState.hallway1, AmphipodState.hallway3, AmphipodState.hallway5, AmphipodState.hallway7, AmphipodState.hallway9, AmphipodState.hallway10);

  private static final Set<Coordinate> rooms = new Function0<Set<Coordinate>>() {
    public Set<Coordinate> apply() {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet(
          AmphipodState.room12, AmphipodState.room22, AmphipodState.room14, AmphipodState.room24, AmphipodState.room16, AmphipodState.room26, AmphipodState.room18, AmphipodState.room28);
        if ((AmphipodState.roomSize == 4)) {
          output.addAll(CollectionLiterals.<Coordinate>newHashSet(AmphipodState.room32, AmphipodState.room42, AmphipodState.room34, AmphipodState.room44, AmphipodState.room36, AmphipodState.room46, AmphipodState.room38, AmphipodState.room48));
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Set<Coordinate> cantStop = CollectionLiterals.<Coordinate>newHashSet(
    AmphipodState.cantStop2, AmphipodState.cantStop4, AmphipodState.cantStop6, AmphipodState.cantStop8);

  private static final Set<Coordinate> all = new Function0<Set<Coordinate>>() {
    public Set<Coordinate> apply() {
      HashSet<Coordinate> _xblockexpression = null;
      {
        final HashSet<Coordinate> output = new HashSet<Coordinate>(AmphipodState.hallway);
        output.addAll(AmphipodState.rooms);
        output.addAll(AmphipodState.cantStop);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Map<Coordinate, Integer> init = new Function0<Map<Coordinate, Integer>>() {
    public Map<Coordinate, Integer> apply() {
      HashMap<Coordinate, Integer> _xifexpression = null;
      if ((AmphipodState.roomSize == 2)) {
        Pair<Coordinate, Integer> _mappedTo = Pair.<Coordinate, Integer>of(AmphipodState.room12, Integer.valueOf(6));
        Pair<Coordinate, Integer> _mappedTo_1 = Pair.<Coordinate, Integer>of(AmphipodState.room22, Integer.valueOf(8));
        Pair<Coordinate, Integer> _mappedTo_2 = Pair.<Coordinate, Integer>of(AmphipodState.room14, Integer.valueOf(2));
        Pair<Coordinate, Integer> _mappedTo_3 = Pair.<Coordinate, Integer>of(AmphipodState.room24, Integer.valueOf(6));
        Pair<Coordinate, Integer> _mappedTo_4 = Pair.<Coordinate, Integer>of(AmphipodState.room16, Integer.valueOf(4));
        Pair<Coordinate, Integer> _mappedTo_5 = Pair.<Coordinate, Integer>of(AmphipodState.room26, Integer.valueOf(2));
        Pair<Coordinate, Integer> _mappedTo_6 = Pair.<Coordinate, Integer>of(AmphipodState.room18, Integer.valueOf(8));
        Pair<Coordinate, Integer> _mappedTo_7 = Pair.<Coordinate, Integer>of(AmphipodState.room28, Integer.valueOf(4));
        _xifexpression = CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo, _mappedTo_1, _mappedTo_2, _mappedTo_3, _mappedTo_4, _mappedTo_5, _mappedTo_6, _mappedTo_7);
      } else {
        Pair<Coordinate, Integer> _mappedTo_8 = Pair.<Coordinate, Integer>of(AmphipodState.room12, Integer.valueOf(6));
        Pair<Coordinate, Integer> _mappedTo_9 = Pair.<Coordinate, Integer>of(AmphipodState.room42, Integer.valueOf(8));
        Pair<Coordinate, Integer> _mappedTo_10 = Pair.<Coordinate, Integer>of(AmphipodState.room14, Integer.valueOf(2));
        Pair<Coordinate, Integer> _mappedTo_11 = Pair.<Coordinate, Integer>of(AmphipodState.room44, Integer.valueOf(6));
        Pair<Coordinate, Integer> _mappedTo_12 = Pair.<Coordinate, Integer>of(AmphipodState.room16, Integer.valueOf(4));
        Pair<Coordinate, Integer> _mappedTo_13 = Pair.<Coordinate, Integer>of(AmphipodState.room46, Integer.valueOf(2));
        Pair<Coordinate, Integer> _mappedTo_14 = Pair.<Coordinate, Integer>of(AmphipodState.room18, Integer.valueOf(8));
        Pair<Coordinate, Integer> _mappedTo_15 = Pair.<Coordinate, Integer>of(AmphipodState.room48, Integer.valueOf(4));
        Pair<Coordinate, Integer> _mappedTo_16 = Pair.<Coordinate, Integer>of(AmphipodState.room22, Integer.valueOf(8));
        Pair<Coordinate, Integer> _mappedTo_17 = Pair.<Coordinate, Integer>of(AmphipodState.room32, Integer.valueOf(8));
        Pair<Coordinate, Integer> _mappedTo_18 = Pair.<Coordinate, Integer>of(AmphipodState.room24, Integer.valueOf(6));
        Pair<Coordinate, Integer> _mappedTo_19 = Pair.<Coordinate, Integer>of(AmphipodState.room34, Integer.valueOf(4));
        Pair<Coordinate, Integer> _mappedTo_20 = Pair.<Coordinate, Integer>of(AmphipodState.room26, Integer.valueOf(4));
        Pair<Coordinate, Integer> _mappedTo_21 = Pair.<Coordinate, Integer>of(AmphipodState.room36, Integer.valueOf(2));
        Pair<Coordinate, Integer> _mappedTo_22 = Pair.<Coordinate, Integer>of(AmphipodState.room28, Integer.valueOf(2));
        Pair<Coordinate, Integer> _mappedTo_23 = Pair.<Coordinate, Integer>of(AmphipodState.room38, Integer.valueOf(6));
        _xifexpression = CollectionLiterals.<Coordinate, Integer>newHashMap(_mappedTo_8, _mappedTo_9, _mappedTo_10, _mappedTo_11, _mappedTo_12, _mappedTo_13, _mappedTo_14, _mappedTo_15, _mappedTo_16, _mappedTo_17, _mappedTo_18, _mappedTo_19, _mappedTo_20, _mappedTo_21, _mappedTo_22, _mappedTo_23);
      }
      return _xifexpression;
    }
  }.apply();

  public static int distance(final Coordinate c1, final Coordinate c2) {
    int _xifexpression = (int) 0;
    if (((AmphipodState.rooms.contains(c1) && AmphipodState.rooms.contains(c2)) && (c1.getY() != c2.getY()))) {
      int _x = c1.getX();
      int _x_1 = c2.getX();
      int _plus = (_x + _x_1);
      int _y = c1.getY();
      int _y_1 = c2.getY();
      int _minus = (_y - _y_1);
      int _abs = Math.abs(_minus);
      _xifexpression = (_plus + _abs);
    } else {
      _xifexpression = c1.manhattanDistanceTo(c2);
    }
    return _xifexpression;
  }

  private final Map<Coordinate, Integer> amphipods;

  private final int code;

  private final int energyToNormalize;

  private final boolean isFinal;

  private final int minBound;

  public AmphipodState() {
    this(new HashMap<Coordinate, Integer>(AmphipodState.init));
  }

  public AmphipodState(final HashMap<Coordinate, Integer> amphipods_) {
    this.amphipods = amphipods_;
    this.energyToNormalize = this.normalize();
    final Function2<Integer, Map.Entry<Coordinate, Integer>, Integer> _function = new Function2<Integer, Map.Entry<Coordinate, Integer>, Integer>() {
      public Integer apply(final Integer v, final Map.Entry<Coordinate, Integer> e) {
        int _hashCode = e.getKey().hashCode();
        Integer _value = e.getValue();
        int _multiply = (_hashCode * (_value).intValue());
        return Integer.valueOf(((v).intValue() + _multiply));
      }
    };
    this.code = (IterableExtensions.<Map.Entry<Coordinate, Integer>, Integer>fold(this.amphipods.entrySet(), Integer.valueOf(0), _function)).intValue();
    final Function2<Boolean, Map.Entry<Coordinate, Integer>, Boolean> _function_1 = new Function2<Boolean, Map.Entry<Coordinate, Integer>, Boolean>() {
      public Boolean apply(final Boolean v, final Map.Entry<Coordinate, Integer> e) {
        return Boolean.valueOf(((v).booleanValue() && AmphipodState.this.isPlaced(e.getKey(), e.getValue())));
      }
    };
    this.isFinal = (IterableExtensions.<Map.Entry<Coordinate, Integer>, Boolean>fold(this.amphipods.entrySet(), Boolean.valueOf(true), _function_1)).booleanValue();
    final HashSet<Coordinate> used = CollectionLiterals.<Coordinate>newHashSet();
    final Function1<Map.Entry<Coordinate, Integer>, Boolean> _function_2 = new Function1<Map.Entry<Coordinate, Integer>, Boolean>() {
      public Boolean apply(final Map.Entry<Coordinate, Integer> it) {
        boolean _isPlaced = AmphipodState.this.isPlaced(it.getKey(), it.getValue());
        return Boolean.valueOf((!_isPlaced));
      }
    };
    final Function2<Integer, Map.Entry<Coordinate, Integer>, Integer> _function_3 = new Function2<Integer, Map.Entry<Coordinate, Integer>, Integer>() {
      public Integer apply(final Integer v, final Map.Entry<Coordinate, Integer> c) {
        int _xblockexpression = (int) 0;
        {
          final Integer value = c.getValue();
          final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
            public Boolean apply(final Coordinate it) {
              return Boolean.valueOf((((it.getY() == (value).intValue()) && ((!AmphipodState.this.amphipods.containsKey(it)) || (!AmphipodState.this.isPlaced(it, AmphipodState.this.amphipods.get(it))))) && 
                (!used.contains(it))));
            }
          };
          final Function1<Coordinate, Integer> _function_1 = new Function1<Coordinate, Integer>() {
            public Integer apply(final Coordinate it) {
              int _x = it.getX();
              return Integer.valueOf((-_x));
            }
          };
          final Coordinate to = IterableExtensions.<Coordinate, Integer>sortBy(IterableExtensions.<Coordinate>filter(AmphipodState.rooms, _function), _function_1).get(0);
          used.add(to);
          int _distance = AmphipodState.distance(c.getKey(), to);
          Integer _get = AmphipodState.numberToEnergy.get(value);
          int _multiply = (_distance * (_get).intValue());
          _xblockexpression = ((v).intValue() + _multiply);
        }
        return Integer.valueOf(_xblockexpression);
      }
    };
    this.minBound = (IterableExtensions.<Map.Entry<Coordinate, Integer>, Integer>fold(IterableExtensions.<Map.Entry<Coordinate, Integer>>filter(this.amphipods.entrySet(), _function_2), Integer.valueOf(0), _function_3)).intValue();
  }

  public int getEnergy() {
    return this.energyToNormalize;
  }

  private boolean isPlaced(final Coordinate c, final Integer value) {
    Boolean _switchResult = null;
    int _x = c.getX();
    boolean _matched = false;
    if (Objects.equal(_x, 0)) {
      _matched=true;
      _switchResult = Boolean.valueOf(false);
    }
    if (!_matched) {
      if (Objects.equal(_x, AmphipodState.roomSize)) {
        _matched=true;
        _switchResult = Boolean.valueOf(value.equals(Integer.valueOf(c.getY())));
      }
    }
    if (!_matched) {
      int _x_1 = c.getX();
      int _plus = (_x_1 + 1);
      final Function2<Boolean, Integer, Boolean> _function = new Function2<Boolean, Integer, Boolean>() {
        public Boolean apply(final Boolean v, final Integer i) {
          return Boolean.valueOf(((v).booleanValue() && value.equals(AmphipodState.this.amphipods.get(new Coordinate((i).intValue(), c.getY())))));
        }
      };
      _switchResult = IterableExtensions.<Integer, Boolean>fold(new IntegerRange(_plus, AmphipodState.roomSize), Boolean.valueOf(value.equals(Integer.valueOf(c.getY()))), _function);
    }
    return (_switchResult).booleanValue();
  }

  public void status() {
    final Consumer<Map.Entry<Coordinate, Integer>> _function = new Consumer<Map.Entry<Coordinate, Integer>>() {
      public void accept(final Map.Entry<Coordinate, Integer> it) {
        String _plus = (it + " : ");
        boolean _isPlaced = AmphipodState.this.isPlaced(it.getKey(), it.getValue());
        String _plus_1 = (_plus + Boolean.valueOf(_isPlaced));
        InputOutput.<String>println(_plus_1);
      }
    };
    this.amphipods.entrySet().forEach(_function);
    final Consumer<Coordinate> _function_1 = new Consumer<Coordinate>() {
      public void accept(final Coordinate it) {
        InputOutput.<HashSet<Coordinate>>println(AmphipodState.this.reachableSpots(it));
      }
    };
    this.amphipods.keySet().forEach(_function_1);
  }

  private HashSet<Coordinate> emptyNeighboursOfSet(final Set<Coordinate> setc, final Set<Coordinate> newOnes) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      final Consumer<Coordinate> _function = new Consumer<Coordinate>() {
        public void accept(final Coordinate it) {
          final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
            public Boolean apply(final Coordinate c) {
              return Boolean.valueOf(((AmphipodState.all.contains(c) && (!AmphipodState.this.amphipods.containsKey(c))) && (!setc.contains(c))));
            }
          };
          final Set<Coordinate> filteredNeighbours = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate>filter(it.noDiagonalUnboundedNeighbours(), _function));
          setc.addAll(filteredNeighbours);
          output.addAll(filteredNeighbours);
        }
      };
      newOnes.forEach(_function);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  private HashSet<Coordinate> reachableSpots(final Coordinate c) {
    HashSet<Coordinate> _xblockexpression = null;
    {
      HashSet<Coordinate> newOnes = CollectionLiterals.<Coordinate>newHashSet(c);
      final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
      while ((!newOnes.isEmpty())) {
        newOnes = this.emptyNeighboursOfSet(output, newOnes);
      }
      output.removeAll(AmphipodState.cantStop);
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public int normalize() {
    int _xblockexpression = (int) 0;
    {
      Pair<Coordinate, Coordinate> c = null;
      int totalEnergy = 0;
      do {
        {
          final Function1<Map.Entry<Coordinate, Integer>, Boolean> _function = new Function1<Map.Entry<Coordinate, Integer>, Boolean>() {
            public Boolean apply(final Map.Entry<Coordinate, Integer> it) {
              boolean _isPlaced = AmphipodState.this.isPlaced(it.getKey(), it.getValue());
              return Boolean.valueOf((!_isPlaced));
            }
          };
          final Function1<Map.Entry<Coordinate, Integer>, Pair<Coordinate, Coordinate>> _function_1 = new Function1<Map.Entry<Coordinate, Integer>, Pair<Coordinate, Coordinate>>() {
            public Pair<Coordinate, Coordinate> apply(final Map.Entry<Coordinate, Integer> e) {
              Coordinate _key = e.getKey();
              final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it) {
                  return Boolean.valueOf(AmphipodState.this.isPlaced(it, e.getValue()));
                }
              };
              Coordinate _findFirst = IterableExtensions.<Coordinate>findFirst(AmphipodState.this.reachableSpots(e.getKey()), _function);
              return new Pair<Coordinate, Coordinate>(_key, _findFirst);
            }
          };
          final Function1<Pair<Coordinate, Coordinate>, Boolean> _function_2 = new Function1<Pair<Coordinate, Coordinate>, Boolean>() {
            public Boolean apply(final Pair<Coordinate, Coordinate> it) {
              Coordinate _value = it.getValue();
              return Boolean.valueOf((_value != null));
            }
          };
          c = IterableExtensions.<Pair<Coordinate, Coordinate>>findFirst(IterableExtensions.<Map.Entry<Coordinate, Integer>, Pair<Coordinate, Coordinate>>map(IterableExtensions.<Map.Entry<Coordinate, Integer>>filter(this.amphipods.entrySet(), _function), _function_1), _function_2);
          if ((c != null)) {
            final Integer value = this.amphipods.remove(c.getKey());
            int _talEnergy = totalEnergy;
            int _distance = AmphipodState.distance(c.getKey(), c.getValue());
            Integer _get = AmphipodState.numberToEnergy.get(value);
            int _multiply = (_distance * (_get).intValue());
            totalEnergy = (_talEnergy + _multiply);
            this.amphipods.put(c.getValue(), value);
          }
        }
      } while((c != null));
      _xblockexpression = totalEnergy;
    }
    return _xblockexpression;
  }

  public boolean isGoal() {
    return this.isFinal;
  }

  public int minToGoal() {
    return this.minBound;
  }

  public List<Pair<State, Integer>> neighbours() {
    List<Pair<State, Integer>> _xblockexpression = null;
    {
      final HashMap<AmphipodState, Integer> output = CollectionLiterals.<AmphipodState, Integer>newHashMap();
      final Function1<Map.Entry<Coordinate, Integer>, Boolean> _function = new Function1<Map.Entry<Coordinate, Integer>, Boolean>() {
        public Boolean apply(final Map.Entry<Coordinate, Integer> it) {
          return Boolean.valueOf(AmphipodState.rooms.contains(it.getKey()));
        }
      };
      final Consumer<Map.Entry<Coordinate, Integer>> _function_1 = new Consumer<Map.Entry<Coordinate, Integer>>() {
        public void accept(final Map.Entry<Coordinate, Integer> e) {
          final Coordinate from = e.getKey();
          final Integer value = e.getValue();
          final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
            public Boolean apply(final Coordinate it) {
              return Boolean.valueOf(AmphipodState.hallway.contains(it));
            }
          };
          final Consumer<Coordinate> _function_1 = new Consumer<Coordinate>() {
            public void accept(final Coordinate to) {
              final HashMap<Coordinate, Integer> newMap = new HashMap<Coordinate, Integer>(AmphipodState.this.amphipods);
              newMap.put(to, newMap.remove(from));
              final AmphipodState newState = new AmphipodState(newMap);
              int _distance = AmphipodState.distance(from, to);
              Integer _get = AmphipodState.numberToEnergy.get(value);
              int _multiply = (_distance * (_get).intValue());
              final int energy = (_multiply + newState.energyToNormalize);
              final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
                public Integer apply(final Integer u, final Integer v) {
                  return Integer.valueOf(Math.min((u).intValue(), (v).intValue()));
                }
              };
              output.merge(newState, Integer.valueOf(energy), _function);
            }
          };
          IterableExtensions.<Coordinate>filter(AmphipodState.this.reachableSpots(from), _function).forEach(_function_1);
        }
      };
      IterableExtensions.<Map.Entry<Coordinate, Integer>>filter(this.amphipods.entrySet(), _function).forEach(_function_1);
      final Function1<Map.Entry<AmphipodState, Integer>, Pair<State, Integer>> _function_2 = new Function1<Map.Entry<AmphipodState, Integer>, Pair<State, Integer>>() {
        public Pair<State, Integer> apply(final Map.Entry<AmphipodState, Integer> it) {
          AmphipodState _key = it.getKey();
          Integer _value = it.getValue();
          return new Pair<State, Integer>(((State) _key), _value);
        }
      };
      _xblockexpression = IterableExtensions.<Pair<State, Integer>>toList(IterableExtensions.<Map.Entry<AmphipodState, Integer>, Pair<State, Integer>>map(output.entrySet(), _function_2));
    }
    return _xblockexpression;
  }

  public boolean equals(final Object other) {
    return this.amphipods.equals(((AmphipodState) other).amphipods);
  }

  public int hashCode() {
    return this.code;
  }
}
