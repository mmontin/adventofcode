package advent2022;

import adventutils.input.InputLoader;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day21 {
  public static abstract class Expression {
    public static Day21.Expression createExpression(final String key) {
      Day21.Expression _xblockexpression = null;
      {
        final List<String> ops = Day21.monkeys.get(key);
        Day21.Expression _xifexpression = null;
        boolean _equals = key.equals("humn");
        if (_equals) {
          _xifexpression = new Day21.Unknown();
        } else {
          Day21.Expression _xtrycatchfinallyexpression = null;
          try {
            long _parseLong = Long.parseLong(ops.get(0));
            Day21.Value _value = new Day21.Value(_parseLong);
            _xtrycatchfinallyexpression = _value;
          } catch (final Throwable _t) {
            if (_t instanceof NumberFormatException) {
              Day21.Expression _xblockexpression_1 = null;
              {
                final Day21.Expression left = Day21.Expression.createExpression(ops.get(0));
                final Day21.Expression right = Day21.Expression.createExpression(ops.get(2));
                Day21.Expression _xifexpression_1 = null;
                if (((left instanceof Day21.Value) && (right instanceof Day21.Value))) {
                  Day21.Value _xblockexpression_2 = null;
                  {
                    final Day21.Value left_bis = ((Day21.Value) left);
                    final Day21.Value right_bis = ((Day21.Value) right);
                    long _switchResult = (long) 0;
                    String _get = ops.get(1);
                    if (_get != null) {
                      switch (_get) {
                        case "+":
                          _switchResult = (left_bis.value + right_bis.value);
                          break;
                        case "-":
                          _switchResult = (left_bis.value - right_bis.value);
                          break;
                        case "*":
                          _switchResult = (left_bis.value * right_bis.value);
                          break;
                        default:
                          _switchResult = (left_bis.value / right_bis.value);
                          break;
                      }
                    } else {
                      _switchResult = (left_bis.value / right_bis.value);
                    }
                    _xblockexpression_2 = new Day21.Value(_switchResult);
                  }
                  _xifexpression_1 = _xblockexpression_2;
                } else {
                  String _get = ops.get(1);
                  _xifexpression_1 = new Day21.Operation(left, right, _get);
                }
                _xblockexpression_1 = _xifexpression_1;
              }
              _xtrycatchfinallyexpression = _xblockexpression_1;
            } else {
              throw Exceptions.sneakyThrow(_t);
            }
          }
          _xifexpression = _xtrycatchfinallyexpression;
        }
        _xblockexpression = _xifexpression;
      }
      return _xblockexpression;
    }
  }

  public static class Operation extends Day21.Expression {
    public Day21.Expression left;

    public Day21.Expression right;

    public String op;

    public Operation(final Day21.Expression _left, final Day21.Expression _right, final String _op) {
      this.left = _left;
      this.right = _right;
      this.op = _op;
    }
  }

  public static class Value extends Day21.Expression {
    public long value;

    public Value(final long _value) {
      this.value = _value;
    }
  }

  public static class Unknown extends Day21.Expression {
  }

  private static final Map<String, List<String>> monkeys = CollectionLiterals.<String, List<String>>newHashMap();

  public static void main(final String[] args) {
    final Consumer<String> _function = (String it) -> {
      final String[] split1 = it.split(": ");
      Day21.monkeys.put(split1[0], IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray((split1[1]).split(" ")))));
    };
    new InputLoader(Integer.valueOf(2022), Integer.valueOf(21)).getInputs().forEach(_function);
    InputOutput.<Long>println(Long.valueOf(Day21.resolve("root")));
    final List<String> root = Day21.monkeys.get("root");
    Day21.Expression left = Day21.Expression.createExpression(root.get(0));
    Day21.Expression right = Day21.Expression.createExpression(root.get(2));
    while ((!(left instanceof Day21.Unknown))) {
      {
        final Day21.Operation left_bis = ((Day21.Operation) left);
        final Day21.Value right_bis = ((Day21.Value) right);
        final String _switchValue = left_bis.op;
        if (_switchValue != null) {
          switch (_switchValue) {
            case "+":
              final Day21.Expression x = left_bis.left;
              boolean _matched = false;
              if (x instanceof Day21.Value) {
                _matched=true;
                left = left_bis.right;
                Day21.Value _value = new Day21.Value((right_bis.value - ((Day21.Value)x).value));
                right = _value;
              }
              if (!_matched) {
                {
                  left = x;
                  Day21.Value _value = new Day21.Value((right_bis.value - ((Day21.Value) left_bis.right).value));
                  right = _value;
                }
              }
              break;
            case "-":
              final Day21.Expression x_1 = left_bis.left;
              boolean _matched_1 = false;
              if (x_1 instanceof Day21.Value) {
                _matched_1=true;
                left = left_bis.right;
                Day21.Value _value = new Day21.Value((((Day21.Value)x_1).value - right_bis.value));
                right = _value;
              }
              if (!_matched_1) {
                {
                  left = x_1;
                  Day21.Value _value = new Day21.Value((right_bis.value + ((Day21.Value) left_bis.right).value));
                  right = _value;
                }
              }
              break;
            case "*":
              final Day21.Expression x_2 = left_bis.left;
              boolean _matched_2 = false;
              if (x_2 instanceof Day21.Value) {
                _matched_2=true;
                left = left_bis.right;
                Day21.Value _value = new Day21.Value((right_bis.value / ((Day21.Value)x_2).value));
                right = _value;
              }
              if (!_matched_2) {
                {
                  left = x_2;
                  Day21.Value _value = new Day21.Value((right_bis.value / ((Day21.Value) left_bis.right).value));
                  right = _value;
                }
              }
              break;
            default:
              final Day21.Expression x_3 = left_bis.left;
              boolean _matched_3 = false;
              if (x_3 instanceof Day21.Value) {
                _matched_3=true;
                left = left_bis.right;
                Day21.Value _value = new Day21.Value((((Day21.Value)x_3).value / right_bis.value));
                right = _value;
              }
              if (!_matched_3) {
                {
                  left = x_3;
                  Day21.Value _value = new Day21.Value((right_bis.value * ((Day21.Value) left_bis.right).value));
                  right = _value;
                }
              }
              break;
          }
        } else {
          final Day21.Expression x_3 = left_bis.left;
          boolean _matched_3 = false;
          if (x_3 instanceof Day21.Value) {
            _matched_3=true;
            left = left_bis.right;
            Day21.Value _value = new Day21.Value((((Day21.Value)x_3).value / right_bis.value));
            right = _value;
          }
          if (!_matched_3) {
            {
              left = x_3;
              Day21.Value _value = new Day21.Value((right_bis.value * ((Day21.Value) left_bis.right).value));
              right = _value;
            }
          }
        }
      }
    }
    InputOutput.<Long>println(Long.valueOf(((Day21.Value) right).value));
  }

  public static long resolve(final String monkey) {
    long _xblockexpression = (long) 0;
    {
      final List<String> others = Day21.monkeys.get(monkey);
      long _xifexpression = (long) 0;
      int _size = others.size();
      boolean _equals = (_size == 1);
      if (_equals) {
        _xifexpression = Long.parseLong(others.get(0));
      } else {
        long _xblockexpression_1 = (long) 0;
        {
          final long left = Day21.resolve(others.get(0));
          final long right = Day21.resolve(others.get(2));
          long _switchResult = (long) 0;
          String _get = others.get(1);
          if (_get != null) {
            switch (_get) {
              case "+":
                _switchResult = (left + right);
                break;
              case "-":
                _switchResult = (left - right);
                break;
              case "*":
                _switchResult = (left * right);
                break;
              default:
                _switchResult = (left / right);
                break;
            }
          } else {
            _switchResult = (left / right);
          }
          _xblockexpression_1 = _switchResult;
        }
        _xifexpression = _xblockexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }
}
