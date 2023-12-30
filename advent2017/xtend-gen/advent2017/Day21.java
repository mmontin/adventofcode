package advent2017;

import adventutils.geometry.Coordinate;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day21 {
  public static class SetTile {
    private final Set<Coordinate> content;

    private final int size;

    public static List<Day21.SetTile> allVariants(final String s) {
      List<Day21.SetTile> _xblockexpression = null;
      {
        final ArrayList<HashSet<Coordinate>> content_list = CollectionLiterals.<HashSet<Coordinate>>newArrayList();
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it) {
            content_list.add(CollectionLiterals.<Coordinate>newHashSet());
          }
        };
        new IntegerRange(0, 7).forEach(_function);
        final Function1<String, List<String>> _function_1 = new Function1<String, List<String>>() {
          public List<String> apply(final String it) {
            final Function1<Character, String> _function = new Function1<Character, String>() {
              public String apply(final Character it_1) {
                return it_1.toString();
              }
            };
            return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function);
          }
        };
        final List<List<String>> split = ListExtensions.<String, List<String>>map(((List<String>)Conversions.doWrapArray(s.split("/"))), _function_1);
        final int size = split.size();
        IntegerRange _upTo = new IntegerRange(0, (size - 1));
        for (final Integer i : _upTo) {
          IntegerRange _upTo_1 = new IntegerRange(0, (size - 1));
          for (final Integer j : _upTo_1) {
            {
              boolean _equals = split.get((i).intValue()).get((j).intValue()).equals("#");
              if (_equals) {
                HashSet<Coordinate> _get = content_list.get(0);
                Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
                _get.add(_coordinate);
              }
              boolean _equals_1 = split.get((i).intValue()).get(((size - 1) - (j).intValue())).equals("#");
              if (_equals_1) {
                HashSet<Coordinate> _get_1 = content_list.get(1);
                Coordinate _coordinate_1 = new Coordinate((i).intValue(), (j).intValue());
                _get_1.add(_coordinate_1);
              }
              boolean _equals_2 = split.get(((size - 1) - (i).intValue())).get(((size - 1) - (j).intValue())).equals("#");
              if (_equals_2) {
                HashSet<Coordinate> _get_2 = content_list.get(2);
                Coordinate _coordinate_2 = new Coordinate((i).intValue(), (j).intValue());
                _get_2.add(_coordinate_2);
              }
              boolean _equals_3 = split.get(((size - 1) - (i).intValue())).get((j).intValue()).equals("#");
              if (_equals_3) {
                HashSet<Coordinate> _get_3 = content_list.get(3);
                Coordinate _coordinate_3 = new Coordinate((i).intValue(), (j).intValue());
                _get_3.add(_coordinate_3);
              }
              boolean _equals_4 = split.get((j).intValue()).get((i).intValue()).equals("#");
              if (_equals_4) {
                HashSet<Coordinate> _get_4 = content_list.get(4);
                Coordinate _coordinate_4 = new Coordinate((i).intValue(), (j).intValue());
                _get_4.add(_coordinate_4);
              }
              boolean _equals_5 = split.get(((size - 1) - (j).intValue())).get((i).intValue()).equals("#");
              if (_equals_5) {
                HashSet<Coordinate> _get_5 = content_list.get(5);
                Coordinate _coordinate_5 = new Coordinate((i).intValue(), (j).intValue());
                _get_5.add(_coordinate_5);
              }
              boolean _equals_6 = split.get(((size - 1) - (j).intValue())).get(((size - 1) - (i).intValue())).equals("#");
              if (_equals_6) {
                HashSet<Coordinate> _get_6 = content_list.get(6);
                Coordinate _coordinate_6 = new Coordinate((i).intValue(), (j).intValue());
                _get_6.add(_coordinate_6);
              }
              boolean _equals_7 = split.get((j).intValue()).get(((size - 1) - (i).intValue())).equals("#");
              if (_equals_7) {
                HashSet<Coordinate> _get_7 = content_list.get(7);
                Coordinate _coordinate_7 = new Coordinate((i).intValue(), (j).intValue());
                _get_7.add(_coordinate_7);
              }
            }
          }
        }
        final Function1<HashSet<Coordinate>, Day21.SetTile> _function_2 = new Function1<HashSet<Coordinate>, Day21.SetTile>() {
          public Day21.SetTile apply(final HashSet<Coordinate> it) {
            return new Day21.SetTile(it, size);
          }
        };
        _xblockexpression = ListExtensions.<HashSet<Coordinate>, Day21.SetTile>map(content_list, _function_2);
      }
      return _xblockexpression;
    }

    public SetTile(final String s) {
      this.content = CollectionLiterals.<Coordinate>newHashSet();
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
      final List<List<String>> split = ListExtensions.<String, List<String>>map(((List<String>)Conversions.doWrapArray(s.split("/"))), _function);
      this.size = split.size();
      IntegerRange _upTo = new IntegerRange(0, (this.size - 1));
      for (final Integer i : _upTo) {
        IntegerRange _upTo_1 = new IntegerRange(0, (this.size - 1));
        for (final Integer j : _upTo_1) {
          boolean _equals = split.get((i).intValue()).get((j).intValue()).equals("#");
          if (_equals) {
            Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
            this.content.add(_coordinate);
          }
        }
      }
    }

    public SetTile(final Set<Coordinate> _content, final int _size) {
      this.content = _content;
      this.size = _size;
    }

    public HashMap<Coordinate, Day21.SetTile> split() {
      HashMap<Coordinate, Day21.SetTile> _xblockexpression = null;
      {
        final HashMap<Coordinate, Day21.SetTile> output = CollectionLiterals.<Coordinate, Day21.SetTile>newHashMap();
        if ((((this.size % 2) == 0) && (this.size > 2))) {
          final int nb = (this.size / 2);
          IntegerRange _upTo = new IntegerRange(0, (nb - 1));
          for (final Integer i : _upTo) {
            IntegerRange _upTo_1 = new IntegerRange(0, (nb - 1));
            for (final Integer j : _upTo_1) {
              Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
              final Function1<Coordinate, Boolean> _function = new Function1<Coordinate, Boolean>() {
                public Boolean apply(final Coordinate it) {
                  return Boolean.valueOf((((it.getX() == (2 * (i).intValue())) || (it.getX() == ((2 * (i).intValue()) + 1))) && ((it.getY() == (2 * (j).intValue())) || (it.getY() == ((2 * (j).intValue()) + 1)))));
                }
              };
              final Function1<Coordinate, Coordinate> _function_1 = new Function1<Coordinate, Coordinate>() {
                public Coordinate apply(final Coordinate it) {
                  int _x = it.getX();
                  int _minus = (_x - (2 * (i).intValue()));
                  int _y = it.getY();
                  int _minus_1 = (_y - (2 * (j).intValue()));
                  return new Coordinate(_minus, _minus_1);
                }
              };
              Set<Coordinate> _set = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(IterableExtensions.<Coordinate>filter(this.content, _function), _function_1));
              Day21.SetTile _setTile = new Day21.SetTile(_set, 2);
              output.put(_coordinate, _setTile);
            }
          }
        } else {
          if ((((this.size % 3) == 0) && (this.size > 3))) {
            final int nb_1 = (this.size / 3);
            IntegerRange _upTo_2 = new IntegerRange(0, (nb_1 - 1));
            for (final Integer i_1 : _upTo_2) {
              IntegerRange _upTo_3 = new IntegerRange(0, (nb_1 - 1));
              for (final Integer j_1 : _upTo_3) {
                Coordinate _coordinate_1 = new Coordinate((i_1).intValue(), (j_1).intValue());
                final Function1<Coordinate, Boolean> _function_2 = new Function1<Coordinate, Boolean>() {
                  public Boolean apply(final Coordinate it) {
                    return Boolean.valueOf(((((it.getX() >= (3 * (i_1).intValue())) && (it.getX() <= ((3 * (i_1).intValue()) + 2))) && (it.getY() >= (3 * (j_1).intValue()))) && (it.getY() <= ((3 * (j_1).intValue()) + 2))));
                  }
                };
                final Function1<Coordinate, Coordinate> _function_3 = new Function1<Coordinate, Coordinate>() {
                  public Coordinate apply(final Coordinate it) {
                    int _x = it.getX();
                    int _minus = (_x - (3 * (i_1).intValue()));
                    int _y = it.getY();
                    int _minus_1 = (_y - (3 * (j_1).intValue()));
                    return new Coordinate(_minus, _minus_1);
                  }
                };
                Set<Coordinate> _set_1 = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(IterableExtensions.<Coordinate>filter(this.content, _function_2), _function_3));
                Day21.SetTile _setTile_1 = new Day21.SetTile(_set_1, 3);
                output.put(_coordinate_1, _setTile_1);
              }
            }
          } else {
            Coordinate _coordinate_2 = new Coordinate(0, 0);
            final Function1<Coordinate, Coordinate> _function_4 = new Function1<Coordinate, Coordinate>() {
              public Coordinate apply(final Coordinate it) {
                return new Coordinate(it);
              }
            };
            Set<Coordinate> _set_2 = IterableExtensions.<Coordinate>toSet(IterableExtensions.<Coordinate, Coordinate>map(this.content, _function_4));
            Day21.SetTile _setTile_2 = new Day21.SetTile(_set_2, this.size);
            output.put(_coordinate_2, _setTile_2);
          }
        }
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    public String toString() {
      String _xblockexpression = null;
      {
        String output = (("Size " + Integer.valueOf(this.size)) + "\n");
        IntegerRange _upTo = new IntegerRange(0, (this.size - 1));
        for (final Integer i : _upTo) {
          {
            IntegerRange _upTo_1 = new IntegerRange(0, (this.size - 1));
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

    public int hashCode() {
      return this.size;
    }

    public boolean equals(final Object other) {
      boolean _switchResult = false;
      boolean _matched = false;
      if (other instanceof Day21.SetTile) {
        _matched=true;
        _switchResult = this.content.equals(((Day21.SetTile)other).content);
      }
      if (!_matched) {
        _switchResult = false;
      }
      return _switchResult;
    }
  }

  private static final Map<Day21.SetTile, Day21.SetTile> mappings = CollectionLiterals.<Day21.SetTile, Day21.SetTile>newHashMap();

  private static final Day21.SetTile starting_tile = new Day21.SetTile(".#./..#/###");

  public static void main(final String[] args) {
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] split = it.split(" => ");
        String _get = split[1];
        final Day21.SetTile target = new Day21.SetTile(_get);
        final Consumer<Day21.SetTile> _function = new Consumer<Day21.SetTile>() {
          public void accept(final Day21.SetTile variant) {
            Day21.mappings.put(variant, target);
          }
        };
        Day21.SetTile.allVariants(split[0]).forEach(_function);
      }
    };
    new InputLoader(Integer.valueOf(2017), Integer.valueOf(21)).getInputs().forEach(_function);
    InputOutput.<Integer>println(Integer.valueOf(Day21.mappings.size()));
    Day21.SetTile current = Day21.starting_tile;
    IntegerRange _upTo = new IntegerRange(0, 4);
    for (final Integer i : _upTo) {
      {
        final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
        final HashMap<Coordinate, Day21.SetTile> splitted = current.split();
        final int next_size = (IterableExtensions.<Day21.SetTile>head(splitted.values()).size + 1);
        final BiConsumer<Coordinate, Day21.SetTile> _function_1 = new BiConsumer<Coordinate, Day21.SetTile>() {
          public void accept(final Coordinate k, final Day21.SetTile v) {
            Day21.SetTile next_tile = Day21.mappings.get(v);
            final Function1<Coordinate, Coordinate> _function = new Function1<Coordinate, Coordinate>() {
              public Coordinate apply(final Coordinate it) {
                int _x = it.getX();
                int _x_1 = k.getX();
                int _multiply = (next_size * _x_1);
                int _plus = (_x + _multiply);
                int _y = it.getY();
                int _y_1 = k.getY();
                int _multiply_1 = (next_size * _y_1);
                int _plus_1 = (_y + _multiply_1);
                return new Coordinate(_plus, _plus_1);
              }
            };
            Iterables.<Coordinate>addAll(output, IterableExtensions.<Coordinate, Coordinate>map(next_tile.content, _function));
          }
        };
        splitted.forEach(_function_1);
        double _sqrt = Math.sqrt(splitted.size());
        int _multiply = (next_size * ((int) _sqrt));
        Day21.SetTile _setTile = new Day21.SetTile(output, _multiply);
        current = _setTile;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(current.content.size()));
    IntegerRange _upTo_1 = new IntegerRange(0, 12);
    for (final Integer i_1 : _upTo_1) {
      {
        InputOutput.<Integer>println(i_1);
        final HashSet<Coordinate> output = CollectionLiterals.<Coordinate>newHashSet();
        final HashMap<Coordinate, Day21.SetTile> splitted = current.split();
        final int next_size = (IterableExtensions.<Day21.SetTile>head(splitted.values()).size + 1);
        final BiConsumer<Coordinate, Day21.SetTile> _function_1 = new BiConsumer<Coordinate, Day21.SetTile>() {
          public void accept(final Coordinate k, final Day21.SetTile v) {
            Day21.SetTile next_tile = Day21.mappings.get(v);
            final Function1<Coordinate, Coordinate> _function = new Function1<Coordinate, Coordinate>() {
              public Coordinate apply(final Coordinate it) {
                int _x = it.getX();
                int _x_1 = k.getX();
                int _multiply = (next_size * _x_1);
                int _plus = (_x + _multiply);
                int _y = it.getY();
                int _y_1 = k.getY();
                int _multiply_1 = (next_size * _y_1);
                int _plus_1 = (_y + _multiply_1);
                return new Coordinate(_plus, _plus_1);
              }
            };
            Iterables.<Coordinate>addAll(output, IterableExtensions.<Coordinate, Coordinate>map(next_tile.content, _function));
          }
        };
        splitted.forEach(_function_1);
        double _sqrt = Math.sqrt(splitted.size());
        int _multiply = (next_size * ((int) _sqrt));
        Day21.SetTile _setTile = new Day21.SetTile(output, _multiply);
        current = _setTile;
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(current.content.size()));
  }
}
