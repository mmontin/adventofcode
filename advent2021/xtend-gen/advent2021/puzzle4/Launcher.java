package advent2021.puzzle4;

import adventutils.input.InputLoader;
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    try {
      final ArrayList<Integer> numbers = new ArrayList<Integer>();
      final ArrayList<Board> boards = new ArrayList<Board>();
      final BufferedReader br = new InputLoader(Integer.valueOf(2021), Integer.valueOf(4)).getInputReader();
      final Consumer<String> _function = (String s) -> {
        numbers.add(Integer.valueOf(Integer.parseInt(s)));
      };
      ((List<String>)Conversions.doWrapArray(br.readLine().split(","))).forEach(_function);
      while (br.ready()) {
        Board _board = new Board(br);
        boards.add(_board);
      }
      try {
        final Consumer<Integer> _function_1 = (Integer n) -> {
          final Consumer<Board> _function_2 = (Board b) -> {
            try {
              b.play((n).intValue());
            } catch (Throwable _e) {
              throw Exceptions.sneakyThrow(_e);
            }
          };
          boards.forEach(_function_2);
        };
        numbers.forEach(_function_1);
      } catch (final Throwable _t) {
        if (_t instanceof CompletedException) {
          final CompletedException ce = (CompletedException)_t;
          InputOutput.<Integer>println(ce.result);
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
      final Consumer<Integer> _function_1 = (Integer n) -> {
        int i = 0;
        while ((i < boards.size())) {
          {
            try {
              boards.get(i).play((n).intValue());
            } catch (final Throwable _t) {
              if (_t instanceof CompletedException) {
                final CompletedException ce = (CompletedException)_t;
                int _size = boards.size();
                boolean _equals = (_size == 1);
                if (_equals) {
                  InputOutput.<Integer>println(ce.result);
                }
                boards.remove(i);
                i--;
              } else {
                throw Exceptions.sneakyThrow(_t);
              }
            }
            i++;
          }
        }
      };
      numbers.forEach(_function_1);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
