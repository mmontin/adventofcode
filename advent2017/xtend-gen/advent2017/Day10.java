package advent2017;

import adventutils.input.InputLoader;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
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

  private static final int LIST_SIZE = 4;

  private static Day10.Link current_link = new Function0<Day10.Link>() {
    public Day10.Link apply() {
      Day10.Link _xblockexpression = null;
      {
        Day10.Link chain_head = new Day10.Link(0, null);
        Day10.Link current = chain_head;
        IntegerRange _upTo = new IntegerRange(1, Day10.LIST_SIZE);
        for (final Integer i : _upTo) {
          Day10.Link _link = new Day10.Link((i).intValue(), current);
          current = _link;
        }
        current.updateNext(chain_head);
        _xblockexpression = chain_head;
      }
      return _xblockexpression;
    }
  }.apply();

  private static int skip_size = 0;

  public static void main(final String[] args) {
    Day10.print();
    final Function1<String, Integer> _function = new Function1<String, Integer>() {
      public Integer apply(final String it) {
        return Integer.valueOf(Integer.parseInt(it));
      }
    };
    final Consumer<Integer> _function_1 = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day10.reverse((it).intValue());
        Day10.skip();
        Day10.print();
      }
    };
    ListExtensions.<String, Integer>map(((List<String>)Conversions.doWrapArray(IterableExtensions.<String>head(new InputLoader(Integer.valueOf(2017), Integer.valueOf(10)).getInputs()).split(","))), _function).forEach(_function_1);
    InputOutput.<Integer>println(Integer.valueOf((Day10.current_link.value * Day10.current_link.next.value)));
  }

  public static void print() {
    Day10.Link current = Day10.current_link;
    IntegerRange _upTo = new IntegerRange(0, Day10.LIST_SIZE);
    for (final Integer i : _upTo) {
      {
        String _plus = (Integer.valueOf(current.value) + ",");
        InputOutput.<String>print(_plus);
        current = current.next;
      }
    }
    InputOutput.println();
  }

  public static Day10.Link reverse(final int quantity) {
    Day10.Link _xifexpression = null;
    if ((quantity < Day10.LIST_SIZE)) {
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
        Day10.Link before = Day10.current_link.previous;
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, quantity, true);
        for (final Integer i_1 : _doubleDotLessThan_1) {
          {
            before.updateNext(links.get((i_1).intValue()));
            before = before.next;
          }
        }
        before.updateNext(my_current);
        _xblockexpression = Day10.current_link = my_current;
      }
      _xifexpression = _xblockexpression;
    } else {
      _xifexpression = null;
    }
    return _xifexpression;
  }

  public static void skip() {
    final Consumer<Integer> _function = new Consumer<Integer>() {
      public void accept(final Integer it) {
        Day10.current_link = Day10.current_link.next;
      }
    };
    new ExclusiveRange(0, Day10.skip_size, true).forEach(_function);
    Day10.skip_size++;
  }
}
