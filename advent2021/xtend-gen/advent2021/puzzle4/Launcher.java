package advent2021.puzzle4;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;

import adventutils.input.InputLoader;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    try {
      final ArrayList<Integer> numbers = new ArrayList<Integer>();
      final ArrayList<Board> boards = new ArrayList<Board>();
      final BufferedReader br = new InputLoader(Integer.valueOf(2021), Integer.valueOf(4)).getInputReader();
      final Consumer<String> _function = new Consumer<String>() {
        public void accept(final String s) {
          numbers.add(Integer.valueOf(Integer.parseInt(s)));
        }
      };
      ((List<String>)Conversions.doWrapArray(br.readLine().split(","))).forEach(_function);
      while (br.ready()) {
        Board _board = new Board(br);
        boards.add(_board);
      }
      try {
        final Consumer<Integer> _function_1 = new Consumer<Integer>() {
          public void accept(final Integer n) {
            final Consumer<Board> _function = new Consumer<Board>() {
              public void accept(final Board b) {
                try {
                  b.play((n).intValue());
                } catch (Throwable _e) {
                  throw Exceptions.sneakyThrow(_e);
                }
              }
            };
            boards.forEach(_function);
          }
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
      final Consumer<Integer> _function_1 = new Consumer<Integer>() {
        public void accept(final Integer n) {
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
        }
      };
      numbers.forEach(_function_1);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
