package advent2024;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day17 {
  private static final int A = 28422061;

  private static final List<Integer> program = CollectionLiterals.<Integer>newArrayList(Integer.valueOf(2), Integer.valueOf(4), Integer.valueOf(1), Integer.valueOf(1), Integer.valueOf(7), Integer.valueOf(5), Integer.valueOf(1), Integer.valueOf(5), Integer.valueOf(4), Integer.valueOf(2), Integer.valueOf(5), Integer.valueOf(5), Integer.valueOf(0), Integer.valueOf(3), Integer.valueOf(3), Integer.valueOf(0));

  private static final List<String> string_values = Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("000", "001", "010", "011", "100", "101", "110", "111"));

  public static void main(final String[] args) {
    InputOutput.<String>println(Day17.unfold_my_program(BigInteger.valueOf(Day17.A)));
    final Function2<HashSet<String>, Integer, HashSet<String>> _function = (HashSet<String> acc, Integer el) -> {
      HashSet<String> _xblockexpression = null;
      {
        final HashSet<String> ans = CollectionLiterals.<String>newHashSet();
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
    InputOutput.<BigInteger>println(IterableExtensions.<BigInteger>min(IterableExtensions.<String, BigInteger>map(IterableExtensions.<Integer, HashSet<String>>fold(ListExtensions.<Integer>reverse(Day17.program), CollectionLiterals.<String>newHashSet(""), _function), _function_1)));
  }

  public static String unfold_my_program(final BigInteger a) {
    String _xblockexpression = null;
    {
      BigInteger my_a = a;
      final ArrayList<Object> list = CollectionLiterals.<Object>newArrayList();
      while ((!my_a.equals(BigInteger.ZERO))) {
        {
          list.add(Day17.my_program(my_a));
          my_a = my_a.shiftRight(3);
        }
      }
      _xblockexpression = IterableExtensions.join(list, ",");
    }
    return _xblockexpression;
  }

  public static BigInteger my_program(final BigInteger a) {
    BigInteger _xblockexpression = null;
    {
      BigInteger reg_a = a;
      BigInteger reg_b = BigInteger.valueOf(0);
      BigInteger reg_c = BigInteger.valueOf(0);
      reg_b = reg_a.mod(BigInteger.valueOf(8)).xor(BigInteger.valueOf(1));
      reg_c = reg_a.shiftRight(reg_b.intValue());
      reg_b = reg_b.xor(BigInteger.valueOf(5)).xor(reg_c);
      _xblockexpression = reg_b.mod(BigInteger.valueOf(8));
    }
    return _xblockexpression;
  }
}
