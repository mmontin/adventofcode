package advent2020.puzzle20;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Predicate;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day20 {
  public static class Tile {
    public final long number;

    public final Set<Coordinate> content;

    public Tile(final long _number, final Set<Coordinate> _content) {
      this.number = _number;
      this.content = _content;
    }

    public String getBorder(final Coordinate.Direction d) {
      String _switchResult = null;
      if (d != null) {
        switch (d) {
          case UP:
            final Function2<String, Integer, String> _function = new Function2<String, Integer, String>() {
              public String apply(final String acc, final Integer i) {
                String _xifexpression = null;
                Coordinate _coordinate = new Coordinate(0, (i).intValue());
                boolean _contains = Tile.this.content.contains(_coordinate);
                if (_contains) {
                  _xifexpression = "#";
                } else {
                  _xifexpression = ".";
                }
                return (acc + _xifexpression);
              }
            };
            _switchResult = IterableExtensions.<Integer, String>fold(new IntegerRange(0, (Day20.size - 1)), "", _function);
            break;
          case DOWN:
            final Function2<String, Integer, String> _function_1 = new Function2<String, Integer, String>() {
              public String apply(final String acc, final Integer i) {
                String _xifexpression = null;
                Coordinate _coordinate = new Coordinate((Day20.size - 1), (i).intValue());
                boolean _contains = Tile.this.content.contains(_coordinate);
                if (_contains) {
                  _xifexpression = "#";
                } else {
                  _xifexpression = ".";
                }
                return (acc + _xifexpression);
              }
            };
            _switchResult = IterableExtensions.<Integer, String>fold(new IntegerRange(0, (Day20.size - 1)), "", _function_1);
            break;
          case LEFT:
            final Function2<String, Integer, String> _function_2 = new Function2<String, Integer, String>() {
              public String apply(final String acc, final Integer i) {
                String _xifexpression = null;
                Coordinate _coordinate = new Coordinate((i).intValue(), 0);
                boolean _contains = Tile.this.content.contains(_coordinate);
                if (_contains) {
                  _xifexpression = "#";
                } else {
                  _xifexpression = ".";
                }
                return (acc + _xifexpression);
              }
            };
            _switchResult = IterableExtensions.<Integer, String>fold(new IntegerRange(0, (Day20.size - 1)), "", _function_2);
            break;
          case RIGHT:
            final Function2<String, Integer, String> _function_3 = new Function2<String, Integer, String>() {
              public String apply(final String acc, final Integer i) {
                String _xifexpression = null;
                Coordinate _coordinate = new Coordinate((i).intValue(), (Day20.size - 1));
                boolean _contains = Tile.this.content.contains(_coordinate);
                if (_contains) {
                  _xifexpression = "#";
                } else {
                  _xifexpression = ".";
                }
                return (acc + _xifexpression);
              }
            };
            _switchResult = IterableExtensions.<Integer, String>fold(new IntegerRange(0, (Day20.size - 1)), "", _function_3);
            break;
          default:
            break;
        }
      }
      return _switchResult;
    }

    public boolean matchesSomewhereWithOtherName(final String border, final long _number) {
      return (((this.matchesThereButWithOtherName(border, Coordinate.Direction.UP, _number) || 
        this.matchesThereButWithOtherName(border, Coordinate.Direction.DOWN, _number)) || 
        this.matchesThereButWithOtherName(border, Coordinate.Direction.LEFT, _number)) || 
        this.matchesThereButWithOtherName(border, Coordinate.Direction.RIGHT, _number));
    }

    public boolean matchesThereButWithOtherName(final String border, final Coordinate.Direction d, final long _number) {
      return ((this.number != _number) && this.getBorder(d).equals(border));
    }

    public static List<Day20.Tile> allVariants(final long _number, final Set<Coordinate> input, final int _size) {
      List<Day20.Tile> _xblockexpression = null;
      {
        final ArrayList<HashSet<Coordinate>> list_content = CollectionLiterals.<HashSet<Coordinate>>newArrayList();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it) {
            list_content.add(CollectionLiterals.<Coordinate>newHashSet());
          }
        };
        new IntegerRange(0, 7).forEach(_function);
        IntegerRange _upTo = new IntegerRange(0, (_size - 1));
        for (final Integer i : _upTo) {
          IntegerRange _upTo_1 = new IntegerRange(0, (_size - 1));
          for (final Integer j : _upTo_1) {
            {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              boolean _contains = input.contains(_coordinate);
              if (_contains) {
                HashSet<Coordinate> _get = list_content.get(0);
                Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
                _get.add(_coordinate_1);
              }
              Coordinate _coordinate_2 = new Coordinate((i).intValue(), ((_size - 1) - (j).intValue()));
              boolean _contains_1 = input.contains(_coordinate_2);
              if (_contains_1) {
                HashSet<Coordinate> _get_1 = list_content.get(1);
                Coordinate _coordinate_3 = new Coordinate((i).intValue(), (j).intValue());
                _get_1.add(_coordinate_3);
              }
              Coordinate _coordinate_4 = new Coordinate(((_size - 1) - (i).intValue()), ((_size - 1) - (j).intValue()));
              boolean _contains_2 = input.contains(_coordinate_4);
              if (_contains_2) {
                HashSet<Coordinate> _get_2 = list_content.get(2);
                Coordinate _coordinate_5 = new Coordinate((i).intValue(), (j).intValue());
                _get_2.add(_coordinate_5);
              }
              Coordinate _coordinate_6 = new Coordinate(((_size - 1) - (i).intValue()), (j).intValue());
              boolean _contains_3 = input.contains(_coordinate_6);
              if (_contains_3) {
                HashSet<Coordinate> _get_3 = list_content.get(3);
                Coordinate _coordinate_7 = new Coordinate((i).intValue(), (j).intValue());
                _get_3.add(_coordinate_7);
              }
              Coordinate _coordinate_8 = new Coordinate((j).intValue(), (i).intValue());
              boolean _contains_4 = input.contains(_coordinate_8);
              if (_contains_4) {
                HashSet<Coordinate> _get_4 = list_content.get(4);
                Coordinate _coordinate_9 = new Coordinate((i).intValue(), (j).intValue());
                _get_4.add(_coordinate_9);
              }
              Coordinate _coordinate_10 = new Coordinate(((_size - 1) - (j).intValue()), (i).intValue());
              boolean _contains_5 = input.contains(_coordinate_10);
              if (_contains_5) {
                HashSet<Coordinate> _get_5 = list_content.get(5);
                Coordinate _coordinate_11 = new Coordinate((i).intValue(), (j).intValue());
                _get_5.add(_coordinate_11);
              }
              Coordinate _coordinate_12 = new Coordinate(((_size - 1) - (j).intValue()), ((_size - 1) - (i).intValue()));
              boolean _contains_6 = input.contains(_coordinate_12);
              if (_contains_6) {
                HashSet<Coordinate> _get_6 = list_content.get(6);
                Coordinate _coordinate_13 = new Coordinate((i).intValue(), (j).intValue());
                _get_6.add(_coordinate_13);
              }
              Coordinate _coordinate_14 = new Coordinate((j).intValue(), ((_size - 1) - (i).intValue()));
              boolean _contains_7 = input.contains(_coordinate_14);
              if (_contains_7) {
                HashSet<Coordinate> _get_7 = list_content.get(7);
                Coordinate _coordinate_15 = new Coordinate((i).intValue(), (j).intValue());
                _get_7.add(_coordinate_15);
              }
            }
          }
        }
        final Function1<HashSet<Coordinate>, Day20.Tile> _function_1 = new Function1<HashSet<Coordinate>, Day20.Tile>() {
          public Day20.Tile apply(final HashSet<Coordinate> it) {
            return new Day20.Tile(_number, it);
          }
        };
        _xblockexpression = ListExtensions.<HashSet<Coordinate>, Day20.Tile>map(list_content, _function_1);
      }
      return _xblockexpression;
    }

    public static List<Day20.Tile> allVariants(final long _number, final List<List<String>> input) {
      List<Day20.Tile> _xblockexpression = null;
      {
        final ArrayList<HashSet<Coordinate>> list_content = CollectionLiterals.<HashSet<Coordinate>>newArrayList();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it) {
            list_content.add(CollectionLiterals.<Coordinate>newHashSet());
          }
        };
        new IntegerRange(0, 7).forEach(_function);
        IntegerRange _upTo = new IntegerRange(0, (Day20.size - 1));
        for (final Integer i : _upTo) {
          IntegerRange _upTo_1 = new IntegerRange(0, (Day20.size - 1));
          for (final Integer j : _upTo_1) {
            {
              boolean _equals = input.get((i).intValue()).get((j).intValue()).equals("#");
              if (_equals) {
                HashSet<Coordinate> _get = list_content.get(0);
                Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
                _get.add(_coordinate);
              }
              boolean _equals_1 = input.get((i).intValue()).get(((Day20.size - 1) - (j).intValue())).equals("#");
              if (_equals_1) {
                HashSet<Coordinate> _get_1 = list_content.get(1);
                Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
                _get_1.add(_coordinate_1);
              }
              boolean _equals_2 = input.get(((Day20.size - 1) - (i).intValue())).get(((Day20.size - 1) - (j).intValue())).equals("#");
              if (_equals_2) {
                HashSet<Coordinate> _get_2 = list_content.get(2);
                Coordinate _coordinate_2 = new Coordinate((i).intValue(), (j).intValue());
                _get_2.add(_coordinate_2);
              }
              boolean _equals_3 = input.get(((Day20.size - 1) - (i).intValue())).get((j).intValue()).equals("#");
              if (_equals_3) {
                HashSet<Coordinate> _get_3 = list_content.get(3);
                Coordinate _coordinate_3 = new Coordinate((i).intValue(), (j).intValue());
                _get_3.add(_coordinate_3);
              }
              boolean _equals_4 = input.get((j).intValue()).get((i).intValue()).equals("#");
              if (_equals_4) {
                HashSet<Coordinate> _get_4 = list_content.get(4);
                Coordinate _coordinate_4 = new Coordinate((i).intValue(), (j).intValue());
                _get_4.add(_coordinate_4);
              }
              boolean _equals_5 = input.get(((Day20.size - 1) - (j).intValue())).get((i).intValue()).equals("#");
              if (_equals_5) {
                HashSet<Coordinate> _get_5 = list_content.get(5);
                Coordinate _coordinate_5 = new Coordinate((i).intValue(), (j).intValue());
                _get_5.add(_coordinate_5);
              }
              boolean _equals_6 = input.get(((Day20.size - 1) - (j).intValue())).get(((Day20.size - 1) - (i).intValue())).equals("#");
              if (_equals_6) {
                HashSet<Coordinate> _get_6 = list_content.get(6);
                Coordinate _coordinate_6 = new Coordinate((i).intValue(), (j).intValue());
                _get_6.add(_coordinate_6);
              }
              boolean _equals_7 = input.get((j).intValue()).get(((Day20.size - 1) - (i).intValue())).equals("#");
              if (_equals_7) {
                HashSet<Coordinate> _get_7 = list_content.get(7);
                Coordinate _coordinate_7 = new Coordinate((i).intValue(), (j).intValue());
                _get_7.add(_coordinate_7);
              }
            }
          }
        }
        final Function1<HashSet<Coordinate>, Day20.Tile> _function_1 = new Function1<HashSet<Coordinate>, Day20.Tile>() {
          public Day20.Tile apply(final HashSet<Coordinate> it) {
            return new Day20.Tile(_number, it);
          }
        };
        _xblockexpression = ListExtensions.<HashSet<Coordinate>, Day20.Tile>map(list_content, _function_1);
      }
      return _xblockexpression;
    }

    public boolean trim() {
      final Predicate<Coordinate> _function = new Predicate<Coordinate>() {
        public boolean test(final Coordinate it) {
          return ((((it.getX() == 0) || (it.getY() == 0)) || (it.getX() == (Day20.size - 1))) || (it.getY() == (Day20.size - 1)));
        }
      };
      return this.content.removeIf(_function);
    }

    public String toString() {
      String _xblockexpression = null;
      {
        String output = (("Size " + Long.valueOf(this.number)) + "\n");
        IntegerRange _upTo = new IntegerRange(0, (((int) this.number) - 1));
        for (final Integer i : _upTo) {
          {
            IntegerRange _upTo_1 = new IntegerRange(0, (((int) this.number) - 1));
            for (final Integer j : _upTo_1) {
              String _output = output;
              String _xifexpression = null;
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              boolean _contains = this.content.contains(_coordinate);
              if (_contains) {
                _xifexpression = "#";
              } else {
                _xifexpression = ".";
              }
              output = (_output + _xifexpression);
            }
            output = (output + "\n");
          }
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }

  private static final int size = 10;

  private static Day20.Tile current_tile = null;

  public static void main(final String[] args) {
    final List<String> input = new InputLoader(Integer.valueOf(2020), Integer.valueOf(20)).getInputs();
    int _size = input.size();
    int _plus = (_size + 1);
    final int nb_of_tiles = (_plus / 12);
    double _sqrt = Math.sqrt(nb_of_tiles);
    final int square_side = ((int) _sqrt);
    final Function2<ArrayList<Day20.Tile>, Integer, ArrayList<Day20.Tile>> _function = new Function2<ArrayList<Day20.Tile>, Integer, ArrayList<Day20.Tile>>() {
      public ArrayList<Day20.Tile> apply(final ArrayList<Day20.Tile> acc, final Integer i) {
        ArrayList<Day20.Tile> _xblockexpression = null;
        {
          final int number = Integer.parseInt((input.get(((i).intValue() * 12)).split(" ")[1]).split(":")[0]);
          final Function1<String, List<String>> _function = new Function1<String, List<String>>() {
            public List<String> apply(final String it) {
              final Function1<Character, String> _function = new Function1<Character, String>() {
                public String apply(final Character it_1) {
                  return it_1.toString();
                }
              };
              return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
            }
          };
          final List<List<String>> current = ListExtensions.<String, List<String>>map(input.subList((((i).intValue() * 12) + 1), (((i).intValue() * 12) + 11)), _function);
          acc.addAll(Day20.Tile.allVariants(number, current));
          _xblockexpression = acc;
        }
        return _xblockexpression;
      }
    };
    final ArrayList<Day20.Tile> all_tiles = IterableExtensions.<Integer, ArrayList<Day20.Tile>>fold(new ExclusiveRange(0, nb_of_tiles, true), CollectionLiterals.<Day20.Tile>newArrayList(), _function);
    final Function1<Day20.Tile, Boolean> _function_1 = new Function1<Day20.Tile, Boolean>() {
      public Boolean apply(final Day20.Tile it) {
        boolean _xblockexpression = false;
        {
          final String rb = it.getBorder(Coordinate.Direction.RIGHT);
          final String db = it.getBorder(Coordinate.Direction.DOWN);
          final String ub = it.getBorder(Coordinate.Direction.UP);
          final String lb = it.getBorder(Coordinate.Direction.LEFT);
          final long name = it.number;
          final HashSet<Day20.Tile> dup = new HashSet<Day20.Tile>(all_tiles);
          final Function1<Day20.Tile, Boolean> _function = new Function1<Day20.Tile, Boolean>() {
            public Boolean apply(final Day20.Tile it_1) {
              return Boolean.valueOf(it_1.matchesSomewhereWithOtherName(rb, name));
            }
          };
          final Day20.Tile rmatch = IterableExtensions.<Day20.Tile>findFirst(dup, _function);
          final Function1<Day20.Tile, Boolean> _function_1 = new Function1<Day20.Tile, Boolean>() {
            public Boolean apply(final Day20.Tile it_1) {
              return Boolean.valueOf(it_1.matchesSomewhereWithOtherName(db, name));
            }
          };
          final Day20.Tile dmatch = IterableExtensions.<Day20.Tile>findFirst(dup, _function_1);
          final Function1<Day20.Tile, Boolean> _function_2 = new Function1<Day20.Tile, Boolean>() {
            public Boolean apply(final Day20.Tile it_1) {
              return Boolean.valueOf(it_1.matchesSomewhereWithOtherName(ub, name));
            }
          };
          final Day20.Tile umatch = IterableExtensions.<Day20.Tile>findFirst(dup, _function_2);
          final Function1<Day20.Tile, Boolean> _function_3 = new Function1<Day20.Tile, Boolean>() {
            public Boolean apply(final Day20.Tile it_1) {
              return Boolean.valueOf(it_1.matchesSomewhereWithOtherName(lb, name));
            }
          };
          final Day20.Tile lmatch = IterableExtensions.<Day20.Tile>findFirst(dup, _function_3);
          _xblockexpression = ((((rmatch != null) && (dmatch != null)) && (umatch == null)) && (lmatch == null));
        }
        return Boolean.valueOf(_xblockexpression);
      }
    };
    final Day20.Tile upper_left = IterableExtensions.<Day20.Tile>findFirst(all_tiles, _function_1);
    Coordinate _coordinate = new Coordinate(0, 0);
    Pair<Coordinate, Day20.Tile> _mappedTo = Pair.<Coordinate, Day20.Tile>of(_coordinate, upper_left);
    final HashMap<Coordinate, Day20.Tile> image = CollectionLiterals.<Coordinate, Day20.Tile>newHashMap(_mappedTo);
    final Predicate<Day20.Tile> _function_2 = new Predicate<Day20.Tile>() {
      public boolean test(final Day20.Tile it) {
        return (it.number == upper_left.number);
      }
    };
    all_tiles.removeIf(_function_2);
    Day20.current_tile = upper_left;
    IntegerRange _upTo = new IntegerRange(1, (square_side - 1));
    for (final Integer j : _upTo) {
      {
        final Function1<Day20.Tile, Boolean> _function_3 = new Function1<Day20.Tile, Boolean>() {
          public Boolean apply(final Day20.Tile it) {
            return Boolean.valueOf(it.matchesThereButWithOtherName(Day20.current_tile.getBorder(Coordinate.Direction.RIGHT), Coordinate.Direction.LEFT, 
              Day20.current_tile.number));
          }
        };
        Day20.current_tile = IterableExtensions.<Day20.Tile>findFirst(all_tiles, _function_3);
        Coordinate _coordinate_1 = new Coordinate(0, (j).intValue());
        image.put(_coordinate_1, Day20.current_tile);
        final Predicate<Day20.Tile> _function_4 = new Predicate<Day20.Tile>() {
          public boolean test(final Day20.Tile it) {
            return (it.number == Day20.current_tile.number);
          }
        };
        all_tiles.removeIf(_function_4);
      }
    }
    IntegerRange _upTo_1 = new IntegerRange(1, (square_side - 1));
    for (final Integer i : _upTo_1) {
      {
        Coordinate _coordinate_1 = new Coordinate(((i).intValue() - 1), 0);
        Day20.current_tile = image.get(_coordinate_1);
        final Function1<Day20.Tile, Boolean> _function_3 = new Function1<Day20.Tile, Boolean>() {
          public Boolean apply(final Day20.Tile it) {
            return Boolean.valueOf(it.matchesThereButWithOtherName(Day20.current_tile.getBorder(Coordinate.Direction.DOWN), Coordinate.Direction.UP, 
              Day20.current_tile.number));
          }
        };
        Day20.current_tile = IterableExtensions.<Day20.Tile>findFirst(all_tiles, _function_3);
        Coordinate _coordinate_2 = new Coordinate((i).intValue(), 0);
        image.put(_coordinate_2, Day20.current_tile);
        final Predicate<Day20.Tile> _function_4 = new Predicate<Day20.Tile>() {
          public boolean test(final Day20.Tile it) {
            return (it.number == Day20.current_tile.number);
          }
        };
        all_tiles.removeIf(_function_4);
        IntegerRange _upTo_2 = new IntegerRange(1, (square_side - 1));
        for (final Integer j_1 : _upTo_2) {
          {
            final Function1<Day20.Tile, Boolean> _function_5 = new Function1<Day20.Tile, Boolean>() {
              public Boolean apply(final Day20.Tile it) {
                return Boolean.valueOf(it.matchesThereButWithOtherName(Day20.current_tile.getBorder(Coordinate.Direction.RIGHT), Coordinate.Direction.LEFT, 
                  Day20.current_tile.number));
              }
            };
            Day20.current_tile = IterableExtensions.<Day20.Tile>findFirst(all_tiles, _function_5);
            Coordinate _coordinate_3 = new Coordinate((i).intValue(), (j_1).intValue());
            image.put(_coordinate_3, Day20.current_tile);
            final Predicate<Day20.Tile> _function_6 = new Predicate<Day20.Tile>() {
              public boolean test(final Day20.Tile it) {
                return (it.number == Day20.current_tile.number);
              }
            };
            all_tiles.removeIf(_function_6);
          }
        }
      }
    }
    Coordinate _coordinate_1 = new Coordinate(0, 0);
    Coordinate _coordinate_2 = new Coordinate(0, (square_side - 1));
    Coordinate _coordinate_3 = new Coordinate((square_side - 1), 0);
    Coordinate _coordinate_4 = new Coordinate((square_side - 1), (square_side - 1));
    InputOutput.<Long>println(
      Long.valueOf((((image.get(_coordinate_1).number * image.get(_coordinate_2).number) * 
        image.get(_coordinate_3).number) * 
        image.get(_coordinate_4).number)));
    final Consumer<Day20.Tile> _function_3 = new Consumer<Day20.Tile>() {
      public void accept(final Day20.Tile it) {
        it.trim();
      }
    };
    image.values().forEach(_function_3);
    final Function2<HashSet<Coordinate>, Map.Entry<Coordinate, Day20.Tile>, HashSet<Coordinate>> _function_4 = new Function2<HashSet<Coordinate>, Map.Entry<Coordinate, Day20.Tile>, HashSet<Coordinate>>() {
      public HashSet<Coordinate> apply(final HashSet<Coordinate> acc, final Map.Entry<Coordinate, Day20.Tile> v) {
        HashSet<Coordinate> _xblockexpression = null;
        {
          int _x = v.getKey().getX();
          int _multiply = (_x * 8);
          final int toAddX = (_multiply - 1);
          int _y = v.getKey().getY();
          int _multiply_1 = (_y * 8);
          final int toAddY = (_multiply_1 - 1);
          final Consumer<Coordinate> _function = new Consumer<Coordinate>() {
            public void accept(final Coordinate it) {
              acc.add(it.addX(toAddX).addY(toAddY));
            }
          };
          v.getValue().content.forEach(_function);
          _xblockexpression = acc;
        }
        return _xblockexpression;
      }
    };
    final HashSet<Coordinate> final_image = IterableExtensions.<Map.Entry<Coordinate, Day20.Tile>, HashSet<Coordinate>>fold(image.entrySet(), CollectionLiterals.<Coordinate>newHashSet(), _function_4);
    Coordinate _coordinate_5 = new Coordinate(0, 18);
    Coordinate _coordinate_6 = new Coordinate(1, 0);
    Coordinate _coordinate_7 = new Coordinate(1, 5);
    Coordinate _coordinate_8 = new Coordinate(1, 6);
    Coordinate _coordinate_9 = new Coordinate(1, 11);
    Coordinate _coordinate_10 = new Coordinate(1, 12);
    Coordinate _coordinate_11 = new Coordinate(1, 17);
    Coordinate _coordinate_12 = new Coordinate(1, 18);
    Coordinate _coordinate_13 = new Coordinate(1, 19);
    Coordinate _coordinate_14 = new Coordinate(2, 1);
    Coordinate _coordinate_15 = new Coordinate(2, 4);
    Coordinate _coordinate_16 = new Coordinate(2, 7);
    Coordinate _coordinate_17 = new Coordinate(2, 10);
    Coordinate _coordinate_18 = new Coordinate(2, 13);
    Coordinate _coordinate_19 = new Coordinate(2, 16);
    final HashSet<Coordinate> sea_monster = CollectionLiterals.<Coordinate>newHashSet(_coordinate_5, _coordinate_6, _coordinate_7, _coordinate_8, _coordinate_9, _coordinate_10, _coordinate_11, _coordinate_12, _coordinate_13, _coordinate_14, _coordinate_15, _coordinate_16, _coordinate_17, _coordinate_18, _coordinate_19);
    final int monster_width = 19;
    final int monster_depth = 3;
    final int full_size = (8 * 12);
    final List<Day20.Tile> variants = Day20.Tile.allVariants(0L, final_image, full_size);
    final Function1<Day20.Tile, Boolean> _function_5 = new Function1<Day20.Tile, Boolean>() {
      public Boolean apply(final Day20.Tile im) {
        final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
          public Boolean apply(final Integer i_1) {
            final Function1<Integer, Boolean> _function = new Function1<Integer, Boolean>() {
              public Boolean apply(final Integer j_1) {
                final Function1<Coordinate, Coordinate> _function = new Function1<Coordinate, Coordinate>() {
                  public Coordinate apply(final Coordinate it) {
                    int _x = it.getX();
                    int _plus = (_x + (i_1).intValue());
                    int _y = it.getY();
                    int _plus_1 = (_y + (j_1).intValue());
                    return new Coordinate(_plus, _plus_1);
                  }
                };
                return Boolean.valueOf(im.content.containsAll(IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(sea_monster, _function))));
              }
            };
            Integer _findFirst = IterableExtensions.<Integer>findFirst(new IntegerRange(0, (full_size - monster_width)), _function);
            return Boolean.valueOf((_findFirst != null));
          }
        };
        Integer _findFirst = IterableExtensions.<Integer>findFirst(new IntegerRange(0, (full_size - monster_depth)), _function);
        return Boolean.valueOf((_findFirst != null));
      }
    };
    final Day20.Tile oriented_image = IterableExtensions.<Day20.Tile>findFirst(variants, _function_5);
    final HashSet<Coordinate> sea_monsters_coordinate = CollectionLiterals.<Coordinate>newHashSet();
    IntegerRange _upTo_2 = new IntegerRange(0, (full_size - monster_depth));
    for (final Integer i_1 : _upTo_2) {
      IntegerRange _upTo_3 = new IntegerRange(0, (full_size - monster_width));
      for (final Integer j_1 : _upTo_3) {
        {
          final Function1<Coordinate, Coordinate> _function_6 = new Function1<Coordinate, Coordinate>() {
            public Coordinate apply(final Coordinate it) {
              int _x = it.getX();
              int _plus = (_x + (i_1).intValue());
              int _y = it.getY();
              int _plus_1 = (_y + (j_1).intValue());
              return new Coordinate(_plus, _plus_1);
            }
          };
          final Set<Coordinate> current_sea_monster = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(sea_monster, _function_6));
          boolean _containsAll = oriented_image.content.containsAll(current_sea_monster);
          if (_containsAll) {
            sea_monsters_coordinate.addAll(current_sea_monster);
          }
        }
      }
    }
    int _size_1 = oriented_image.content.size();
    int _size_2 = sea_monsters_coordinate.size();
    int _minus = (_size_1 - _size_2);
    InputOutput.<Integer>println(Integer.valueOf(_minus));
  }
}
