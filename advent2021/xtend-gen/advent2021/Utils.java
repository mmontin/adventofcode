package advent2021;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Utils {
  public static class MyList<T extends Object> extends ArrayList<T> {
    public String toString() {
      final Function1<T, String> _function = new Function1<T, String>() {
        public String apply(final T x) {
          return x.toString().concat(" ∷ ");
        }
      };
      final Function2<String, String, String> _function_1 = new Function2<String, String, String>() {
        public String apply(final String x, final String y) {
          return x.concat(y);
        }
      };
      String _fold = IterableExtensions.<String, String>fold(ListExtensions.<T, String>map(this, _function), "", _function_1);
      String _plus = ("(" + _fold);
      return (_plus + "[])");
    }
  }
  
  public static final String inputs = "/media/monsieuro/Mes Données/Eclipse/adventofcode/advent2021/inputs/";
  
  public static List<String> getInputs(final int inputNumber) {
    try {
      return Files.readAllLines(Paths.get((Utils.inputs + Integer.valueOf(inputNumber))));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static <T extends Object> List<T> getInputs(final int inputNumber, final Function1<? super String, ? extends T> f) {
    final Function1<String, T> _function = new Function1<String, T>() {
      public T apply(final String x) {
        return f.apply(x);
      }
    };
    return ListExtensions.<String, T>map(Utils.getInputs(inputNumber), _function);
  }
  
  public static BufferedReader getInputReader(final int inputNumber) {
    try {
      File _file = new File((Utils.inputs + Integer.valueOf(inputNumber)));
      FileReader _fileReader = new FileReader(_file);
      return new BufferedReader(_fileReader);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
