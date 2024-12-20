package adventutils.input;

import adventutils.geometry.Coordinate;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class InputLoader {
  private String path;

  public InputLoader(final Integer year, final Integer day) {
    this.path = ((("/home/monsieuro/adventofcode/advent" + year) + "/inputs/") + day);
  }

  public List<String> getInputs() {
    try {
      return Files.readAllLines(Paths.get(this.path));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public List<List<String>> getChars() {
    final Function1<String, String> _function = (String it) -> {
      return it;
    };
    return this.<String>getChars(_function);
  }

  public <T extends Object> List<List<T>> getChars(final Function1<? super String, ? extends T> f) {
    final Function1<String, List<T>> _function = (String it) -> {
      final Function1<Character, T> _function_1 = (Character it_1) -> {
        String _plus = (it_1 + "");
        return f.apply(_plus);
      };
      return ListExtensions.<Character, T>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    return ListExtensions.<String, List<T>>map(this.getInputs(), _function);
  }

  public <T extends Object> List<T> getInputs(final Function1<? super String, ? extends T> f) {
    final Function1<String, T> _function = (String it) -> {
      return f.apply(it);
    };
    return ListExtensions.<String, T>map(this.getInputs(), _function);
  }

  public BufferedReader getInputReader() {
    try {
      File _file = new File(this.path);
      FileReader _fileReader = new FileReader(_file);
      return new BufferedReader(_fileReader);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }

  public <T extends Object> void applyOnGrid(final Function2<? super String, Coordinate, T> f) {
    final List<List<String>> input = this.getChars();
    int _size = input.size();
    final int max_i = (_size - 1);
    int _size_1 = input.get(0).size();
    final int max_j = (_size_1 - 1);
    IntegerRange _upTo = new IntegerRange(0, max_i);
    for (final Integer i : _upTo) {
      {
        final List<String> line = input.get((i).intValue());
        IntegerRange _upTo_1 = new IntegerRange(0, max_j);
        for (final Integer j : _upTo_1) {
          String _get = line.get((j).intValue());
          Coordinate _coordinate = new Coordinate((i).intValue(), (j).intValue());
          f.apply(_get, _coordinate);
        }
      }
    }
  }
}
