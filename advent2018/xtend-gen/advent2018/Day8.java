package advent2018;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day8 {
  public static class Node {
    public final List<Integer> metadata;

    public final List<Day8.Node> children;

    public Node() {
      this.metadata = CollectionLiterals.<Integer>newArrayList();
      this.children = CollectionLiterals.<Day8.Node>newArrayList();
    }

    public int totalValue() {
      final Function2<Integer, Integer, Integer> _function = (Integer i, Integer j) -> {
        return Integer.valueOf(((i).intValue() + (j).intValue()));
      };
      final Function2<Integer, Day8.Node, Integer> _function_1 = (Integer acc, Day8.Node v) -> {
        int _talValue = v.totalValue();
        return Integer.valueOf(((acc).intValue() + _talValue));
      };
      return (int) IterableExtensions.<Day8.Node, Integer>fold(this.children, IterableExtensions.<Integer>reduce(this.metadata, _function), _function_1);
    }

    public int partialValue() {
      Integer _xifexpression = null;
      int _size = this.children.size();
      boolean _equals = (_size == 0);
      if (_equals) {
        _xifexpression = Integer.valueOf(this.totalValue());
      } else {
        final Function2<Integer, Integer, Integer> _function = (Integer acc, Integer v) -> {
          int _xtrycatchfinallyexpression = (int) 0;
          try {
            int _partialValue = this.children.get(((v).intValue() - 1)).partialValue();
            _xtrycatchfinallyexpression = _partialValue;
          } catch (final Throwable _t) {
            if (_t instanceof IndexOutOfBoundsException) {
              _xtrycatchfinallyexpression = 0;
            } else {
              throw Exceptions.sneakyThrow(_t);
            }
          }
          return Integer.valueOf(((acc).intValue() + _xtrycatchfinallyexpression));
        };
        _xifexpression = IterableExtensions.<Integer, Integer>fold(this.metadata, Integer.valueOf(0), _function);
      }
      return (_xifexpression).intValue();
    }
  }

  private static List<Integer> numbers = new ArrayList<Integer>(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2018), Integer.valueOf(8)).getInputs()).split(" "))), ((Function1<String, Integer>) (String it) -> {
    return Integer.valueOf(Integer.parseInt(it));
  })));

  public static void main(final String[] args) {
    final Day8.Node root = Day8.parseNode();
    InputOutput.<Integer>println(Integer.valueOf(root.totalValue()));
    InputOutput.<Integer>println(Integer.valueOf(root.partialValue()));
  }

  public static Day8.Node parseNode() {
    Day8.Node _xblockexpression = null;
    {
      final Integer nb_of_children = Day8.numbers.remove(0);
      final Integer nb_of_metadata = Day8.numbers.remove(0);
      final Day8.Node next_node = new Day8.Node();
      final Consumer<Integer> _function = (Integer it) -> {
        next_node.children.add(Day8.parseNode());
      };
      new ExclusiveRange(0, (nb_of_children).intValue(), true).forEach(_function);
      final Consumer<Integer> _function_1 = (Integer it) -> {
        next_node.metadata.add(Day8.numbers.remove(0));
      };
      new ExclusiveRange(0, (nb_of_metadata).intValue(), true).forEach(_function_1);
      _xblockexpression = next_node;
    }
    return _xblockexpression;
  }
}
