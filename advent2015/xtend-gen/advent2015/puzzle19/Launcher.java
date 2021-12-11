package advent2015.puzzle19;

import advent2015.Utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Map<String, String> transformations = new HashMap<String, String>();
  
  private static List<String> patterns;
  
  public static void main(final String[] args) {
    try {
      final List<String> inputs = Utils.getInputs(19);
      String molecule = inputs.get(0);
      inputs.remove(0);
      final Consumer<String> _function = new Consumer<String>() {
        public void accept(final String it) {
          final String[] split = it.split(" => ");
          Launcher.transformations.put(split[1], split[0]);
        }
      };
      inputs.forEach(_function);
      final Function1<String, Integer> _function_1 = new Function1<String, Integer>() {
        public Integer apply(final String it) {
          return Integer.valueOf(it.length());
        }
      };
      Launcher.patterns = ListExtensions.<String>reverse(IterableExtensions.<String, Integer>sortBy(IterableExtensions.<String>toList(Launcher.transformations.keySet()), _function_1));
      int result = 0;
      while ((!molecule.equals("e"))) {
        {
          final String mols = molecule;
          final Function1<String, Boolean> _function_2 = new Function1<String, Boolean>() {
            public Boolean apply(final String it) {
              return Boolean.valueOf(mols.contains(it));
            }
          };
          final String pat = IterableExtensions.<String>findFirst(Launcher.patterns, _function_2);
          if ((pat != null)) {
            molecule = molecule.replaceAll(pat, Launcher.transformations.get(pat));
            int _result = result;
            int _size = ((List<String>)Conversions.doWrapArray(mols.split(pat, (-1)))).size();
            int _minus = (_size - 1);
            result = (_result + _minus);
          }
        }
      }
      InputOutput.<Integer>println(Integer.valueOf(result));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
