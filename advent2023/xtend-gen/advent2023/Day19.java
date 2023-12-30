package advent2023;

import adventutils.geometry.Interval;
import adventutils.input.InputLoader;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

@SuppressWarnings("all")
public class Day19 {
  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2023), Integer.valueOf(19)).getInputs();
    final int rank = inputs.indexOf("");
    final Consumer<String> _function = (String it) -> {
      new Rules(it);
    };
    inputs.subList(0, rank).forEach(_function);
    final Function2<ArrayList<List<Integer>>, String, ArrayList<List<Integer>>> _function_1 = (ArrayList<List<Integer>> l, String el) -> {
      ArrayList<List<Integer>> _xblockexpression = null;
      {
        int _length = el.length();
        int _minus = (_length - 1);
        final Function1<String, Integer> _function_2 = (String it) -> {
          return Integer.valueOf(Integer.parseInt(it.split("=")[1]));
        };
        Rules.all_rules.get("in").process(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(el.substring(1, _minus).split(","))), _function_2), l);
        _xblockexpression = l;
      }
      return _xblockexpression;
    };
    final ArrayList<List<Integer>> res = IterableExtensions.<String, ArrayList<List<Integer>>>fold(inputs.subList((rank + 1), inputs.size()), CollectionLiterals.<List<Integer>>newArrayList(), _function_1);
    final Function2<Integer, List<Integer>, Integer> _function_2 = (Integer acc, List<Integer> el) -> {
      Integer _get = el.get(0);
      int _plus = ((acc).intValue() + (_get).intValue());
      Integer _get_1 = el.get(1);
      int _plus_1 = (_plus + (_get_1).intValue());
      Integer _get_2 = el.get(2);
      int _plus_2 = (_plus_1 + (_get_2).intValue());
      Integer _get_3 = el.get(3);
      return Integer.valueOf((_plus_2 + (_get_3).intValue()));
    };
    InputOutput.<Integer>println(IterableExtensions.<List<Integer>, Integer>fold(res, Integer.valueOf(0), _function_2));
    Interval _interval = new Interval(1, 4000);
    Interval _interval_1 = new Interval(1, 4000);
    Interval _interval_2 = new Interval(1, 4000);
    Interval _interval_3 = new Interval(1, 4000);
    final Pair<Set<List<Interval>>, List<Interval>> intervals = Rules.all_rules.get("in").processItvs(
      CollectionLiterals.<Interval>newArrayList(_interval, _interval_1, _interval_2, _interval_3));
    final Function2<BigInteger, List<Interval>, BigInteger> _function_3 = (BigInteger acc, List<Interval> el) -> {
      final Function1<Interval, BigInteger> _function_4 = (Interval it) -> {
        long _length = it.length();
        long _plus = (_length + 1);
        return BigInteger.valueOf(_plus);
      };
      final Function2<BigInteger, BigInteger, BigInteger> _function_5 = (BigInteger x, BigInteger y) -> {
        return x.multiply(y);
      };
      BigInteger _reduce = IterableExtensions.<BigInteger>reduce(ListExtensions.<Interval, BigInteger>map(el, _function_4), _function_5);
      return acc.add(_reduce);
    };
    InputOutput.<BigInteger>println(IterableExtensions.<List<Interval>, BigInteger>fold(intervals.getKey(), BigInteger.ZERO, _function_3));
  }
}
