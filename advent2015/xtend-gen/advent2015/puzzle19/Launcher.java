package advent2015.puzzle19;

import adventutils.input.InputLoader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Launcher {
  private static Map<String, String> transformations = new HashMap<String, String>();

  private static List<String> patterns;

  public static void main(final String[] args) {
    final List<String> inputs = new InputLoader(Integer.valueOf(2015), Integer.valueOf(19)).getInputs();
    String molecule = inputs.get(0);
    inputs.remove(0);
    final Consumer<String> _function = (String it) -> {
      final String[] split = it.split(" => ");
      Launcher.transformations.put(split[1], split[0]);
    };
    inputs.forEach(_function);
    final Function1<String, Integer> _function_1 = (String it) -> {
      return Integer.valueOf(it.length());
    };
    Launcher.patterns = ListExtensions.<String>reverse(IterableExtensions.<String, Integer>sortBy(IterableExtensions.<String>toList(Launcher.transformations.keySet()), _function_1));
    int result = 0;
    while ((!molecule.equals("e"))) {
      {
        final String mols = molecule;
        final Function1<String, Boolean> _function_2 = (String it) -> {
          return Boolean.valueOf(mols.contains(it));
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
  }
}
