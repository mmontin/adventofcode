package advent2024;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day17 {
  private static final List<Integer> program = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(2), Integer.valueOf(4), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(7), Integer.valueOf(5), Integer.valueOf(1), Integer.valueOf(5), Integer.valueOf(4), Integer.valueOf(2), Integer.valueOf(5), Integer.valueOf(5), Integer.valueOf(0), Integer.valueOf(3), Integer.valueOf(3), Integer.valueOf(0));

  private static final List<String> string_values = Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("000", "001", "010", "011", "100", "101", "110", "111"));

  public static void main(final String[] args) {
    InputOutput.<String>println(IterableExtensions.join(Day17.unfold_my_program(BigInteger.valueOf(28422061)), ","));
    final Function2<ArrayList<String>, Integer, ArrayList<String>> _function = (ArrayList<String> acc, Integer el) -> {
      ArrayList<String> _xblockexpression = null;
      {
        final ArrayList<String> ans = CollectionLiterals.<String>newArrayList();
        for (final String el_set : acc) {
          for (final String string_value : Day17.string_values) {
            {
              final String current_candidate = (el_set + string_value);
              boolean _equals = Day17.my_program(new BigInteger(current_candidate, 2)).equals(BigInteger.valueOf((el).intValue()));
              if (_equals) {
                ans.add(current_candidate);
              }
            }
          }
        }
        _xblockexpression = ans;
      }
      return _xblockexpression;
    };
    final Function1<String, BigInteger> _function_1 = (String it) -> {
      return new BigInteger(it, 2);
    };
    InputOutput.<BigInteger>println(IterableExtensions.<BigInteger>min(ListExtensions.<String, BigInteger>map(IterableExtensions.<Integer, ArrayList<String>>fold(ListExtensions.<Integer>reverse(Day17.program), CollectionLiterals.<String>newArrayList(""), _function), _function_1)));
  }

  public static ArrayList<BigInteger> unfold_my_program(final BigInteger a) {
    ArrayList<BigInteger> _xblockexpression = null;
    {
      BigInteger my_a = a;
      final ArrayList<BigInteger> list = CollectionLiterals.<BigInteger>newArrayList();
      while ((!my_a.equals(BigInteger.ZERO))) {
        {
          list.add(Day17.my_program(my_a));
          my_a = my_a.shiftRight(3);
        }
      }
      _xblockexpression = list;
    }
    return _xblockexpression;
  }

  public static BigInteger my_program(final BigInteger a) {
    BigInteger _xblockexpression = null;
    {
      BigInteger reg_b = a.mod(BigInteger.valueOf(8)).xor(BigInteger.valueOf(1));
      _xblockexpression = reg_b.xor(BigInteger.valueOf(5)).xor(a.shiftRight(reg_b.intValue())).mod(BigInteger.valueOf(8));
    }
    return _xblockexpression;
  }
}
