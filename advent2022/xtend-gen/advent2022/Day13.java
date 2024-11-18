package advent2022;

import adventutils.collection.AgdaList;
import adventutils.input.InputLoader;
import com.google.common.collect.Iterables;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day13 {
  public static abstract class Package implements Comparable<Day13.Package> {
    public static Day13.Package newPackage(final ArrayList<String> strings) {
      final Stack<Day13.ListPackage> existing = new Stack<Day13.ListPackage>();
      while ((!strings.isEmpty())) {
        String _remove = strings.remove(0);
        final String current = _remove;
        if (current != null) {
          switch (current) {
            case "[":
              Day13.ListPackage _listPackage = new Day13.ListPackage();
              existing.push(_listPackage);
              break;
            case "]":
              final Day13.ListPackage finished = existing.pop();
              int _size = existing.size();
              boolean _equals = (_size == 0);
              if (_equals) {
                return finished;
              } else {
                Day13.ListPackage _peek = existing.peek();
                ((Day13.ListPackage) _peek).packages.add(finished);
              }
              break;
            case ",":
              break;
            default:
              try {
                String _get = strings.get(0);
                String _plus = (current + _get);
                int full = Integer.parseInt(_plus);
                Day13.ListPackage _peek_1 = existing.peek();
                Day13.UnaryPackage _unaryPackage = new Day13.UnaryPackage(full);
                ((Day13.ListPackage) _peek_1).packages.add(_unaryPackage);
                strings.remove(0);
              } catch (final Throwable _t) {
                if (_t instanceof NumberFormatException) {
                  Day13.ListPackage _peek_2 = existing.peek();
                  int _parseInt = Integer.parseInt(current);
                  Day13.UnaryPackage _unaryPackage_1 = new Day13.UnaryPackage(_parseInt);
                  ((Day13.ListPackage) _peek_2).packages.add(_unaryPackage_1);
                } else {
                  throw Exceptions.sneakyThrow(_t);
                }
              }
              break;
          }
        } else {
          try {
            String _get = strings.get(0);
            String _plus = (current + _get);
            int full = Integer.parseInt(_plus);
            Day13.ListPackage _peek_1 = existing.peek();
            Day13.UnaryPackage _unaryPackage = new Day13.UnaryPackage(full);
            ((Day13.ListPackage) _peek_1).packages.add(_unaryPackage);
            strings.remove(0);
          } catch (final Throwable _t) {
            if (_t instanceof NumberFormatException) {
              Day13.ListPackage _peek_2 = existing.peek();
              int _parseInt = Integer.parseInt(current);
              Day13.UnaryPackage _unaryPackage_1 = new Day13.UnaryPackage(_parseInt);
              ((Day13.ListPackage) _peek_2).packages.add(_unaryPackage_1);
            } else {
              throw Exceptions.sneakyThrow(_t);
            }
          }
        }
      }
      return null;
    }

    @Override
    public int compareTo(final Day13.Package p2) {
      int _switchResult = (int) 0;
      boolean _matched = false;
      if (this instanceof Day13.UnaryPackage) {
        _matched=true;
        int _switchResult_1 = (int) 0;
        boolean _matched_1 = false;
        if (p2 instanceof Day13.UnaryPackage) {
          _matched_1=true;
          _switchResult_1 = Integer.valueOf(((Day13.UnaryPackage)p2).value).compareTo(Integer.valueOf(((Day13.UnaryPackage) this).value));
        }
        if (!_matched_1) {
          _switchResult_1 = ((Day13.UnaryPackage) this).toListPackage().compareTo(p2);
        }
        _switchResult = _switchResult_1;
      }
      if (!_matched) {
        int _switchResult_1 = (int) 0;
        boolean _matched_1 = false;
        if (p2 instanceof Day13.UnaryPackage) {
          _matched_1=true;
          _switchResult_1 = this.compareTo(((Day13.UnaryPackage)p2).toListPackage());
        }
        if (!_matched_1) {
          int _xblockexpression = (int) 0;
          {
            final Day13.ListPackage l1 = ((Day13.ListPackage) this);
            final Day13.ListPackage l2 = ((Day13.ListPackage) p2);
            int _xifexpression = (int) 0;
            if ((l1.packages.isEmpty() && l2.packages.isEmpty())) {
              _xifexpression = 0;
            } else {
              int _xifexpression_1 = (int) 0;
              boolean _isEmpty = l1.packages.isEmpty();
              if (_isEmpty) {
                _xifexpression_1 = 1;
              } else {
                int _xifexpression_2 = (int) 0;
                boolean _isEmpty_1 = l2.packages.isEmpty();
                if (_isEmpty_1) {
                  _xifexpression_2 = (-1);
                } else {
                  int _switchResult_2 = (int) 0;
                  int _compareTo = l1.packages.get(0).compareTo(l2.packages.get(0));
                  final int res = _compareTo;
                  switch (res) {
                    case 0:
                      _switchResult_2 = l1.tailPackage().compareTo(l2.tailPackage());
                      break;
                    default:
                      _switchResult_2 = res;
                      break;
                  }
                  _xifexpression_2 = _switchResult_2;
                }
                _xifexpression_1 = _xifexpression_2;
              }
              _xifexpression = _xifexpression_1;
            }
            _xblockexpression = _xifexpression;
          }
          _switchResult_1 = _xblockexpression;
        }
        _switchResult = _switchResult_1;
      }
      return _switchResult;
    }
  }

  public static class UnaryPackage extends Day13.Package {
    private int value;

    public UnaryPackage(final int i) {
      this.value = i;
    }

    @Override
    public String toString() {
      String _string = Integer.valueOf(this.value).toString();
      String _plus = ("(UP " + _string);
      return (_plus + ")");
    }

    public Day13.ListPackage toListPackage() {
      Day13.ListPackage _xblockexpression = null;
      {
        final Day13.ListPackage ret = new Day13.ListPackage();
        ret.packages.add(this);
        _xblockexpression = ret;
      }
      return _xblockexpression;
    }
  }

  public static class ListPackage extends Day13.Package {
    private List<Day13.Package> packages;

    public ListPackage() {
      this.packages = CollectionLiterals.<Day13.Package>newArrayList();
    }

    public Day13.ListPackage tailPackage() {
      Day13.ListPackage _xblockexpression = null;
      {
        final Day13.ListPackage ret = new Day13.ListPackage();
        Iterables.<Day13.Package>addAll(ret.packages, IterableExtensions.<Day13.Package>drop(this.packages, 1));
        _xblockexpression = ret;
      }
      return _xblockexpression;
    }

    @Override
    public String toString() {
      String _string = new AgdaList<Day13.Package>(this.packages).toString();
      String _plus = ("(LP " + _string);
      return (_plus + ")");
    }
  }

  private static final Day13.Package div1 = new Function0<Day13.Package>() {
    @Override
    public Day13.Package apply() {
      Day13.ListPackage _xblockexpression = null;
      {
        final Day13.ListPackage output = new Day13.ListPackage();
        final Day13.ListPackage inner = new Day13.ListPackage();
        Day13.UnaryPackage _unaryPackage = new Day13.UnaryPackage(2);
        inner.packages.add(_unaryPackage);
        output.packages.add(inner);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  private static final Day13.Package div2 = new Function0<Day13.Package>() {
    @Override
    public Day13.Package apply() {
      Day13.ListPackage _xblockexpression = null;
      {
        final Day13.ListPackage output = new Day13.ListPackage();
        final Day13.ListPackage inner = new Day13.ListPackage();
        Day13.UnaryPackage _unaryPackage = new Day13.UnaryPackage(6);
        inner.packages.add(_unaryPackage);
        output.packages.add(inner);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }
  }.apply();

  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(13)).getInputs();
    int i = 0;
    final ArrayList<Pair<Day13.Package, Day13.Package>> pairs = CollectionLiterals.<Pair<Day13.Package, Day13.Package>>newArrayList();
    while ((i < inputs.size())) {
      {
        final Function1<Character, String> _function = (Character it) -> {
          return (it + "");
        };
        List<String> _map = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(inputs.get(i).toCharArray())), _function);
        ArrayList<String> _arrayList = new ArrayList<String>(_map);
        Day13.Package _newPackage = Day13.Package.newPackage(_arrayList);
        final Function1<Character, String> _function_1 = (Character it) -> {
          return (it + "");
        };
        List<String> _map_1 = ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(inputs.get((i + 1)).toCharArray())), _function_1);
        ArrayList<String> _arrayList_1 = new ArrayList<String>(_map_1);
        Day13.Package _newPackage_1 = Day13.Package.newPackage(_arrayList_1);
        Pair<Day13.Package, Day13.Package> _mappedTo = Pair.<Day13.Package, Day13.Package>of(_newPackage, _newPackage_1);
        pairs.add(_mappedTo);
        i = (i + 3);
      }
    }
    int sum = 0;
    int _size = pairs.size();
    IntegerRange _upTo = new IntegerRange(1, _size);
    for (final Integer k : _upTo) {
      {
        final Pair<Day13.Package, Day13.Package> current = pairs.get(((k).intValue() - 1));
        int _compareTo = current.getKey().compareTo(current.getValue());
        boolean _greaterEqualsThan = (_compareTo >= 0);
        if (_greaterEqualsThan) {
          int _sum = sum;
          sum = (_sum + (k).intValue());
        }
      }
    }
    InputOutput.<Integer>println(Integer.valueOf(sum));
    final ArrayList<Day13.Package> all = CollectionLiterals.<Day13.Package>newArrayList(Day13.div1, Day13.div2);
    final Consumer<Pair<Day13.Package, Day13.Package>> _function = (Pair<Day13.Package, Day13.Package> it) -> {
      all.add(it.getKey());
      all.add(it.getValue());
    };
    pairs.forEach(_function);
    final List<Day13.Package> sorted = ListExtensions.<Day13.Package>reverse(IterableExtensions.<Day13.Package>sort(all));
    int _indexOf = sorted.indexOf(Day13.div1);
    int _plus = (_indexOf + 1);
    int _indexOf_1 = sorted.indexOf(Day13.div2);
    int _plus_1 = (_indexOf_1 + 1);
    int _multiply = (_plus * _plus_1);
    InputOutput.<Integer>println(Integer.valueOf(_multiply));
  }
}
