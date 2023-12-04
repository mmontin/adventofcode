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
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String el) {
        final String[] split1 = el.split(" \\| ");
        final String[] left = (split1[0]).split(": ");
        final Function1<String, Boolean> _function = new Function1<String, Boolean>() {
          public Boolean apply(final String it) {
            boolean _isBlank = it.isBlank();
            return Boolean.valueOf((!_isBlank));
          }
        };
        final Function1<String, Integer> _function_1 = new Function1<String, Integer>() {
          public Integer apply(final String it) {
            return Integer.valueOf(Integer.parseInt(it));
          }
        };
        final Iterable<Integer> winningNumbers = IterableExtensions.<String, Integer>map(IterableExtensions.<String>filter(IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray((left[1]).split(" ")))), _function), _function_1);
        final Function1<String, Boolean> _function_2 = new Function1<String, Boolean>() {
          public Boolean apply(final String it) {
            boolean _isBlank = it.isBlank();
            return Boolean.valueOf((!_isBlank));
          }
        };
        final Function1<String, Integer> _function_3 = new Function1<String, Integer>() {
          public Integer apply(final String it) {
            return Integer.valueOf(Integer.parseInt(it));
          }
        };
        final Iterable<Integer> allNumbers = IterableExtensions.<String, Integer>map(IterableExtensions.<String>filter(IterableExtensions.<String>toList(((Iterable<String>)Conversions.doWrapArray((split1[1]).split(" ")))), _function_2), _function_3);
        final Function1<Integer, Boolean> _function_4 = new Function1<Integer, Boolean>() {
          public Boolean apply(final Integer x) {
            return Boolean.valueOf(IterableExtensions.contains(winningNumbers, x));
          }
        };
        final int currentWins = IterableExtensions.size(IterableExtensions.<Integer>filter(allNumbers, _function_4));
        numberOfWins.add(Integer.valueOf(currentWins));
        final int currentCard = numberOfWins.size();
        final BiFunction<Integer, Integer, Integer> _function_5 = new BiFunction<Integer, Integer, Integer>() {
          public Integer apply(final Integer x, final Integer y) {
            return Integer.valueOf(((x).intValue() + (y).intValue()));
          }
        };
        final Integer currentNumberOfCards = numberOfCards.merge(Integer.valueOf(currentCard), Integer.valueOf(1), _function_5);
        if ((currentWins > 0)) {
          final Consumer<Integer> _function_6 = new Consumer<Integer>() {
            public void accept(final Integer it) {
              final BiFunction<Integer, Integer, Integer> _function = new BiFunction<Integer, Integer, Integer>() {
                public Integer apply(final Integer x, final Integer y) {
                  return Integer.valueOf(((x).intValue() + (y).intValue()));
                }
              };
              numberOfCards.merge(it, currentNumberOfCards, _function);
            }
          };
          new IntegerRange((currentCard + 1), (currentCard + currentWins)).forEach(_function_6);
        }
      }
    };
    new InputLoader(Integer.valueOf(2023), Integer.valueOf(4)).getInputs().forEach(_function);
    final Function2<Integer, Integer, Integer> _function_1 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer acc, final Integer el) {
        Integer _xifexpression = null;
        if (((el).intValue() == 0)) {
          _xifexpression = acc;
        } else {
          double _pow = Math.pow(2, ((el).intValue() - 1));
          _xifexpression = Integer.valueOf(((acc).intValue() + ((int) _pow)));
        }
        return _xifexpression;
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer, Integer>fold(numberOfWins, Integer.valueOf(0), _function_1));
    final Function2<Integer, Integer, Integer> _function_2 = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer x, final Integer y) {
        return Integer.valueOf(((x).intValue() + (y).intValue()));
      }
    };
    InputOutput.<Integer>println(IterableExtensions.<Integer>reduce(numberOfCards.values(), _function_2));
  }
}
