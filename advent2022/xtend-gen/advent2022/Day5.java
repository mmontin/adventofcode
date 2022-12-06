package advent2022;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day5 {
  private static List<List<String>> distribution;

  public static List<List<String>> init() {
    return Day5.distribution = CollectionLiterals.<List<String>>newArrayList(
      CollectionLiterals.<String>newArrayList("S", "P", "W", "N", "J", "Z"), 
      CollectionLiterals.<String>newArrayList("T", "S", "G"), 
      CollectionLiterals.<String>newArrayList("H", "L", "R", "Q", "V"), 
      CollectionLiterals.<String>newArrayList("D", "T", "S", "V"), 
      CollectionLiterals.<String>newArrayList("J", "M", "B", "D", "T", "Z", "Q"), 
      CollectionLiterals.<String>newArrayList("L", "Z", "C", "D", "J", "T", "W", "M"), 
      CollectionLiterals.<String>newArrayList("J", "T", "G", "W", "M", "P", "L"), 
      CollectionLiterals.<String>newArrayList("H", "Q", "F", "B", "T", "M", "G", "N"), 
      CollectionLiterals.<String>newArrayList("W", "Q", "B", "P", "C", "G", "D", "R"));
  }

  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2022), Integer.valueOf(5)).getInputs();
    Day5.init();
    final Consumer<String> _function = new Consumer<String>() {
      public void accept(final String it) {
        final String[] els = it.split(" ");
        final int number = Integer.parseInt(els[1]);
        int _parseInt = Integer.parseInt(els[3]);
        final int from = (_parseInt - 1);
        int _parseInt_1 = Integer.parseInt(els[5]);
        final int to = (_parseInt_1 - 1);
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it_1) {
            Day5.move(from, to);
          }
        };
        new IntegerRange(1, number).forEach(_function);
      }
    };
    inputs.forEach(_function);
    final Function2<String, List<String>, String> _function_1 = new Function2<String, List<String>, String>() {
      public String apply(final String acc, final List<String> e) {
        String _get = e.get(0);
        return (acc + _get);
      }
    };
    InputOutput.<String>println(IterableExtensions.<List<String>, String>fold(Day5.distribution, "", _function_1));
    Day5.init();
    final Consumer<String> _function_2 = new Consumer<String>() {
      public void accept(final String it) {
        final String[] els = it.split(" ");
        final int number = Integer.parseInt(els[1]);
        int _parseInt = Integer.parseInt(els[3]);
        final int from = (_parseInt - 1);
        int _parseInt_1 = Integer.parseInt(els[5]);
        final int to = (_parseInt_1 - 1);
        Day5.moveSeveral(number, from, to);
      }
    };
    inputs.forEach(_function_2);
    final Function2<String, List<String>, String> _function_3 = new Function2<String, List<String>, String>() {
      public String apply(final String acc, final List<String> e) {
        String _get = e.get(0);
        return (acc + _get);
      }
    };
    InputOutput.<String>println(IterableExtensions.<List<String>, String>fold(Day5.distribution, "", _function_3));
  }

  public static void move(final int from, final int to) {
    Day5.distribution.get(to).add(0, Day5.distribution.get(from).remove(0));
  }

  public static List<String> moveSeveral(final int number, final int from, final int to) {
    List<String> _xblockexpression = null;
    {
      final List<String> listIn = Day5.distribution.get(from);
      final List<String> listOut = Day5.distribution.get(to);
      List<String> _subList = listIn.subList(0, number);
      final ArrayList<String> toMove = new ArrayList<String>(_subList);
      List<String> _subList_1 = listIn.subList(number, listIn.size());
      final ArrayList<String> toKeep = new ArrayList<String>(_subList_1);
      Day5.distribution.set(from, toKeep);
      toMove.addAll(listOut);
      _xblockexpression = Day5.distribution.set(to, toMove);
    }
    return _xblockexpression;
  }
}
