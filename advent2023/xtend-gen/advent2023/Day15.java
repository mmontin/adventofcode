package advent2023;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import java.util.function.Function;

import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.collection.Collection;
import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day15 {
  public static void main(final String[] args) {
    final Function<String, Integer> _function = new Function<String, Integer>() {
      public Integer apply(final String it) {
        final Function2<Integer, Character, Integer> _function = new Function2<Integer, Character, Integer>() {
          public Integer apply(final Integer acc, final Character el) {
            return Integer.valueOf((((((int) (el).charValue()) + (acc).intValue()) * 17) % 256));
          }
        };
        return IterableExtensions.<Character, Integer>fold(((Iterable<Character>)Conversions.doWrapArray(it.toCharArray())), Integer.valueOf(0), _function);
      }
    };
    final Function<String, Integer> decode = _function;
    final String[] codes = new InputLoader(Integer.valueOf(2023), Integer.valueOf(15)).getInputs().get(0).split(",");
    final Function2<Integer, String, Integer> _function_1 = new Function2<Integer, String, Integer>() {
      public Integer apply(final Integer acc, final String el) {
        Integer _apply = decode.apply(el);
        return Integer.valueOf(((acc).intValue() + (_apply).intValue()));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<String, Integer>fold(((Iterable<String>)Conversions.doWrapArray(codes)), Integer.valueOf(0), _function_1));
    final Function2<String, Map<Integer, ArrayList<Pair<String, Integer>>>, Serializable> _function_2 = new Function2<String, Map<Integer, ArrayList<Pair<String, Integer>>>, Serializable>() {
      public Serializable apply(final String el, final Map<Integer, ArrayList<Pair<String, Integer>>> boxes) {
        Serializable _xifexpression = null;
        boolean _contains = el.contains("=");
        if (_contains) {
          Serializable _xblockexpression = null;
          {
            final String[] split = el.split("=");
            final String label = split[0];
            final Integer box = decode.apply(label);
            final int focal = Integer.parseInt(split[1]);
            final ArrayList<Pair<String, Integer>> previous = boxes.get(box);
            Serializable _xifexpression_1 = null;
            if ((previous == null)) {
              Pair<String, Integer> _mappedTo = Pair.<String, Integer>of(label, Integer.valueOf(focal));
              _xifexpression_1 = boxes.put(box, CollectionLiterals.<Pair<String, Integer>>newArrayList(_mappedTo));
            } else {
              Serializable _xblockexpression_1 = null;
              {
                final Function1<Pair<String, Integer>, String> _function = new Function1<Pair<String, Integer>, String>() {
                  public String apply(final Pair<String, Integer> it) {
                    return it.getKey();
                  }
                };
                final int index = ListExtensions.<Pair<String, Integer>, String>map(previous, _function).indexOf(label);
                Serializable _xifexpression_2 = null;
                if ((index == (-1))) {
                  Pair<String, Integer> _mappedTo_1 = Pair.<String, Integer>of(label, Integer.valueOf(focal));
                  _xifexpression_2 = Boolean.valueOf(previous.add(_mappedTo_1));
                } else {
                  Pair<String, Integer> _mappedTo_2 = Pair.<String, Integer>of(label, Integer.valueOf(focal));
                  _xifexpression_2 = previous.set(index, _mappedTo_2);
                }
                _xblockexpression_1 = _xifexpression_2;
              }
              _xifexpression_1 = _xblockexpression_1;
            }
            _xblockexpression = _xifexpression_1;
          }
          _xifexpression = _xblockexpression;
        } else {
          Pair<String, Integer> _xblockexpression_1 = null;
          {
            final String label = el.split("-")[0];
            final ArrayList<Pair<String, Integer>> previous = boxes.get(decode.apply(label));
            Pair<String, Integer> _xifexpression_1 = null;
            if ((previous != null)) {
              Pair<String, Integer> _xblockexpression_2 = null;
              {
                final Function1<Pair<String, Integer>, String> _function = new Function1<Pair<String, Integer>, String>() {
                  public String apply(final Pair<String, Integer> it) {
                    return it.getKey();
                  }
                };
                final int index = ListExtensions.<Pair<String, Integer>, String>map(previous, _function).indexOf(label);
                Pair<String, Integer> _xifexpression_2 = null;
                if ((index != (-1))) {
                  _xifexpression_2 = previous.remove(index);
                }
                _xblockexpression_2 = _xifexpression_2;
              }
              _xifexpression_1 = _xblockexpression_2;
            }
            _xblockexpression_1 = _xifexpression_1;
          }
          _xifexpression = _xblockexpression_1;
        }
        return _xifexpression;
      }
    };
    final Map<Integer, ArrayList<Pair<String, Integer>>> boxes = Collection.<Integer, ArrayList<Pair<String, Integer>>, String, Serializable>aggregateToMap(((Iterable<String>)Conversions.doWrapArray(codes)), _function_2);
    final Function2<Integer, Map.Entry<Integer, ArrayList<Pair<String, Integer>>>, Integer> _function_3 = new Function2<Integer, Map.Entry<Integer, ArrayList<Pair<String, Integer>>>, Integer>() {
      public Integer apply(final Integer acc, final Map.Entry<Integer, ArrayList<Pair<String, Integer>>> box) {
        ArrayList<Pair<String, Integer>> _value = box.getValue();
        Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(acc, Integer.valueOf(1));
        final Function2<Pair<Integer, Integer>, Pair<String, Integer>, Pair<Integer, Integer>> _function = new Function2<Pair<Integer, Integer>, Pair<String, Integer>, Pair<Integer, Integer>>() {
          public Pair<Integer, Integer> apply(final Pair<Integer, Integer> acc1, final Pair<String, Integer> lense) {
            Integer _key = acc1.getKey();
            Integer _value = acc1.getValue();
            Integer _key_1 = box.getKey();
            int _plus = ((_key_1).intValue() + 1);
            int _multiply = ((_value).intValue() * _plus);
            Integer _value_1 = lense.getValue();
            int _multiply_1 = (_multiply * (_value_1).intValue());
            int _plus_1 = ((_key).intValue() + _multiply_1);
            Integer _value_2 = acc1.getValue();
            int _plus_2 = ((_value_2).intValue() + 1);
            return Pair.<Integer, Integer>of(Integer.valueOf(_plus_1), Integer.valueOf(_plus_2));
          }
        };
        return IterableExtensions.<Pair<String, Integer>, Pair<Integer, Integer>>fold(_value, _mappedTo, _function).getKey();
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Map.Entry<Integer, ArrayList<Pair<String, Integer>>>, Integer>fold(boxes.entrySet(), Integer.valueOf(0), _function_3));
  }
}
