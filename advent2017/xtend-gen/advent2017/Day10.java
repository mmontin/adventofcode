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

  private static final String input = IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(10)).getInputs());

  private static final int LIST_SIZE = 256;

  private static Day10.Link current_link = null;

  private static int skip_size;

  private static int moved;

  public static int init() {
    int _xblockexpression = (int) 0;
    {
      Day10.Link chain_head = new Day10.Link(0, null);
      Day10.Link current = chain_head;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(1, Day10.LIST_SIZE, true);
      for (final Integer i : _doubleDotLessThan) {
        Day10.Link _link = new Day10.Link((i).intValue(), current);
        current = _link;
      }
      current.updateNext(chain_head);
      Day10.current_link = chain_head;
      Day10.skip_size = 0;
      _xblockexpression = Day10.moved = 0;
    }
    return _xblockexpression;
  }

  public static Day10.Link move(final Day10.Link current_link, final int moved) {
    Day10.Link _xblockexpression = null;
    {
      Day10.Link output = current_link;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, moved, true);
      for (final Integer i : _doubleDotLessThan) {
        output = output.previous;
      }
      _xblockexpression = output;
    }
    return _xblockexpression;
  }

  public static int firstPart(final List<Integer> input) {
    int _xblockexpression = (int) 0;
    {
      Day10.init();
      Day10.round(input);
      Day10.Link toPrint = Day10.move(Day10.current_link, Day10.moved);
      _xblockexpression = (toPrint.value * toPrint.next.value);
    }
    return _xblockexpression;
  }

  public static ArrayList<Integer> knotHash(final String input) {
    ArrayList<Integer> _xblockexpression = null;
    {
      Day10.init();
      final Function1<Character, Integer> _function = new Function1<Character, Integer>() {
        public Integer apply(final Character it) {
          return Integer.valueOf(((int) (it).charValue()));
        }
      };
      List<Integer> _map = ListExtensions.<Character, Integer>map(((List<Character>)Conversions.doWrapArray(input.toCharArray())), _function);
      final ArrayList<Integer> second_pass = new ArrayList<Integer>(_map);
      second_pass.addAll(CollectionLiterals.<Integer>newArrayList(Integer.valueOf(17), Integer.valueOf(31), Integer.valueOf(73), Integer.valueOf(47), Integer.valueOf(23)));
      final Consumer<Integer> _function_1 = new Consumer<Integer>() {
        public void accept(final Integer it) {
          Day10.round(second_pass);
        }
      };
      new ExclusiveRange(0, 64, true).forEach(_function_1);
      Day10.Link toPrint = Day10.move(Day10.current_link, Day10.moved);
      final ArrayList<Integer> numbers = CollectionLiterals.<Integer>newArrayList();
      IntegerRange _upTo = new IntegerRange(0, 15);
      for (final Integer i : _upTo) {
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
      _xblockexpression = numbers;
    }
    return _xblockexpression;
  }

  public static void main(final String[] args) {
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String it) {
        return Integer.valueOf(Integer.parseInt(it));
      }
    };
    InputOutput.<Integer>println(Integer.valueOf(Day10.firstPart(ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(Day10.input.split(","))), _function))));
    final Function1<Integer, String> _function_1 = new Function1<Integer, String>() {
      public String apply(final Integer it) {
        return String.format("%02x", it);
      }
    };
    InputOutput.<String>println(IterableExtensions.join(ListExtensions.<Integer, String>map(Day10.knotHash(Day10.input), _function_1), ""));
  }

  public static void round(final List<Integer> input) {
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day10.current_link = Day10.reverse(Day10.current_link, (it).intValue());
        int _moved = Day10.moved;
        Day10.moved = (_moved + (((it).intValue() + Day10.skip_size) % Day10.LIST_SIZE));
        Day10.current_link = Day10.skip(Day10.current_link, Day10.skip_size);
        Day10.skip_size = ((Day10.skip_size + 1) % Day10.LIST_SIZE);
      }
    };
    input.forEach(_function);
  }

  public static Day10.Link reverse(final Day10.Link current_link, final int quantity) {
    Day10.Link _xblockexpression = null;
    {
      final LinkedList<Day10.Link> links = CollectionLiterals.<Day10.Link>newLinkedList();
      Day10.Link my_current = current_link;
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
          Day10.Link before = current_link.previous;
          ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, quantity, true);
          for (final Integer i_1 : _doubleDotLessThan_1) {
            {
              before.updateNext(links.get((i_1).intValue()));
              before = before.next;
            }
          }
          before.updateNext(my_current);
          _xblockexpression_1 = my_current;
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
          _xblockexpression_2 = IterableExtensions.<Day10.Link>head(links);
        }
        _xifexpression = _xblockexpression_2;
      }
      _xblockexpression = _xifexpression;
    }
    return _xblockexpression;
  }

  public static Day10.Link skip(final Day10.Link current_link, final int skip_size) {
    Day10.Link _xblockexpression = null;
    {
      Day10.Link new_link = current_link;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, skip_size, true);
      for (final Integer i : _doubleDotLessThan) {
        new_link = new_link.next;
      }
      _xblockexpression = new_link;
    }
    return _xblockexpression;
  }
}
