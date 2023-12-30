package advent2023;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day4 {
  public static void main(final String[] args) {
    final ArrayList<Integer> numberOfWins = CollectionLiterals.<Integer>newArrayList();
    final HashMap<Integer, Integer> numberOfCards = CollectionLiterals.<Integer, Integer>newHashMap();
    final Consumer<String> _function = (String el) -> {
      final String[] split1 = el.split(" \\| ");
      final String[] left = (split1[0]).split(": ");
      final Function1<String, Boolean> _function_1 = (String it) -> {
        boolean _isBlank = it.isBlank();
        return Boolean.valueOf((!_isBlank));
      };
      final Function1<String, Integer> _function_2 = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final Iterable<Integer> winningNumbers = IterableExtensions.<String, Integer>map(IterableExtensions.<String>filter(IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray((left[1]).split(" ")))), _function_1), _function_2);
      final Function1<String, Boolean> _function_3 = (String it) -> {
        boolean _isBlank = it.isBlank();
        return Boolean.valueOf((!_isBlank));
      };
      final Function1<String, Integer> _function_4 = (String it) -> {
        return Integer.valueOf(Integer.parseInt(it));
      };
      final Iterable<Integer> allNumbers = IterableExtensions.<String, Integer>map(IterableExtensions.<String>filter(IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray((split1[1]).split(" ")))), _function_3), _function_4);
      final Function1<Integer, Boolean> _function_5 = (Integer x) -> {
        return Boolean.valueOf(IterableExtensions.contains(winningNumbers, x));
      };
      final int currentWins = IterableExtensions.size(IterableExtensions.<Integer>filter(allNumbers, _function_5));
      numberOfWins.add(Integer.valueOf(currentWins));
      final int currentCard = numberOfWins.size();
      final BiFunction<Integer, Integer, Integer> _function_6 = (Integer x, Integer y) -> {
        return Integer.valueOf(((x).intValue() + (y).intValue()));
      };
      final Integer currentNumberOfCards = numberOfCards.merge(Integer.valueOf(currentCard), Integer.valueOf(1), _function_6);
      if ((currentWins > 0)) {
        final Consumer<Integer> _function_7 = (Integer it) -> {
          final BiFunction<Integer, Integer, Integer> _function_8 = (Integer x, Integer y) -> {
            return Integer.valueOf(((x).intValue() + (y).intValue()));
          };
          numberOfCards.merge(it, currentNumberOfCards, _function_8);
        };
        new IntegerRange((currentCard + 1), (currentCard + currentWins)).forEach(_function_7);
      }
    };
    new InputLoader(Integer.valueOf(2023), Integer.valueOf(4)).getInputs().forEach(_function);
    final Function2<Integer, Integer, Integer> _function_1 = (Integer acc, Integer el) -> {
      Integer _xifexpression = null;
      if (((el).intValue() == 0)) {
        _xifexpression = acc;
      } else {
        double _pow = Math.pow(2, ((el).intValue() - 1));
        _xifexpression = Integer.valueOf(((acc).intValue() + ((int) _pow)));
      }
      return _xifexpression;
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(numberOfWins, Integer.valueOf(0), _function_1));
    final Function2<Integer, Integer, Integer> _function_2 = (Integer x, Integer y) -> {
      return Integer.valueOf(((x).intValue() + (y).intValue()));
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>reduce(numberOfCards.values(), _function_2));
  }
}
