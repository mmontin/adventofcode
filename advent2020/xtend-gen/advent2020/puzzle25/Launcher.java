package advent2020.puzzle25;

import adventutils.input.InputLoader;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  private static final List<String> input = new InputLoader(Integer.valueOf(2020), Integer.valueOf(25)).getInputs();

  private static final long DIVISOR = 20201227;

  private static final long DEVICES_SUBJECT_NUMBER = 7;

  private static final long CARD_PUBKEY = Long.parseLong(Launcher.input.get(0));

  private static final long DOOR_PUBKEY = Long.parseLong(Launcher.input.get(1));

  public static void main(final String[] args) {
    final int card_loop_size = Launcher.findLoopSize(Launcher.DEVICES_SUBJECT_NUMBER, Launcher.CARD_PUBKEY);
    InputOutput.<Long>println(Long.valueOf(Launcher.transform(Launcher.DOOR_PUBKEY, card_loop_size)));
  }

  public static long transform(final long subject_number, final int loop_size) {
    long _xblockexpression = (long) 0;
    {
      long current = 1L;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, loop_size, true);
      for (final Integer i : _doubleDotLessThan) {
        current = Launcher.transformStep(current, subject_number);
      }
      _xblockexpression = current;
    }
    return _xblockexpression;
  }

  public static long transformStep(final long current, final long subject_number) {
    long _xblockexpression = (long) 0;
    {
      long output = current;
      output = (output * subject_number);
      _xblockexpression = (output % Launcher.DIVISOR);
    }
    return _xblockexpression;
  }

  public static int findLoopSize(final long subject_number, final long expected_result) {
    int _xblockexpression = (int) 0;
    {
      long current = 1L;
      int loop_size = 0;
      while ((current != expected_result)) {
        {
          current = Launcher.transformStep(current, subject_number);
          loop_size++;
        }
      }
      _xblockexpression = loop_size;
    }
    return _xblockexpression;
  }
}
