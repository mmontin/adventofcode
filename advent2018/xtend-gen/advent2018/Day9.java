package advent2018;

import java.util.Map;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day9 {
  public static class Link {
    public int value;

    public Day9.Link next;

    public Day9.Link previous;

    public Link(final int _value, final Day9.Link _previous) {
      this.value = _value;
      this.next = null;
      if ((_previous != null)) {
        _previous.next = this;
      }
      this.previous = _previous;
    }

    public Day9.Link updateNext(final Day9.Link _next) {
      Day9.Link _xblockexpression = null;
      {
        this.next = _next;
        _xblockexpression = _next.previous = this;
      }
      return _xblockexpression;
    }

    public Day9.Link insertRight(final Day9.Link to_insert) {
      Day9.Link _xblockexpression = null;
      {
        Day9.Link prev = this.next;
        this.updateNext(to_insert);
        _xblockexpression = to_insert.updateNext(prev);
      }
      return _xblockexpression;
    }

    public int removeRight() {
      int _xblockexpression = (int) 0;
      {
        final Day9.Link new_right = this.next.next;
        final int output = this.next.value;
        this.updateNext(new_right);
        _xblockexpression = output;
      }
      return _xblockexpression;
    }

    @Override
    public String toString() {
      return Integer.valueOf(this.value).toString();
    }
  }

  private static final int number_of_players = 400;

  private static final int last_marble_1 = 71864;

  private static final int last_marble_2 = (Day9.last_marble_1 * 100);

  public static void main(final String[] args) {
    Day9.Link current_marble = new Day9.Link(0, null);
    current_marble.updateNext(current_marble);
    int current_player = 0;
    Map<Integer, Long> scores = CollectionLiterals.<Integer, Long>newHashMap();
    IntegerRange _upTo = new IntegerRange(1, Day9.last_marble_2);
    for (final Integer i : _upTo) {
      {
        if (((i).intValue() == Day9.last_marble_1)) {
          InputOutput.<Long>println(IterableExtensions.<Long>max(scores.values()));
        }
        if ((((i).intValue() % 23) == 0)) {
          IntegerRange _upTo_1 = new IntegerRange(0, 7);
          for (final Integer j : _upTo_1) {
            current_marble = current_marble.previous;
          }
          int _removeRight = current_marble.removeRight();
          long _plus = (((long) (i).intValue()) + _removeRight);
          final BiFunction<Long, Long, Long> _function = (Long u, Long v) -> {
            return Long.valueOf(((u).longValue() + (v).longValue()));
          };
          scores.merge(Integer.valueOf(current_player), Long.valueOf(_plus), _function);
          current_marble = current_marble.next;
        } else {
          current_marble = current_marble.next;
          Day9.Link _link = new Day9.Link((i).intValue(), null);
          current_marble.insertRight(_link);
          current_marble = current_marble.next;
        }
        current_player++;
        int _current_player = current_player;
        current_player = (_current_player % Day9.number_of_players);
      }
    }
    InputOutput.<Long>println(IterableExtensions.<Long>max(scores.values()));
  }
}
