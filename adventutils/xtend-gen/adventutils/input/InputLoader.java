package adventutils.input;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
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
    final Function1<String, List<String>> _function = (String it) -> {
      final Function1<Character, String> _function_1 = (Character it_1) -> {
        return (it_1 + "");
      };
      return ListExtensions.<Character, String>map(((List<Character>)Conversions.doWrapArray(it.toCharArray())), _function_1);
    };
    return ListExtensions.<String, List<String>>map(this.getInputs(), _function);
  }

  public <T extends Object> List<T> getInputs(final Function1<? super String, ? extends T> f) {
    final Function1<String, T> _function = (String x) -> {
      return f.apply(x);
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
}
