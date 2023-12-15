package advent2019;

import java.util.List;

import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pair;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Day1 {
  public static void main(final String[] args) {
    List<String> _inputs = new InputLoader(Integer.valueOf(2019), Integer.valueOf(1)).getInputs();
    Pair<Integer, Integer> _mappedTo = Pair.<Integer, Integer>of(Integer.valueOf(0), Integer.valueOf(0));
    final Function2<Pair<Integer, Integer>, String, Pair<Integer, Integer>> _function = (Pair<Integer, Integer> acc, String el) -> {
      Pair<Integer, Integer> _xblockexpression = null;
      {
        int _parseInt = Integer.parseInt(el);
        int _divide = (_parseInt / 3);
        final int firstFuel = (_divide - 2);
        int allFuel = 0;
        int currentFuel = firstFuel;
        while ((currentFuel > 0)) {
          {
            int _allFuel = allFuel;
            allFuel = (_allFuel + currentFuel);
            currentFuel = ((currentFuel / 3) - 2);
          }
        }
        Integer _key = acc.getKey();
        int _plus = ((_key).intValue() + firstFuel);
        Integer _value = acc.getValue();
        int _plus_1 = ((_value).intValue() + allFuel);
        _xblockexpression = Pair.<Integer, Integer>of(Integer.valueOf(_plus), Integer.valueOf(_plus_1));
      }
      return _xblockexpression;
    };
    InputOutput.<Pair<Integer, Integer>>println(IterableExtensions.<String, Pair<Integer, Integer>>fold(_inputs, _mappedTo, _function));
  }
}
