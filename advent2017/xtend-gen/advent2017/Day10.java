package advent2017;

import adventutils.input.InputLoader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Day10 {
  public static class Link {
    public int value;

    public Day10.Link next;

    public Day10.Link previous;

    public Link(final int _value, final Day10.Link _previous) {
      this.value = _value;
      this.next = null;
      if ((_previous != null)) {
        _previous.next = this;
      }
      this.previous = _previous;
    }

    public Day10.Link updateNext(final Day10.Link _next) {
      Day10.Link _xblockexpression = null;
      {
        this.next = _next;
        _xblockexpression = _next.previous = this;
      }
      return _xblockexpression;
    }

    public String toString() {
      return Integer.valueOf(this.value).toString();
    }
  }

  private static final int LIST_SIZE = 256;

  private static Day10.Link current_link = null;

  public static Day10.Link init() {
    Day10.Link _xblockexpression = null;
    {
      Day10.Link chain_head = new Day10.Link(0, null);
      Day10.Link current = chain_head;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(1, Day10.LIST_SIZE, true);
      for (final Integer i : _doubleDotLessThan) {
        Day10.Link _link = new Day10.Link((i).intValue(), current);
        current = _link;
      }
      current.updateNext(chain_head);
      _xblockexpression = Day10.current_link = chain_head;
    }
    return _xblockexpression;
  }

  private static int skip_size = 0;

  private static int moved = 0;

  public static void main(final String[] args) {
    String input = IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(10)).getInputs());
    Day10.init();
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String it) {
        return Integer.valueOf(Integer.parseInt(it));
      }
    };
    final Consumer<Integer> _function_1 = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day10.reverse((it).intValue());
        int _moved = Day10.moved;
        Day10.moved = (_moved + (((it).intValue() + Day10.skip_size) % Day10.LIST_SIZE));
        Day10.skip();
      }
    };
    ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(input.split(","))), _function).forEach(_function_1);
    Day10.Link toPrint = Day10.current_link;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Day10.moved, true);
    for (final Integer i : _doubleDotLessThan) {
      toPrint = toPrint.previous;
    }
    InputOutput.<Integer>println(Integer.valueOf((toPrint.value * toPrint.next.value)));
    Day10.init();
    final Function1<Character, Integer> _function_2 = new Function1<Character, Integer>() {
      public Integer apply(final Character it) {
        return Integer.valueOf(((int) (it).charValue()));
      }
    };
    List<Integer> _map = ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(input.toCharArray())), _function_2);
    final ArrayList<Integer> second_pass = new ArrayList<Integer>(_map);
    second_pass.addAll(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(17), Integer.valueOf(31), Integer.valueOf(73), Integer.valueOf(47), Integer.valueOf(23)));
    Day10.skip_size = 0;
    Day10.moved = 0;
    final Consumer<Integer> _function_3 = new Consumer<Integer>() {
      public void accept(final Integer it) {
        final Consumer<Integer> _function = new Consumer<Integer>() {
          public void accept(final Integer it_1) {
            Day10.reverse((it_1).intValue());
            int _moved = Day10.moved;
            Day10.moved = (_moved + (((it_1).intValue() + Day10.skip_size) % Day10.LIST_SIZE));
            Day10.skip();
          }
        };
        second_pass.forEach(_function);
      }
    };
    new ExclusiveRange(0, 64, true).forEach(_function_3);
    toPrint = Day10.current_link;
    ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, Day10.moved, true);
    for (final Integer i_1 : _doubleDotLessThan_1) {
      toPrint = toPrint.previous;
    }
    final ArrayList<Integer> numbers = CollectionLiterals.<Integer>newArrayList();
    IntegerRange _upTo = new IntegerRange(0, 15);
    for (final Integer i_2 : _upTo) {
      {
        int result = toPrint.value;
        IntegerRange _upTo_1 = new IntegerRange(0, 14);
        for (final Integer j : _upTo_1) {
          {
            toPrint = toPrint.next;
            result = (result ^ toPrint.value);
          }
        }
        toPrint = toPrint.next;
        numbers.add(Integer.valueOf(result));
      }
    }
    final Function1<Integer, String> _function_4 = new Function1<Integer, String>() {
      public String apply(final Integer it) {
        return Integer.toHexString((it).intValue());
      }
    };
    InputOutput.<String>print(IterableExtensions.join(ListExtensions.<Integer, String>map(numbers, _function_4), ""));
  }

  public static void print() {
    Day10.Link current = Day10.current_link;
    ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, Day10.LIST_SIZE, true);
    for (final Integer i : _doubleDotLessThan) {
      {
        String _plus = (Integer.valueOf(current.value) + ",");
        InputOutput.<String>print(_plus);
        current = current.next;
      }
    }
    InputOutput.println();
  }

  public static Day10.Link reverse(final int quantity) {
    Day10.Link _xblockexpression = null;
    {
      final LinkedList<Day10.Link> links = CollectionLiterals.<Day10.Link>newLinkedList();
      Day10.Link my_current = Day10.current_link;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, quantity, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          links.addFirst(my_current);
          my_current = my_current.next;
        }
      }
      Day10.Link _xifexpression = null;
      if ((quantity < Day10.LIST_SIZE)) {
        Day10.Link _xblockexpression_1 = null;
        {
          Day10.Link before = Day10.current_link.previous;
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, quantity, true);
          for (final Integer i_1 : _doubleDotLessThan_1) {
            {
              before.updateNext(links.get((i_1).intValue()));
              before = before.next;
            }
          }
          before.updateNext(my_current);
          _xblockexpression_1 = Day10.current_link = my_current;
        }
        _xifexpression = _xblockexpression_1;
      } else {
        Day10.Link _xblockexpression_2 = null;
        {
          final Consumer<Day10.Link> _function = new Consumer<Day10.Link>() {
            public void accept(final Day10.Link it) {
              Day10.Link tmp = it.previous;
              it.previous = it.next;
              it.next = tmp;
            }
          };
          links.forEach(_function);
          _xblockexpression_2 = Day10.current_link = IterableExtensions.<Day10.Link>head(links);
        }
        _xifexpression = _xblockexpression_2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static void skip() {
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day10.current_link = Day10.current_link.next;
      }
    };
    new ExclusiveRange(0, Day10.skip_size, true).forEach(_function);
    Day10.skip_size = ((Day10.skip_size + 1) % Day10.LIST_SIZE);
  }
}
