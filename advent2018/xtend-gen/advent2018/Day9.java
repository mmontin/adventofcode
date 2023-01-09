package advent2018;

import adventutils.list.Link;
import java.util.HashMap;
import java.util.function.BiFunction;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Day9 {
  private static final int number_of_players = 400;

  private static final int last_marble_1 = 71864;

  private static final int last_marble_2 = (Day9.last_marble_1 * 100);

  public static void main(final String[] args) {
    Link<Integer> current_marble = new Link<Integer>(Integer.valueOf(0), null);
    current_marble.updateNext(current_marble);
    int current_player = 0;
    HashMap<Integer, Long> scores = CollectionLiterals.<Integer, Long>newHashMap();
    IntegerRange _upTo = new IntegerRange(1, Day9.last_marble_2);
    for (final Integer i : _upTo) {
      {
        if (((i).intValue() == Day9.last_marble_1)) {
          InputOutput.<Long>println(IterableExtensions.<Long>max(scores.values()));
        }
        if ((((i).intValue() % 23) == 0)) {
          current_marble = current_marble.get((-8));
          Integer _removeRight = current_marble.removeRight();
          long _plus = (((long) (i).intValue()) + (_removeRight).intValue());
          final BiFunction<Long, Long, Long> _function = (Long u, Long v) -> {
            return Long.valueOf(((u).longValue() + (v).longValue()));
          };
          scores.merge(Integer.valueOf(current_player), Long.valueOf(_plus), _function);
          current_marble = current_marble.next;
        } else {
          current_marble = current_marble.next;
          Link<Integer> _link = new Link<Integer>(i, null);
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
